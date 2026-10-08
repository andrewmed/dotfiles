DOMAIN := gui/$(shell id -u)
AGENTS := $(HOME)/Library/LaunchAgents
SERVICES := sing-box ollama limactl mutagen

.PHONY: install uninstall status

install: uninstall
	mkdir -p $(AGENTS)
	@for s in $(SERVICES); do \
		bin=$$(command -v $$s) || { echo "$$s: not on PATH, skipped"; continue; }; \
		sed -e "s|__BIN__|$$bin|g" -e "s|__HOME__|$(HOME)|g" $$s.plist.in > $(AGENTS)/org.andmed.$$s.plist; \
		launchctl bootstrap $(DOMAIN) $(AGENTS)/org.andmed.$$s.plist; \
	done

uninstall:
	@for s in $(SERVICES); do \
		launchctl bootout $(DOMAIN)/org.andmed.$$s 2>/dev/null; \
		while launchctl print $(DOMAIN)/org.andmed.$$s >/dev/null 2>&1; do sleep 1; done; \
		rm -f $(AGENTS)/org.andmed.$$s.plist; \
	done

status:
	@printf '%-10s %-11s %-5s %s\n' SERVICE AGENT EXIT PID
	@for s in $(SERVICES); do \
		case $$s in \
			sing-box) proc='sing-box run' ;; \
			ollama) proc='ollama serve' ;; \
			limactl) proc='limactl hostagent' ;; \
			mutagen) proc='mutagen daemon run' ;; \
			*) proc=$$s ;; \
		esac; \
		code=$$(launchctl list | awk -v l=org.andmed.$$s '$$3 == l { print $$2 }'); \
		[ -n "$$code" ] && agent=loaded || agent='not loaded'; \
		pid=$$(pgrep -f "$$proc" | paste -sd, -); \
		printf '%-10s %-11s %-5s %s\n' "$$s" "$$agent" "$${code:--}" "$${pid:--}"; \
	done

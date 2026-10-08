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
	@for s in $(SERVICES); do \
		launchctl list | grep org.andmed.$$s || echo "org.andmed.$$s: not loaded"; \
	done

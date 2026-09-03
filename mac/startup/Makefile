LABEL := org.andmed.startup
DOMAIN := gui/$(shell id -u)
PLIST := $(HOME)/Library/LaunchAgents/$(LABEL).plist
LOG := $(HOME)/Library/Logs/$(LABEL).log

.PHONY: install uninstall status

install: uninstall
	chmod +x $(CURDIR)/startup.sh
	mkdir -p $(dir $(PLIST))
	sed -e 's|__LABEL__|$(LABEL)|g' \
	    -e 's|__SCRIPT__|$(CURDIR)/startup.sh|g' \
	    -e 's|__LOG__|$(LOG)|g' \
	    agent.plist.in > $(PLIST)
	launchctl bootstrap $(DOMAIN) $(PLIST)

uninstall:
	-launchctl bootout $(DOMAIN)/$(LABEL) 2>/dev/null
	@while launchctl print $(DOMAIN)/$(LABEL) >/dev/null 2>&1; do sleep 1; done
	rm -f $(PLIST)

status:
	@launchctl list | grep $(LABEL) || echo "$(LABEL): not loaded"
	@pgrep -fl "startup.sh|sing-box run|ollama serve" || echo "no services running"
	@tail -5 $(LOG)

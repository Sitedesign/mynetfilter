# Makefile for mynetfilter

BIN_DIR = $(DESTDIR)/sbin
CNF_DIR = $(DESTDIR)/etc/mynetfilter

INSTALL = install

.PHONY: install

all:

install:
	if (test ! -d $(BIN_DIR)); then mkdir -p $(BIN_DIR) ; fi
	$(INSTALL) mynetfilter $(BIN_DIR)
	$(INSTALL) mynetfilter-ddns $(BIN_DIR)
	chmod 700 $(BIN_DIR)/mynetfilter
	chmod 700 $(BIN_DIR)/mynetfilter-ddns
	if (test ! -d $(CNF_DIR)); then mkdir -p $(CNF_DIR) ; fi
	$(INSTALL) iptables.* $(CNF_DIR)
	$(INSTALL) iptmods.conf $(CNF_DIR)
	$(INSTALL) ddns.conf $(CNF_DIR)
	chmod 600 $(CNF_DIR)/*

uninstall:
	rm -f $(BIN_DIR)/mynetfilter
	rm -f $(BIN_DIR)/mynetfilter-ddns

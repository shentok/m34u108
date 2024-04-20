#!/bin/bash

zstdcat trace/output16.txt.zst | grep -e 0x2aaa -e 0x5555 -e pci_cfg > /tmp/eeprom_init_1000_9658.log

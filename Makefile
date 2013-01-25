

RPATH=/home/root/Replicape
REMOTE=root@10.24.2.129


.PHONY : scripts

eeprom:
	scp tools/replicape.json tools/eeprom_upload.py Makefile $(REMOTE):$(RPATH)/eeprom
	ssh $(REMOTE) 'cd Replicape/eeprom; make eeprom_upload'

eeprom_upload: 
	node ./eeprom.js -w replicape.json
	python eeprom_upload.py

eeprom_cat:
	node ./eeprom.js -w replicape.json
	cat Replicape.eeprom > /sys/bus/i2c/drivers/at24/3-0050/eeprom

scripts:
	scp scripts/*.py $(REMOTE):$(RPATH)/scripts

minicom:
	minicom -o -b 115200 -D /dev/ttyUSB1

pru_firmware:
	scp -r PRU/PyPRUSS/firmware $(REMOTE):$(RPATH)/libs/PyPRUSS/
	ssh $(REMOTE) 'cd $(RPATH)/libs/PyPRUSS/firmware; make && make install'

pypruss: 
	scp -r PRU/PyPRUSS $(REMOTE):$(RPATH)/libs/
	ssh $(REMOTE) 'cd $(RPATH)/libs/PyPRUSS; make && make install'

OPENSSL_DIR=/opt/homebrew/Cellar/openssl@3/3.3.1
linux: 
	gcc -o vfdecrypt vfdecrypt.c -lcrypto
mac:
	clang -o vfdecrypt vfdecrypt.c -I$(OPENSSL_DIR)/include -L$(OPENSSL_DIR)/lib -w -lcrypto -DMAC_OSX
install: 
	cp ./vfdecrypt /usr/local/bin
	ldconfig
uninstall:
	rm -rf /usr/local/bin/vfdecrypt
clean:
	rm -rf ./vfdecrypt

linux: 
	gcc -o vfdecrypt vfdecrypt.c -lcrypto
mac:
	clang -o vfdecrypt vfdecrypt.c -L/usr/local/opt/openssl@1.1/lib -w -lcrypto -DMAC_OSX
install: 
	cp ./vfdecrypt /usr/local/bin
	ldconfig
uninstall:
	rm -rf /usr/local/bin/vfdecrypt
clean:
	rm -rf ./vfdecrypt

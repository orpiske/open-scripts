install: 
	install -m755 notify-pushover.sh /usr/bin/notify-pushover
	install -d /etc/orpiske/notify-pushover
	install -m644 notify-pushover.conf.sample /etc/orpiske/notify-pushover
	install -m644 LICENSE.txt /etc/orpiske/notify-pushover

uninstall:
	rm /usr/bin/notify-pushover
	rm -rf /etc/orpiske/notify-pushover

all: install


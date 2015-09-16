HOME=/home/urbain
TARGETS=$(HOME)/.offlineimaprc $(HOME)/.offlineimap.py

all : $(TARGETS)

$(HOME)/.offlineimaprc :
	ln -s  $(PWD)/offlineimaprc $@

$(HOME)/.offlineimap.py :
	ln -s  $(PWD)/offlineimap.py $@

clean :
	rm -f $(TARGETS)

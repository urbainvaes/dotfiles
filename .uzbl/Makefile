HOME=/home/urbain
TARGETS=$(addprefix $(HOME)/,.config/uzbl .local/share/uzbl/bookmarks)

all : $(TARGETS)

$(HOME)/.config/uzbl :
	rm -f $@ && ln -s $(PWD) $@

$(HOME)/.local/share/uzbl/bookmarks :
	rm -f $@ && ln -s $(PWD)/bookmarks $@

clean :
	rm -f $(TARGETS)

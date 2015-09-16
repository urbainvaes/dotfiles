HOME=/home/urbain
TARGETS=$(addprefix $(HOME)/,.vimrc .nvimrc .vim .nvim .vim/vimundo)

all : $(TARGETS)

$(HOME)/.vimrc :
	rm -f $@ && ln -s $(PWD)/vimrc $@

$(HOME)/.nvimrc :
	rm -f $@ && ln -s $(PWD)/vimrc $@

$(HOME)/.vim :
	rm -f $@ && ln -s $(PWD) $@

$(HOME)/.nvim :
	rm -f $@ && ln -s $(PWD) $@

$(HOME)/.vim/vimundo :
	mkdir -p $@

clean :
	rm -f $(TARGETS)

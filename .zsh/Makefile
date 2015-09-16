HOME=/home/urbain
TARGETS=$(addprefix $(HOME)/,.zsh .zshrc)

all : $(TARGETS)

$(HOME)/.zshrc :
	rm -f $@ && ln -s $(PWD)/zshrc $@

$(HOME)/.zsh :
	rm -f $@ && ln -s $(PWD) $@

clean :
	rm -f $(TARGETS)

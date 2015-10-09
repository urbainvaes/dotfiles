HOME=/home/urbain
TARGETS=$(addprefix $(HOME)/,.zsh .zshrc .zgen)

all : $(TARGETS)

$(HOME)/.zshrc :
	rm -f $@ && ln -s $(PWD)/zshrc $@

$(HOME)/.zsh :
	rm -f $@ && ln -s $(PWD) $@

$(HOME)/.zgen :
	rm -f $@ && ln -s $(PWD)/zgen $@

clean :
	rm -f $(TARGETS)

HOME=/home/urbain
TARGETS=$(addprefix $(HOME)/,.zsh .zshrc .zgen)

all : $(TARGETS)

$(HOME)/.zshrc :
	rm -f $@ && ln -s $(PWD)/zshrc $@

$(HOME)/.zsh :
	rm -f $@ && ln -s $(PWD) $@

$(HOME)/.zgen : $(PWD)/zgen
	cp -r $(PWD)/zgen $@

clean :
	rm -f $(HOME)/.zsh $(HOME)/.zshrc
	rm -rf $(HOME)/.zgen

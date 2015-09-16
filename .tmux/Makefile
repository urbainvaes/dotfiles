HOME=/home/urbain
TARGETS=$(addprefix $(HOME)/,.tmux.conf .tmux/plugins/tpm)

all : $(TARGETS)

$(HOME)/.tmux.conf :
	rm -f $@ && ln -s $(PWD)/tmux.conf $@

$(HOME)/.tmux/plugins/tpm :
	mkdir -p $(HOME)/.tmux/plugins
	rm -f $@ && ln -s $(PWD)/tpm $@

clean :
	rm -f $(TARGETS)

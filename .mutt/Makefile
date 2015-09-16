HOME=/home/urbain
TARGETS=$(addprefix $(HOME)/,.mutt .mutt/temp .mutt/cache .mutt/cache/bodies)

all : $(TARGETS)

$(HOME)/.mutt :
	rm -f $@ && ln -s $(PWD) $@

$(HOME)/.mutt/temp :
	mkdir -p $@

$(HOME)/.mutt/cache :
	mkdir -p $@

$(HOME)/.mutt/cache/bodies :
	mkdir -p $@

clean :
	rm -f $(TARGETS)

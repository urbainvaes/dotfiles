HOME=/home/urbain
TARGET=$(HOME)/.config/zathura/zathurarc

all : $(TARGETS)

$(HOME)/.config/zathura/zathurarc :
	rm -f $@ && ln -s $(PWD)/zathurarc $@

clean :
	rm -f $(TARGET)

HOME=/home/urbain
TARGET=$(HOME)/.config/zathura/zathurarc

all : $(TARGET)

$(HOME)/.config/zathura/zathurarc :
	ln -sf $(PWD)/zathurarc $@

clean :
	rm -f $(TARGET)

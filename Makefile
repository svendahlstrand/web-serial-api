.PHONY: all clean run

all: analog-read-serial.html dimmer.html

%.html: src/%.html template-a template-b sven.png
	cat "template-a" "$<" "template-b" > "$@"

template-a template-b: src/template.html
	split -a 1 -p "split" "$<" "template-"

sven.png: src/sven.png
	cp "$<" "$@"

clean:
	rm -f template-{a,b} *.html *.png

run: analog-read-serial.html dimmer.html
	open -b "com.google.Chrome" $^

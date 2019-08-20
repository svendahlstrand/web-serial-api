.PHONY: all clean run

all: docs/analog-read-serial.html docs/dimmer.html

docs/%.html: src/%.html template-a template-b
	cat "template-a" "$<" "template-b" > "$@"

template-a template-b: src/template.html
	split -a 1 -p "split" "$<" "template-"

clean:
	rm -f template-{a,b} *.html

run: docs/analog-read-serial.html docs/dimmer.html
	open -b "com.google.Chrome" $^

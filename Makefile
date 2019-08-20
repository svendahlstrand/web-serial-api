.PHONY: all clean run

all: examples/analog-read-serial.html examples/dimmer.html

examples/%.html: src/%.html template-a template-b
	cat "template-a" "$<" "template-b" > "$@"

template-a template-b: src/template.html
	split -a 1 -p "split" "$<" "template-"

clean:
	rm -f template-{a,b} *.html

run: examples/analog-read-serial.html examples/dimmer.html
	open -b "com.google.Chrome" $^

Project Christian.
Self compiling shell based csv-Database for google forms.
Named by my Flatmate...


Flow:

Create head
Read in database
	for line
		if first line
			look for the coloumn of the Language
		else
			Check for datatype
			Check for relevance (year, year of layers above, does the previous datatype align?)
			if relevant
				Write rest of previous datatype
				Write new things for current datatype
				update globals
Write rest of previous datatype
Write bottom


functions:




globals:

previous datatype in each layer
relevance of each layer above answer
coloumn of the language



Kinds of Questions:

qI
Items

var item = form.addCheckboxItem();
item.setTitle('What condiments would you like on your hot dog?');
item.setChoices([
        item.createChoice('Ketchup'),
        item.createChoice('Mustard'),
        item.createChoice('Relish')
    ]);


qMC
Multiple Choice

form.addMultipleChoiceItem()
    .setTitle('Do you prefer cats or dogs?')
    .setChoiceValues(['Cats','Dogs'])
    .showOtherOption(true);



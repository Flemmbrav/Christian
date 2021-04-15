Kinds of QUestions:

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



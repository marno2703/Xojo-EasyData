# Xojo-EasyData
Xojo EasyData for FileMaker Developers - Making Xojo Database Apps Easier

I come from a background in FileMaker development and I'm also a Xojo developer. I love both platforms but I find that it takes me longer to work with databases in Xojo than it does with FileMaker. This project intends to reduce the time it takes to work with databases in Xojo.

This Desktop app reads from a sqlite database file, shows contacts in a window, and shows the details when a contact is clicked.

Overview Video: https://www.youtube.com/watch?v=niRX4Ly0Gww

FileMaker makes our life easy and as a FileMaker Developer, you could go years if not ever using SQL. In Xojo and other system like php/mysql you have to do everything yourself and I tend to be lazy and annoyed when I have to do redundant work. In Xojo, you would create a window and put listboxes and textfields on it which have no inherent connection to a database. They are simply a control that can show data. To put data in it from a database, you'd perform a SQL statement like 'SELECT * FROM Contacts' which would return a set of records. Then you'd go record by record and set each field, one by one. Normally this means you need to loop thru the records and then assign the field by typing out each textbox name = the field in the recordset by name. That's not a big deal, but when you get to 20 fields on your eight window, it becomes very annoying.

Xojo EasyData is mean to take away the pain. Instead, you'd place your listboxes and textfields on the window, add an edTable class, and then tell the edTable class about your table and fields. Once it knows about the table, it loads the contents of your query and then you tell the edTable class to set the listboxes and textfields. That's it.

Once you open the project look at these first:
- On Window1, look at the listboxes and textfields.
- In the Window1 Open Event Handler look at the code to register the textboxes and the ContactsListbox and sets the values to the ContactsListbox. This fires when the Window1 opens.
- In the ContactsListbox, look at the Change Event Handler. This sets the values to the textfields, registers and set the ContactsAddressesListbox, and registers and set the ContactsCommsListbox.
- Editing a value in a TextField will look thru the registered controls and listboxes for any TextFields and Listboxes with a column that uses the same database field and update its value. Finally, it saves the value to the database.
- Filtering and Finding have been added. Filtering shows the records that match the text on the previously found records. Finding replaces the found set of records with a new found set. You can Filter or Find on each or all of the columns.

At first it may seem complex, but when you break it down, it's very simple and can be used over and over again.

Xojo is free to use for an unlimited amount of time. You only need to purchase it to build your apps, but you can run and debug them without paying. If you are using the Xojo Demo, you'll be required to save the project as a binary project as saving to the text version can only be done with the non-demo version of Xojo.

# Getting Started
- Download Xojo from http://xojo.com/
- Download this project.
- Open the 'Xojo EasyData.xojo_project' file.

# edTable Class
Methods
- controlRegister: Registers a simple control, like a TextField, with the edTable.
- controlRegisterListbox: Registers a Listbox with the edTable.
- controlSave: Changes to a control updates the registered controls with the same data fieldname as well as any registered Listboxes with a column with the same data fieldname.
- controlSet: Sets the values from the dataDict() to the named Listbox or the simple controls.
- findControlByName: Returns the index of a Window.Control.
- findControlDictElementByName: Returns the index of the controlDict() for a specific control.
- findDataDictElementByKey: Returns the index of the dataDict() based on the value of the tableKeyName's value.
- loadFromDB: Loads data from a database table into the dataDict().
- loadFromDictionary: Not used yet, but could be used to pass an existing dictionary to set the dataDict().

Properties
- controlDict(): Stores an array of controls that the edTable should manage.
- dataDict(): Stores the data as an array of dictionaries. Each field name is the key and the field value as the value.
- sql: Stores the sql command text.
- tableKeyName: The table's key field name.
- tableKeyValue: The value used to query using the table's key field.
- tableName: The name of the table.
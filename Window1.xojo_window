#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   540
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   2015369215
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Xojo EasyData"
   Visible         =   True
   Width           =   755
   Begin Label ContactsListLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "Contacts List"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label ContactsDetailLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      Text            =   "Contacts Detail"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   271
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label CompanyLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      Text            =   "Company"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   303
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   74
   End
   Begin Label NameLastLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      Text            =   "Last Name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   369
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   74
   End
   Begin Label NameFirstLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      Text            =   "First Name"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   335
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   74
   End
   Begin edTable edTableContacts
      Handle          =   0
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockedInPosition=   False
      MouseX          =   0
      MouseY          =   0
      PanelIndex      =   0
      Scope           =   0
      sql             =   ""
      tableKeyName    =   ""
      tableKeyValue   =   ""
      tableName       =   ""
      TabPanelIndex   =   0
      Top             =   0
      Width           =   32
      Window          =   "0"
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
      _mWindow        =   "0"
   End
   Begin Listbox ContactsListbox
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   False
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   207
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   715
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin TextField CompanyTextField
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   106
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   303
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   214
   End
   Begin TextField NameFirstTextField
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   106
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   334
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   214
   End
   Begin TextField NameLastTextField
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   106
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   369
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   214
   End
   Begin TextField ContactUUIDTextField
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   177
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   270
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   143
   End
   Begin edTable edTableContactsAddresses
      Handle          =   0
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockedInPosition=   False
      MouseX          =   0
      MouseY          =   0
      PanelIndex      =   0
      Scope           =   0
      sql             =   ""
      tableKeyName    =   ""
      tableKeyValue   =   ""
      tableName       =   ""
      TabPanelIndex   =   0
      Top             =   20
      Width           =   32
      Window          =   "0"
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
      _mWindow        =   "0"
   End
   Begin edTable edTableContactsComms
      Handle          =   0
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   40
      LockedInPosition=   False
      MouseX          =   0
      MouseY          =   0
      PanelIndex      =   0
      Scope           =   0
      sql             =   ""
      tableKeyName    =   ""
      tableKeyValue   =   ""
      tableName       =   ""
      TabPanelIndex   =   0
      Top             =   40
      Width           =   32
      Window          =   "0"
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
      _mWindow        =   "0"
   End
   Begin Listbox ContactsAddressesListbox
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   False
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   87
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   433
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   715
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox ContactsCommsListbox
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   False
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   87
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   332
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   304
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   403
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label ContactsAddressesLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   20
      TabPanelIndex   =   0
      Text            =   "Contacts Addresses"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   401
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   161
   End
   Begin Label ContactsCommsLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   332
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   21
      TabPanelIndex   =   0
      Text            =   "Contacts Comms"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   271
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   161
   End
   Begin TextField ContactsListBoxActionTextField
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   565
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   170
   End
   Begin PopupMenu ContactsListBoxActionPopup
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   388
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   21
      Underline       =   False
      Visible         =   True
      Width           =   165
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  dim theListboxHeaders(), theListboxFields() as text
		  dim theListboxActionsColumnsAll as Boolean
		  dim theListboxActionsTypes(), theListboxActionsColumns(), theListboxActionsFields() as text
		  
		  dim theFilterText as text
		  dim theFilterColumns() as string
		  
		  // CONTACTS
		  
		  // Assign the DB Table Info
		  edTableContacts.tableName = "Contacts"
		  edTableContacts.tableKeyName = "UUID"
		  edTableContacts.tableKeyValue = ""
		  
		  // Load the Data using the DB Table Info. Will be: 'SELECT * from Contacts'.
		  edTableContacts.loadFromDB( "" )
		  
		  // Register the Controls ( Name, Field, Label, Enabled )
		  edTableContacts.controlRegister( "ContactUUIDTextField", "UUID", "", false )
		  edTableContacts.controlRegister( "CompanyTextField", "Company", "CompanyLabel", true )
		  edTableContacts.controlRegister( "NameFirstTextField", "NameFirst", "NameFirstLabel", true )
		  edTableContacts.controlRegister( "NameLastTextField", "NameLast", "NameLastLabel", true )
		  
		  // Register the Listbox ( Name, Headers, Fields, Enabled ) The Headers and Fields are just arrays of text.
		  theListboxHeaders() = Array ( "Company", "First Name", "Last Name" )
		  theListboxFields() = Array ( "Company", "NameFirst", "NameLast" )
		  edTableContacts.controlRegisterListbox( "ContactsListbox", theListboxHeaders(), theListboxFields(), true )
		  
		  // Register the Listbox Actions ( Name, ActionPopupName, ActionTextFieldName, ActionsTypes(), ColumnsAll, Columns(), Fields() )
		  theListboxActionsTypes = Array ( "Filter By", "Find By" )
		  theListboxActionsColumnsAll = true
		  theListboxActionsColumns = Array ( "Company", "First Name", "Last Name" )
		  theListboxActionsFields = Array ( "Company", "NameFirst", "NameLast" )
		  edTableContacts.controlRegisterListboxActions( "ContactsListbox", "ContactsListBoxActionPopup", "ContactsListBoxActionTextField", theListboxActionsTypes(), theListboxActionsColumnsAll, theListboxActionsColumns(), theListboxActionsFields() )
		  
		  // Populate the Data into the ListBox
		  edTableContacts.controlSet( "ContactsListbox", -2,  theFilterText, theFilterColumns() )  // -2 = all records
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events ContactsListbox
	#tag Event
		Sub Change()
		  dim theListboxHeaders(), theListboxFields() as text
		  dim theTableNameKeyValue as text
		  dim theFilterText as text
		  dim theFilterColumns() as string
		  
		  if me.ListIndex = -1 then return
		  
		  // Get the Primary Key
		  theTableNameKeyValue = me.RowTag( me.ListIndex )
		  // Update the Fields
		  edTableContacts.controlSet( "Control", me.ListIndex, theFilterText, theFilterColumns() )  // -2 = all records
		  
		  // ================================================
		  
		  // CONTACTSADDRESSES
		  
		  // Assign the DB Table Info
		  edTableContactsAddresses.tableName = "ContactsAddresses"
		  edTableContactsAddresses.tableKeyName = "UUIDContact"
		  edTableContactsAddresses.tableKeyValue = theTableNameKeyValue  // The key of the contact.
		  
		  // Load the Data using the DB Table Info. Will be: SELECT * FROM ContactsAddresses WHERE UUIDContact = 'xxx', but xxx will be the value of the UUIDTextField
		  edTableContactsAddresses.loadFromDB( "" )
		  
		  // Register the Listbox ( Name, Headers, Fields, Enabled ) The Headers and Fields are just arrays of text.
		  theListboxHeaders() = Array ( "Street", "City", "State", "Zip", "County" )
		  theListboxFields() = Array ( "Street", "City", "State", "Zip", "County" )
		  edTableContactsAddresses.controlRegisterListbox( "ContactsAddressesListbox", theListboxHeaders(), theListboxFields(), true )
		  
		  // Populate the Data into the ListBox
		  edTableContactsAddresses.controlSet( "ContactsAddressesListbox", -2,  theFilterText, theFilterColumns() )  // -2 = all records
		  
		  // ================================================
		  
		  // CONTACTSCOMMS
		  
		  // Assign the DB Table Info
		  edTableContactsComms.tableName = "ContactsComms"
		  edTableContactsComms.tableKeyName = "UUIDContact"
		  edTableContactsComms.tableKeyValue = theTableNameKeyValue  // The key of the contact.
		  
		  // Load the Data using the DB Table Info. Will be: SELECT * FROM ContactsComms WHERE UUIDContact = 'xxx', but xxx will be the value of the UUIDTextField
		  edTableContactsComms.loadFromDB( "" )
		  
		  
		  // Register the Listbox ( Name, Headers, Fields, Enabled ) The Headers and Fields are just arrays of text.
		  theListboxHeaders() = Array ( "Type", "Data" )
		  theListboxFields() = Array ( "Type", "Data" )
		  edTableContactsComms.controlRegisterListbox( "ContactsCommsListbox", theListboxHeaders(), theListboxFields(), true )
		  
		  // Populate the Data into the ListBox
		  edTableContactsComms.controlSet( "ContactsCommsListbox", -2,  theFilterText, theFilterColumns() )  // -2 = all records
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CompanyTextField
	#tag Event
		Sub LostFocus()
		  edTableContacts.controlSave( me.Name.ToText, ContactUUIDTextField.Text.ToText, me.Text.ToText )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NameFirstTextField
	#tag Event
		Sub LostFocus()
		  edTableContacts.controlSave( me.Name.ToText, ContactUUIDTextField.Text.ToText, me.Text.ToText )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NameLastTextField
	#tag Event
		Sub LostFocus()
		  edTableContacts.controlSave( me.Name.ToText, ContactUUIDTextField.Text.ToText, me.Text.ToText )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ContactsListBoxActionTextField
	#tag Event
		Sub LostFocus()
		  edTableContacts.filterfindListbox
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  // Filter of find if Return or Enter is Pressed
		  'MsgBox key.asc.ToText
		  if key.asc = 13 or key.asc = 3 then
		    edTableContacts.filterfindListbox
		    return true
		  else
		    return false
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"10 - Drawer Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior

#tag Class
Protected Class edTable
Inherits control
	#tag Method, Flags = &h0
		Sub controlRegister(pName as text, pField as text, pLabel as text, pEnable as Boolean)
		  
		  // Register a Control
		  ReDim controlDict( controlDict.Ubound + 1 )
		  controlDict( controlDict.Ubound ) = new Dictionary
		  
		  controlDict( controlDict.Ubound ).Value( "Type" ) = "Control"
		  controlDict( controlDict.Ubound ).Value( "Name" ) = pName
		  controlDict( controlDict.Ubound ).Value( "Field" ) = pField
		  controlDict( controlDict.Ubound ).Value( "Label" ) = pLabel
		  controlDict( controlDict.Ubound ).Value( "Enable" ) = pEnable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub controlRegisterListbox(pName as text, pHeader() as text, pFields() as text, pEnable as Boolean, pStatsName as text, pStatsFormat as text)
		  
		  // Register a Listbox
		  ReDim controlDict( controlDict.Ubound + 1 )
		  controlDict( controlDict.Ubound ) = new Dictionary
		  
		  controlDict( controlDict.Ubound ).Value( "Type" ) = "Listbox"
		  controlDict( controlDict.Ubound ).Value( "Name" ) = pName
		  controlDict( controlDict.Ubound ).Value( "Headers" ) = pHeader()
		  controlDict( controlDict.Ubound ).Value( "Fields" ) = pFields()
		  controlDict( controlDict.Ubound ).Value( "Enable" ) = pEnable
		  controlDict( controlDict.Ubound ).Value( "StatsName" ) = pStatsName
		  controlDict( controlDict.Ubound ).Value( "StatsFormat" ) = pStatsFormat
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub controlRegisterListboxActions(pName as text, pActionPopupName as text, pActionTextFieldName as text, pActionsTypes() as text, pIncludeColumnsAll as boolean, pColumns() as text, pFields() as text)
		  
		  // Register the Actions
		  ReDim controlDict( controlDict.Ubound + 1 )
		  controlDict( controlDict.Ubound ) = new Dictionary
		  
		  controlDict( controlDict.Ubound ).Value( "Type" ) = "Actions"
		  controlDict( controlDict.Ubound ).Value( "ControlName" ) = pName
		  controlDict( controlDict.Ubound ).Value( "PopupName" ) = pActionPopupName
		  controlDict( controlDict.Ubound ).Value( "TextFieldName" ) = pActionTextFieldName
		  controlDict( controlDict.Ubound ).Value( "ActionTypes" ) = pActionsTypes()
		  controlDict( controlDict.Ubound ).Value( "IncludeColumnsAll" ) = pIncludeColumnsAll
		  controlDict( controlDict.Ubound ).Value( "Columns" ) = pColumns()
		  controlDict( controlDict.Ubound ).Value( "Fields" ) = pFields()
		  
		  // Get the Popup Menu Control
		  dim theActionPopupControlIndex as Integer
		  dim theActionPopupControl as control
		  theActionPopupControlIndex = findControlByName( pActionPopupName )
		  theActionPopupControl = me.Window.Control( theActionPopupControlIndex )
		  
		  //Set the Popup Menu Control
		  if theActionPopupControl isa PopupMenu then
		    PopupMenu( theActionPopupControl ).DeleteAllRows
		    For theActionsTypesIndex as Integer = 0 to pActionsTypes.Ubound
		      
		      // Add the All Item
		      if pIncludeColumnsAll then
		        PopupMenu( theActionPopupControl ).AddRow( pActionsTypes( theActionsTypesIndex ) + " " + "All" )
		        PopupMenu( theActionPopupControl ).RowTag( PopupMenu( theActionPopupControl ).ListCount - 1 ) = pActionsTypes( theActionsTypesIndex ) + "-" + text.Join( pFields, "," )
		      end if
		      // Add each Column
		      For theActionsColumnsIndex as Integer = 0 to pColumns.Ubound
		        PopupMenu( theActionPopupControl ).AddRow( pActionsTypes( theActionsTypesIndex ) + " " + pColumns( theActionsColumnsIndex ) )
		        PopupMenu( theActionPopupControl ).RowTag( PopupMenu( theActionPopupControl ).ListCount - 1 ) = pActionsTypes( theActionsTypesIndex ) + "-" + pFields( theActionsColumnsIndex )
		      next
		      // Add a Separator
		      if theActionsTypesIndex <> pActionsTypes.Ubound then
		        PopupMenu( theActionPopupControl ).AddSeparator
		      end if
		      
		    next
		    
		    //PopupMenu( theActionPopupControl ).ListIndex = 0
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub controlSave(pControlName as text, pTableKeyValue as text, pControlValue as text)
		  dim theControlDictElement, theDataDictElement as Integer
		  dim theControlFieldName as text
		  
		  dim theArray() as text
		  dim theArrayIndex as integer
		  dim theControl as Control
		  dim theListboxRowCount as integer
		  
		  // =========================================
		  
		  // Update dataDict
		  theControlDictElement = findControlDictElementByName( pControlName )
		  theDataDictElement = findDataDictElementByKey( pTableKeyValue )
		  theControlFieldName = controlDict( theControlDictElement ).Value( "Field" )
		  
		  // Update the Value if it is different.
		  if dataDict( theDataDictElement ).Value( theControlFieldName ) <> pControlValue then
		    dataDict( theDataDictElement ).Value( theControlFieldName ) = pControlValue
		  end if
		  
		  // =========================================
		  
		  // Update the values in the controls
		  For theControlDictIndex as Integer = 0 to controlDict.Ubound
		    
		    // Update the Controls with the same Field
		    if controlDict( theControlDictIndex).Value( "Type" ) = "Control" then
		      if controlDict( theControlDictIndex ).Value( "Field" ) = theControlFieldName then
		        theControl = me.Window.Control( findControlByName ( controlDict( theControlDictIndex ).Value( "Name" ) ) )
		        
		        // UPDATE THE TEXTFIELD if needed.
		        if theControl IsA TextField then
		          if TextField( theControl ).Text <> pControlValue then
		            TextField( theControl ).Text = pControlValue
		          end if
		        end if
		        
		      end if
		    end if
		    
		    // Update the Listboxes that have the Control's Field as a Column
		    if controlDict( theControlDictIndex ).Value( "Type" ) = "Listbox" then
		      theArray = controlDict( theControlDictIndex ).Value( "Fields" )  // Get the Field Names
		      theArrayIndex = theArray.IndexOf( theControlFieldName )  // Get the Field Index
		      if theArrayIndex > -1 then  // We have a column for theat field!
		        theControl = me.Window.Control( findControlByName ( controlDict( theControlDictIndex ).Value( "Name" ) ) )
		        
		        // FIND THE ROWTAG with our pTableKeyValue and UPDATE if needed.
		        theListboxRowCount = ListBox( theControl ).ListCount - 1
		        for theRow as Integer = 0 to theListboxRowCount
		          if ListBox( theControl ).RowTag( theRow ) = pTableKeyValue then
		            if ListBox( theControl ).Cell( theRow, theArrayIndex ) <> pControlValue then
		              ListBox( theControl ).Cell( theRow, theArrayIndex ) = pControlValue
		            end if
		          end if
		        next
		        
		      end if
		    end if
		    
		  next
		  
		  // =========================================
		  
		  // Update the Database
		  // Select the Records
		  sql = "SELECT * FROM " + tableName + " WHERE " + tableKeyName + " = " + chr( 39 ).ToText + pTableKeyValue + chr( 39 ).ToText
		  Dim dbRecordSet As RecordSet
		  dbRecordSet = app.db.SQLSelect(sql)
		  if app.db.Error then
		    app.MsgBoxAlert( "Alert", "Database Exception: " + app.db.ErrorCode.ToText + "/" + app.db.ErrorMessage.ToText, "OK" )
		  end if
		  dbRecordSet.Edit
		  dbRecordSet.Field( theControlFieldName ).Value = pControlValue
		  dbRecordSet.Update
		  if app.db.Error then
		    app.MsgBoxAlert( "Alert", "Database Exception: " + app.db.ErrorCode.ToText + "/" + app.db.ErrorMessage.ToText, "OK" )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub controlSet(pControlName as text, pRow as Integer, pFilterText as text, pFilterColumns() as string)
		  
		  // Set the Controls if there is a Dictionary Entry
		  dim theControl as Control
		  dim theControlName as text
		  dim controlIndex as Integer
		  
		  dim theControlDictElement as Integer
		  dim theListboxHeaders(), theListboxFields() as text
		  
		  dim hasStats as boolean
		  dim theStatsControlName, theStatsFormat, theStatsFilteredFormat as text
		  dim theStatsFilteredFormatStart, theStatsFilteredFormatEnd as Integer
		  dim theStatsControlIndex as integer
		  dim theStatsControl as Control
		  dim theStatsFound, theStatsFiltered as integer
		  
		  dim addRow as Boolean
		  
		  // Look at each Control in the Container
		  For controlIndex = 0 To me.Window.ControlCount - 1
		    theControl = me.Window.Control( controlIndex )
		    theControlName = theControl.Name.ToText
		    
		    // =========================================
		    
		    // Populate our Listbox
		    if theControlName = pControlName and theControl IsA Listbox then
		      
		      // Get the info on the Registered Control
		      theControlDictElement = findControlDictElementByName( pControlName )
		      
		      // Prep for the Stats
		      if controlDict( theControlDictElement ).HasKey( "StatsName" ) and controlDict( theControlDictElement ).HasKey( "StatsFormat" ) then
		        theStatsControlName = controlDict( theControlDictElement ).Value( "StatsName" ) 
		        theStatsControlIndex = findControlByName( theStatsControlName )
		        theStatsControl = me.Window.Control( theStatsControlIndex )
		        theStatsFormat = controlDict( theControlDictElement ).Value( "StatsFormat" ) 
		        hasStats = true
		      else
		        hasStats = false
		      end if
		      
		      // Clear the ListBox
		      ListBox( theControl ).DeleteAllRows
		      
		      // Set the Number of Columns in the ListBox
		      theListboxHeaders() = controlDict( theControlDictElement ).Value( "Headers" )
		      theListboxFields() = controlDict( theControlDictElement ).Value( "Fields" )
		      ListBox( theControl ).ColumnCount = theListboxHeaders.Ubound + 1
		      
		      //--------- Set the Header
		      ListBox( theControl ).heading( -1 ) = ""
		      For theHeaderNamesIndex as Integer = 0 to theListboxHeaders.Ubound
		        ListBox( theControl ).heading( theHeaderNamesIndex ) = theListboxHeaders( theHeaderNamesIndex )
		      Next
		      //---------
		      
		      // For Each Dictionary Array Element / Record
		      For theDictIndex as Integer = 0 to dataDict.Ubound
		        if pFilterText <> "" and pFilterColumns.Ubound > -1 then
		          addRow = false // assume that we are not adding the row
		          For theFieldNamesIndex as Integer = 0 to theListboxFields.Ubound
		            // if this is a column we care about and the filter matches, add the row
		            if pFilterColumns.IndexOf( theListboxFields( theFieldNamesIndex ) ) > -1 and dataDict( theDictIndex ).Value( theListboxFields( theFieldNamesIndex ) ).StringValue.InStr( pFilterText ) > 0 then
		              addRow = true
		            end if
		          Next
		        else
		          // Add the Row if there is no filter
		          addRow = true
		        end if
		        // Add the Row if allowed
		        if addRow then
		          ListBox( theControl ).AddRow()
		          
		          //--------- Set the ListBox Rows
		          ListBox( theControl ).RowTag( ListBox( theControl ).LastIndex ) = dataDict( theDictIndex ).Value( tableKeyName )
		          For theFieldNamesIndex as Integer = 0 to theListboxFields.Ubound
		            ListBox( theControl ).Cell( ListBox( theControl ).LastIndex, theFieldNamesIndex ) = dataDict( theDictIndex ).Value( theListboxFields( theFieldNamesIndex ) )
		          Next
		          //---------
		        end if
		      Next
		      
		      // Set the Stats
		      if hasStats then
		        // Get the Counts
		        theStatsFound = dataDict.Ubound // How many Found?
		        theStatsFiltered = ListBox( theControl ).ListCount - 1 // How many Filtered
		        // Get the Custom Filtered Format
		        // Example: "[ {Filtered / }Found ]"
		        // The words Filtered and Found will be replaced their respective numbers.
		        // Filtered will not be shown if = 0
		        // Anything between "{" and "}" is part of the Filtered Text. 
		        theStatsFilteredFormatStart = theStatsFormat.IndexOf( "{" )
		        theStatsFilteredFormatEnd = theStatsFormat.IndexOf( "}" )
		        if theStatsFilteredFormatEnd > -1 and theStatsFilteredFormatEnd > -1 then
		          theStatsFilteredFormat = theStatsFormat.mid( theStatsFilteredFormatStart, theStatsFilteredFormatEnd - theStatsFilteredFormatStart + 1 )
		        else
		          theStatsFilteredFormat = "Filtered"
		        end if
		        // Don't show Filtered if there are none filtered...
		        if theStatsFiltered = theStatsFound then
		          theStatsFormat = theStatsFormat.Replace( theStatsFilteredFormat, "" )
		        else
		          theStatsFormat = theStatsFormat.Replace( "{", "" )
		          theStatsFormat = theStatsFormat.Replace( "}", "" )
		          theStatsFiltered = theStatsFiltered + 1
		          theStatsFormat = theStatsFormat.Replace( "Filtered", theStatsFiltered.ToText )
		        end if
		        theStatsFound = theStatsFound + 1
		        theStatsFormat = theStatsFormat.Replace( "Found", theStatsFound.ToText )
		        Label( theStatsControl ).text = theStatsFormat
		      end if
		      
		      // Enable the Control / ListBox 
		      ListBox( theControl ).Enabled = controlDict( theControlDictElement ).Value( "Enable" )
		      
		    end if
		    
		    // =========================================
		    
		    // Populate our Controls
		    theControlDictElement = findControlDictElementByName( theControlName )
		    if pControlName = "Control" and theControlDictElement > -1 then
		      
		      // TextFields
		      if theControl IsA TextField then
		        // Set
		        TextField( theControl ).Text = dataDict( pRow ).Value( controlDict( theControlDictElement ).Value( "Field" ) )
		        // Enable the Control
		        TextField( theControl ).Enabled = controlDict( theControlDictElement ).Value( "Enable" )
		      end if
		      
		    end if
		    
		    // =========================================
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function escapeString(value as text) As text
		  return value.ReplaceAll(chr(39).ToText, chr(39).ToText+chr(39).ToText)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub filterfindListbox()
		  
		  dim theActionPopupName, theActionTextFieldName as text
		  dim theActionPopupControl, theActionTextFieldControl as control
		  
		  dim theActionPopupValue, theActionTextBox as text
		  dim theActionValues() as string
		  dim theActionName as text
		  dim theColumnNames() as string
		  dim sqlComparisonOperator as text
		  
		  sql = ""
		  
		  // Get the Controls
		  theActionPopupName = controlDict( controlDict.Ubound ).Value( "PopupName" )
		  theActionTextFieldName = controlDict( controlDict.Ubound ).Value( "TextFieldName" )
		  theActionPopupControl = me.Window.Control( findControlByName( theActionPopupName ) )
		  theActionTextFieldControl = me.Window.Control( findControlByName( theActionTextFieldName ) )
		  
		  // Return if no Action is Selected
		  if PopupMenu( theActionPopupControl ).ListIndex = -1 then Return
		  // Return if the RowTag is Nil, but it's not possble to choose a Separator Row
		  if PopupMenu( theActionPopupControl ).RowTag( PopupMenu( theActionPopupControl ).ListIndex ) = nil then return
		  
		  // Get the ActionPopup value
		  theActionPopupValue = PopupMenu( theActionPopupControl ).RowTag( PopupMenu( theActionPopupControl ).ListIndex )
		  theActionValues = Split( theActionPopupValue, "-" )
		  theActionName = theActionValues( 0 ).ToText
		  theColumnNames = Split( theActionValues( 1 ).ToText, "," )
		  
		  // Get the ActionTextBox value
		  theActionTextBox = TextField( theActionTextFieldControl ).Text.ToText
		  
		  // ============================================
		  
		  if theActionName = "Filter By" then
		    
		    // Update the Update the Listbox with the db if the ActionTextBox is empty
		    controlSet( "ContactsListbox", -2, theActionTextBox, theColumnNames )  // -2 = all records
		    
		    'MsgBox "Filtered: " + theActionTextBox
		    
		  end if
		  
		  // ============================================
		  
		  if theActionName = "Find By" then
		    
		    // Select the Records
		    sql = "SELECT * FROM " + tableName
		    
		    '// if we have a '%' in the search term, use like otherwise equal
		    'if theActionTextBox.IndexOf( "%" ) = -1 then
		    'sqlComparisonOperator = "="
		    'Else
		    sqlComparisonOperator = "LIKE"
		    'end if
		    // if we have columns, add  the where
		    if theColumnNames.Ubound > -1 then
		      sql = sql + " WHERE "
		    end if
		    // add the column wit hthe comparion term
		    For theColumnNameIndex as Integer = 0 to theColumnNames.Ubound
		      sql = sql + theColumnNames( theColumnNameIndex ).ToText + " " + sqlComparisonOperator + " " + chr( 39 ).ToText + "%" + escapeString(theActionTextBox) + "%" + chr( 39 ).ToText
		      // add an OR if not on the last columname
		      if theColumnNameIndex <> theColumnNames.Ubound then
		        sql = sql + " OR "
		      end if
		    next
		    
		    loadFromDB( sql )
		    controlSet( "ContactsListbox", -2, "", nil )  // -2 = all records
		    
		    'MsgBox "Query: " + sql
		    
		  end if
		  
		  // ============================================
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function findControlByName(pControlName as text) As integer
		  
		  // Look thru each Control for the Name of the Control
		  Dim theControl As Control
		  For i As Integer = 0 To me.Window.ControlCount-1
		    theControl = me.Window.Control( i )
		    
		    if theControl.Name = pControlName then
		      return i
		    end if
		    
		  Next
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function findControlDictElementByName(pControlName as text) As integer
		  
		  // Look thru each Control for the Name of the Control
		  For theIndex as Integer = 0 to controlDict.Ubound
		    
		    if controlDict( theIndex).HasKey( "Name" ) then
		      if controlDict( theIndex).Value( "Name" ) = pControlName then
		        return theIndex
		      end if
		    end if
		    
		  next
		  
		  return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function findDataDictElementByKey(pTableKeyValue as text) As integer
		  
		  // Look thru each Data Element for the KeyValue
		  For theIndex as Integer = 0 to dataDict.Ubound
		    
		    if dataDict( theIndex).Value( tableKeyName ) = pTableKeyValue then
		      return theIndex
		    end if
		    
		  next
		  
		  return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub loadFromDB(pSQL as text)
		  // Reset the Dictionary
		  ReDim dataDict(-1)
		  
		  if pSQL = "" then
		    
		    // Select the Records
		    sql = "SELECT * FROM " + tableName
		    
		    if tableKeyName <> "" and tableKeyValue <> "" then
		      sql = sql + " WHERE " + tableKeyName + " = " + chr( 39 ).ToText + tableKeyValue + chr( 39 ).ToText
		    end if
		    
		  else
		    
		    sql = pSql
		    
		  end if
		  
		  //===================================
		  
		  // Find the Records in the Database
		  'Dim dbRecordSet As SQLiteRecordSet
		  'Try
		  'dbRecordSet = app.db.SQLSelect(sql)
		  'Catch e As SQLiteException
		  'MsgBoxAlert_2015( "Alert", "Database Exception: " + e.Reason, "OK" )
		  'End Try
		  Dim dbRecordSet As RecordSet
		  dbRecordSet = app.db.SQLSelect(sql)
		  if app.db.Error then
		    app.MsgBoxAlert( "Alert", "Database Exception: " + app.db.ErrorCode.ToText + "/" + app.db.ErrorMessage.ToText, "OK" )
		  end if
		  
		  //===================================
		  
		  // Load the Records into a Dictionary
		  If dbRecordSet <> Nil Then
		    Dim dbRecordSetCount as Integer = dbRecordSet.RecordCount
		    dim theFieldName as text
		    dim theFieldValue as text
		    'Try
		    While Not dbRecordSet.EOF
		      
		      ReDim dataDict( dataDict.Ubound + 1 )
		      dataDict( dataDict.Ubound ) = new Dictionary
		      
		      'For fieldIndex as Integer = 0 to dbRecordSet.FieldCount - 1
		      For fieldIndex as Integer = 1 to dbRecordSet.FieldCount
		        'theFieldName = dbRecordSet.Field( fieldIndex ).Name
		        theFieldName = dbRecordSet.IdxField( fieldIndex ).Name.ToText
		        theFieldValue = dbRecordSet.IdxField( fieldIndex ).StringValue.ToText
		        
		        dataDict( dataDict.Ubound ).Value( theFieldName ) = theFieldValue
		        
		      Next
		      
		      dbRecordSet.MoveNext
		    Wend
		    'Catch e As SQLiteException
		    'Break
		    'End Try
		    
		  End If
		  
		  //===================================
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub loadFromDictionary(pDictionary as Dictionary)
		  // Reset the Dictionary
		  ReDim dataDict(-1)
		  // Add a row / element
		  ReDim dataDict( dataDict.Ubound + 1 )
		  dataDict( dataDict.Ubound ) = new Dictionary
		  // Set the Dictionary
		  dataDict( dataDict.Ubound ) = pDictionary
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		controlDict() As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		dataDict() As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		sql As text
	#tag EndProperty

	#tag Property, Flags = &h0
		tableKeyName As text
	#tag EndProperty

	#tag Property, Flags = &h0
		tableKeyValue As text
	#tag EndProperty

	#tag Property, Flags = &h0
		tableName As text
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Handle"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MouseX"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MouseY"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PanelIndex"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sql"
			Group="Behavior"
			Type="text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="tableKeyName"
			Visible=true
			Group="Behavior"
			Type="text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="tableKeyValue"
			Group="Behavior"
			Type="text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="tableName"
			Visible=true
			Group="Behavior"
			Type="text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Window"
			Group="Behavior"
			InitialValue="0"
			Type="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mIndex"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mInitialParent"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mPanelIndex"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mWindow"
			Group="Behavior"
			InitialValue="0"
			Type="Window"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

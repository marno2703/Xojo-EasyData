#tag Class
Protected Class edTable
Inherits control
	#tag Method, Flags = &h0
		Sub controlRegister(pName as text, pField as text, pLabel as text, pEnable as Boolean)
		  ReDim controlDict( controlDict.Ubound + 1 )
		  controlDict( controlDict.Ubound ) = new Dictionary
		  
		  controlDict( controlDict.Ubound ).Value( "Type" ) = "Controls"
		  controlDict( controlDict.Ubound ).Value( "Name" ) = pName
		  controlDict( controlDict.Ubound ).Value( "Field" ) = pField
		  controlDict( controlDict.Ubound ).Value( "Label" ) = pLabel
		  controlDict( controlDict.Ubound ).Value( "Enable" ) = pEnable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub controlRegisterListbox(pName as text, pHeader() as text, pFields() as text, pEnable as Boolean)
		  ReDim controlDict( controlDict.Ubound + 1 )
		  controlDict( controlDict.Ubound ) = new Dictionary
		  
		  controlDict( controlDict.Ubound ).Value( "Type" ) = "Listbox"
		  controlDict( controlDict.Ubound ).Value( "Name" ) = pName
		  controlDict( controlDict.Ubound ).Value( "Headers" ) = pHeader()
		  controlDict( controlDict.Ubound ).Value( "Fields" ) = pFields()
		  controlDict( controlDict.Ubound ).Value( "Enable" ) = pEnable
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub controlSet(pControlName as text, pRow as Integer)
		  
		  // Set the Controls if there is a Dictionary Entry
		  dim theControl as Control
		  dim theControlName as text
		  dim controlIndex as Integer
		  
		  dim theControlDictElement as Integer
		  dim theListboxHeaders(), theListboxFields() as text
		  
		  dim tempText as text
		  
		  // Look at each Control in the Container
		  For controlIndex = 0 To me.Window.ControlCount - 1
		    theControl = me.Window.Control( controlIndex )
		    theControlName = theControl.Name.ToText
		    
		    // =========================================
		    
		    // Populate our Listbox
		    if theControlName = pControlName and theControl IsA Listbox then
		      // Clear the ListBox
		      ListBox( theControl ).DeleteAllRows
		      
		      theControlDictElement = findControlDictElement( pControlName )
		      
		      // Set the Number of Columns in the ListBox
		      theListboxHeaders() = controlDict( theControlDictElement ).Value( "Headers" )
		      theListboxFields() = controlDict( theControlDictElement ).Value( "Fields" )
		      ListBox( theControl ).ColumnCount = theListboxHeaders.Ubound + 1
		      
		      // For Each Dictionary Array Element / Record
		      For theDictIndex as Integer = 0 to dataDict.Ubound
		        ListBox( theControl ).AddRow()
		        
		        //--------- Set the Header
		        ListBox( theControl ).heading( -1 ) = ""
		        For theHeaderNamesIndex as Integer = 0 to theListboxHeaders.Ubound
		          ListBox( theControl ).heading( theHeaderNamesIndex ) = theListboxHeaders( theHeaderNamesIndex )
		        Next
		        //---------
		        
		        //--------- Set the ListBox Rows
		        ListBox( theControl ).RowTag( ListBox( theControl ).LastIndex ) = dataDict( theDictIndex ).Value( tableKeyName )
		        For theFieldNamesIndex as Integer = 0 to theListboxFields.Ubound
		          ListBox( theControl ).Cell( ListBox( theControl ).LastIndex, theFieldNamesIndex ) = dataDict( theDictIndex ).Value( theListboxFields( theFieldNamesIndex ) )
		        Next
		        //---------
		        
		      Next
		      
		      ListBox( theControl ).Enabled = controlDict( theControlDictElement ).Value( "Enable" )
		      
		    end if
		    
		    // =========================================
		    
		    // Populate our Controls
		    theControlDictElement = findControlDictElement( theControlName )
		    if pControlName = "Controls" and theControlDictElement > -1 then
		      
		      // TextFields
		      if theControl IsA TextField then
		        TextField( theControl ).Text = dataDict( pRow ).Value( controlDict( theControlDictElement ).Value( "Field" ) )
		        TextField( theControl ).Enabled = controlDict( theControlDictElement ).Value( "Enable" )
		      end if
		      
		    end if
		    
		    // =========================================
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function findControlDictElement(pControlName as text) As integer
		  
		  
		  For theIndex as Integer = 0 to controlDict.Ubound
		    
		    if controlDict( theIndex).Value( "Name" ) = pControlName then
		      return theIndex
		    end if
		    
		  next
		  
		  return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub loadFromDB()
		  // Reset the Dictionary
		  ReDim dataDict(-1)
		  
		  // Select the Records
		  Dim sql As string = "SELECT * FROM " + tableName
		  
		  if tableKeyName <> "" and tableKeyValue <> "" then
		    sql = sql + " WHERE " + tableKeyName + " = " + chr( 39 ).ToText + tableKeyValue + chr( 39 ).ToText
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
		    app.MsgBoxAlert_2015( "Alert", "Database Exception: " + app.db.ErrorCode.ToText + "/" + app.db.ErrorMessage.ToText, "OK" )
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

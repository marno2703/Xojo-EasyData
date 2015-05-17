#tag Class
Protected Class edTable
Inherits control
	#tag Method, Flags = &h0
		Sub controlsSet(pControlName as text, pRow as Integer)
		  
		  // Set the Controls if there is a Dictionary Entry
		  dim theControl as Control
		  dim theControlName as text
		  dim controlIndex as Integer
		  
		  dim registeredControlIndex as Integer
		  dim registeredControlName, registeredControlField, registeredControlLabel as text
		  
		  // Look at each Control in the Container
		  For controlIndex = 0 To me.Window.ControlCount - 1
		    theControl = me.Window.Control( controlIndex )
		    theControlName = theControl.Name.ToText
		    
		    // =========================================
		    
		    // Populate our Listbox
		    if theControlName = pControlName and theControl IsA Listbox then
		      // Clear the ListBox
		      ListBox( theControl ).DeleteAllRows
		      
		      // Set the Number of Columns in the ListBox
		      ListBox( theControl ).ColumnCount = listBoxHeader.Ubound + 1  // theDictionary( 0 ).Count = the total fields in the Dictionary
		      
		      // For Each Dictionary Array Element / Record
		      For theDictIndex as Integer = 0 to dict.Ubound
		        ListBox( theControl ).AddRow()
		        
		        //--------- Set the Header
		        ListBox( theControl ).heading( -1 ) = ""
		        For theHeaderNamesIndex as Integer = 0 to listBoxHeader.Ubound
		          ListBox( theControl ).heading( theHeaderNamesIndex ) = listBoxHeader( theHeaderNamesIndex )
		        Next
		        //---------
		        
		        //--------- Set the ListBox Rows
		        ListBox( theControl ).RowTag( ListBox( theControl ).LastIndex ) = dict( theDictIndex ).Value( tableKeyName )
		        For theFieldNamesIndex as Integer = 0 to listBoxFields.Ubound
		          ListBox( theControl ).Cell( ListBox( theControl ).LastIndex, theFieldNamesIndex ) = dict( theDictIndex ).Value( listBoxFields( theFieldNamesIndex ) )
		        Next
		        //---------
		        
		      Next
		      
		    end if
		    
		    // =========================================
		    
		    // Populate our Controls
		    registeredControlIndex = controlNames.IndexOf( theControlName )   // get the index from our list of controls
		    if pControlName = "" and registeredControlIndex > -1 then
		      registeredControlName = controlNames( registeredControlIndex )
		      registeredControlField = controlFields( registeredControlIndex )
		      registeredControlLabel = controlLabels( registeredControlIndex )
		      
		      // TextFields
		      if theControl IsA TextField then
		        if dict( pRow ).HasKey( controlFields( registeredControlIndex ) ) then
		          TextField( theControl ).Text = dict( pRow ).Value( controlFields( registeredControlIndex ) )
		        end if
		      end if
		      
		    end if
		    
		    // =========================================
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub loadFromDB()
		  // Reset the Dictionary
		  ReDim dict(-1)
		  
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
		      
		      ReDim dict( dict.Ubound + 1 )
		      dict( dict.Ubound ) = new Dictionary
		      
		      'For fieldIndex as Integer = 0 to dbRecordSet.FieldCount - 1
		      For fieldIndex as Integer = 1 to dbRecordSet.FieldCount
		        'theFieldName = dbRecordSet.Field( fieldIndex ).Name
		        theFieldName = dbRecordSet.IdxField( fieldIndex ).Name.ToText
		        theFieldValue = dbRecordSet.IdxField( fieldIndex ).StringValue.ToText
		        
		        dict( dict.Ubound ).Value( theFieldName ) = theFieldValue
		        
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
		  ReDim dict(-1)
		  // Add a row / element
		  ReDim dict( dict.Ubound + 1 )
		  dict( dict.Ubound ) = new Dictionary
		  // Set the Dictionary
		  dict( dict.Ubound ) = pDictionary
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		controlFields() As text
	#tag EndProperty

	#tag Property, Flags = &h0
		controlLabels() As text
	#tag EndProperty

	#tag Property, Flags = &h0
		controlNames() As text
	#tag EndProperty

	#tag Property, Flags = &h0
		dict() As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		listBoxFields() As text
	#tag EndProperty

	#tag Property, Flags = &h0
		listBoxHeader() As text
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

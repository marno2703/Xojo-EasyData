#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  'dbCopy
		  dbLoad
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub dbCopy()
		  '// Copy the database from the bundle to the Documents folder
		  '// so that it can be modified.
		  'Dim dbFile, dest As FolderItem
		  '
		  'try
		  'dbFile = SpecialFolder.GetResource( dbFileName )
		  '// Only copy the file if it is not already there
		  ''If Not SpecialFolder.Documents.Child( dbFileName ).Exists Then
		  'dest = SpecialFolder.Documents.Child( dbFileName )
		  'dbFile.CopyTo( dest )
		  ''End If
		  'catch e as RuntimeException
		  'dbFile = nil
		  'dest = nil
		  'MsgBoxAlert_2015( "Alert", "The database in Resources and/or the Documents folder could not be found.", "OK" )
		  'end try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub dbLoad()
		  Dim dbFile As FolderItem
		  
		  try
		    'dbFile = SpecialFolder.GetResource( dbFileName )
		    dbFile = GetFolderItem("").Child( dbFileName )
		    'dbFile = SpecialFolder.Documents.Child( app.dbFileName )
		  catch e as RuntimeException
		    dbFile = nil
		  end try
		  
		  If dbFile.Exists Then
		    app.db = New SQLiteDatabase
		    app.db.DatabaseFile = dbFile
		    
		    If app.db.Connect Then
		      //app.MsgBoxAlert_2015( "Alert", "Connected to DB", "OK" )
		    End If
		    
		  Else
		    app.MsgBoxAlert( "Alert", "Unable to Locate the Database. Expected Database Path: " + dbFile.NativePath.ToText, "OK" )
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MsgBoxAlert(theTitle as text, theMessage as text, button1Text as text)
		  #IF TargetDesktop OR TargetWeb OR TargetConsole THEN
		    
		    MsgBox ( theTitle + ": " + theMessage )
		    
		  #ELSEIF TargetiOS THEN
		    
		    dim theMsgBox as new iOSMessageBox
		    theMsgBox.Title = theTitle
		    theMsgBox.Message = theMessage
		    Dim buttons() As Text
		    buttons.Append( button1Text )
		    theMsgBox.Buttons = buttons
		    theMsgBox.Show
		    
		  #ENDIF
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		db As SQLiteDatabase
	#tag EndProperty

	#tag Property, Flags = &h0
		dbFileName As Text = "easydata.db"
	#tag EndProperty

	#tag Property, Flags = &h0
		version As text = "2015.1271"
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="dbFileName"
			Group="Behavior"
			InitialValue="AppDatabase.sqlite"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="version"
			Group="Behavior"
			InitialValue="2015.0111"
			Type="text"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

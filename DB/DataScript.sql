USE [TestDatabase]
GO
SET IDENTITY_INSERT [dbo].[tblEmployee] ON 

GO
INSERT [dbo].[tblEmployee] ([EmpID], [EmpName], [Designation], [EmailID], [Salary]) VALUES (5014, N'swati upda', N'sa', N'swati.dubey@synechron1.com', NULL)
GO
INSERT [dbo].[tblEmployee] ([EmpID], [EmpName], [Designation], [EmailID], [Salary]) VALUES (6014, N'adc', N'SE', N'swati.dubey@Synechron.com', NULL)
GO
INSERT [dbo].[tblEmployee] ([EmpID], [EmpName], [Designation], [EmailID], [Salary]) VALUES (6015, N'shrikant', N'SE', N'swati.dubey@Synechron.com', NULL)
GO
INSERT [dbo].[tblEmployee] ([EmpID], [EmpName], [Designation], [EmailID], [Salary]) VALUES (6016, N'hejrth', N'fjhdsk', N'swati.dubey@Synechron.com', NULL)
GO
INSERT [dbo].[tblEmployee] ([EmpID], [EmpName], [Designation], [EmailID], [Salary]) VALUES (6017, N'abjS', N'HD', N'swati.dubey@Synechron.com', NULL)
GO
INSERT [dbo].[tblEmployee] ([EmpID], [EmpName], [Designation], [EmailID], [Salary]) VALUES (6018, N'Vaibhav', N'dec', N'swati.dubey@Synechron.com', NULL)
GO
SET IDENTITY_INSERT [dbo].[tblEmployee] OFF
GO
SET IDENTITY_INSERT [dbo].[tblAddress] ON 

GO
INSERT [dbo].[tblAddress] ([AddressID], [Address], [EmpID]) VALUES (2013, N'na', 5014)
GO
INSERT [dbo].[tblAddress] ([AddressID], [Address], [EmpID]) VALUES (3013, N'Jbp Pune', 6014)
GO
INSERT [dbo].[tblAddress] ([AddressID], [Address], [EmpID]) VALUES (3014, N'Jbp Pune', 6015)
GO
INSERT [dbo].[tblAddress] ([AddressID], [Address], [EmpID]) VALUES (3015, N'Jbp Pune', 6016)
GO
INSERT [dbo].[tblAddress] ([AddressID], [Address], [EmpID]) VALUES (3016, N'Jbp Pune', 6017)
GO
INSERT [dbo].[tblAddress] ([AddressID], [Address], [EmpID]) VALUES (3017, N'Jbp Pune', 6018)
GO
SET IDENTITY_INSERT [dbo].[tblAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[Log] ON 

GO
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (1, CAST(N'2019-07-10 15:42:29.377' AS DateTime), N'6', N'ERROR', N'SYSPUNDTLVQ1', N'
Exception: 
Message: Exception of type ''System.Web.HttpUnhandledException'' was thrown.
StackTrace:    at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.employeeform_aspx.ProcessRequest(HttpContext context)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously).

Inner Exception: 
Message: Test Logger exception
StackTrace:    at EmployeeDetails_Demo.EmployeeForm.Page_Load(Object sender, EventArgs e) in C:\Users\Swati.Dubey\source\repos\EmployeeDetails_Demo\EmployeeDetails_Demo\EmployeeForm.aspx.cs:line 23
   at System.Web.Util.CalliEventHandlerDelegateProxy.Callback(Object sender, EventArgs e)
   at System.Web.UI.Control.OnLoad(EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint).

', N'')
GO
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (2, CAST(N'2019-07-10 17:09:11.353' AS DateTime), N'8', N'ERROR', N'SYSPUNDTLVQ1', N'
Exception: 
Message: Exception of type ''System.Web.HttpUnhandledException'' was thrown.
StackTrace:    at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.employeeform_aspx.ProcessRequest(HttpContext context)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously).

Inner Exception: 
Message: Object reference not set to an instance of an object.
StackTrace:    at EmployeeDetails.DAL.Helper.DBHelper.CommitTransaction() in C:\Users\Swati.Dubey\source\repos\EmployeeDetails_Demo\EmployeeDetails.DAL\Helper\DBHelper.cs:line 136
   at EmployeeDetails.DAL.Helper.DBHelper.ExecuteNonQuery(String query, CommandType commandtype, ConnectionState connectionstate) in C:\Users\Swati.Dubey\source\repos\EmployeeDetails_Demo\EmployeeDetails.DAL\Helper\DBHelper.cs:line 167
   at EmployeeDetails.DAL.EmployeeRepository.AddEmpDetails(Employee employee) in C:\Users\Swati.Dubey\source\repos\EmployeeDetails_Demo\EmployeeDetails.DAL\EmployeeRepository.cs:line 26
   at EmployeeDetails.BAL.EmployeeBL.AddEmpDetails(Employee employee) in C:\Users\Swati.Dubey\source\repos\EmployeeDetails_Demo\EmployeeDetails.BAL\EmployeeBL.cs:line 35
   at EmployeeDetails_Demo.EmployeeForm.btnAdd_Click(Object sender, EventArgs e) in C:\Users\Swati.Dubey\source\repos\EmployeeDetails_Demo\EmployeeDetails_Demo\EmployeeForm.aspx.cs:line 183
   at System.Web.UI.WebControls.Button.OnClick(EventArgs e)
   at System.Web.UI.WebControls.Button.RaisePostBackEvent(String eventArgument)
   at System.Web.UI.WebControls.Button.System.Web.UI.IPostBackEventHandler.RaisePostBackEvent(String eventArgument)
   at System.Web.UI.Page.RaisePostBackEvent(IPostBackEventHandler sourceControl, String eventArgument)
   at System.Web.UI.Page.RaisePostBackEvent(NameValueCollection postData)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint).

', N'')
GO
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (3, CAST(N'2019-07-10 17:53:16.247' AS DateTime), N'7', N'ERROR', N'SYSPUNDTLVQ1', N'
Exception: 
Message: Exception of type ''System.Web.HttpUnhandledException'' was thrown.
StackTrace:    at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.employeeform_aspx.ProcessRequest(HttpContext context)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously).

Inner Exception: 
Message: There is an error in XML document (1, 2).
StackTrace:    at System.Xml.Serialization.XmlSerializer.Deserialize(XmlReader xmlReader, String encodingStyle, XmlDeserializationEvents events)
   at System.Xml.Serialization.XmlSerializer.Deserialize(TextReader textReader)
   at EmployeeDetails_Demo.EmployeeForm.DeserializeInnerSoapObject[T](String soapResponse) in C:\Users\Swati.Dubey\source\repos\EmployeeDetails_Demo\EmployeeDetails_Demo\EmployeeForm.aspx.cs:line 206
   at EmployeeDetails_Demo.EmployeeForm.btnUpdate_Click(Object sender, EventArgs e) in C:\Users\Swati.Dubey\source\repos\EmployeeDetails_Demo\EmployeeDetails_Demo\EmployeeForm.aspx.cs:line 220
   at System.Web.UI.WebControls.Button.OnClick(EventArgs e)
   at System.Web.UI.WebControls.Button.RaisePostBackEvent(String eventArgument)
   at System.Web.UI.WebControls.Button.System.Web.UI.IPostBackEventHandler.RaisePostBackEvent(String eventArgument)
   at System.Web.UI.Page.RaisePostBackEvent(IPostBackEventHandler sourceControl, String eventArgument)
   at System.Web.UI.Page.RaisePostBackEvent(NameValueCollection postData)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint).

Inner Exception: 
Message: <UpdateEmpDetailsResponse xmlns=''http://tempuri.org/''> was not expected.
StackTrace:    at System.Xml.Serialization.XmlSerializationPrimitiveReader.Read_int()
   at System.Xml.Serialization.XmlSerializer.DeserializePrimitive(XmlReader xmlReader, XmlDeserializationEvents events)
   at System.Xml.Serialization.XmlSerializer.Deserialize(XmlReader xmlReader, String encodingStyle, XmlDeserializationEvents events).


', N'')
GO
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (4, CAST(N'2019-07-12 16:37:47.527' AS DateTime), N'6', N'ERROR', N'SYSPUNDTLVQ1', N'
Exception: 
Message: Exception of type ''System.Web.HttpUnhandledException'' was thrown.
StackTrace:    at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.employeeform_aspx.ProcessRequest(HttpContext context)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously).

Inner Exception: 
Message: Invalid queue path name.
StackTrace:    at System.Messaging.MessageQueue.ResolveFormatNameFromQueuePath(String queuePath, Boolean throwException)
   at System.Messaging.MessageQueue.Exists(String path)
   at EmployeeDetails.BAL.EmployeeBL..ctor() in C:\Users\Swati.Dubey\source\repos\EmployeeDetails_Demo\EmployeeDetails.BAL\EmployeeBL.cs:line 18
   at EmployeeDetails_Demo.EmployeeForm.addEmployeeDetail() in C:\Users\Swati.Dubey\source\repos\EmployeeDetails_Demo\EmployeeDetails_Demo\EmployeeForm.aspx.cs:line 96
   at EmployeeDetails_Demo.EmployeeForm.btnAdd_Click(Object sender, EventArgs e) in C:\Users\Swati.Dubey\source\repos\EmployeeDetails_Demo\EmployeeDetails_Demo\EmployeeForm.aspx.cs:line 54
   at System.Web.UI.WebControls.Button.OnClick(EventArgs e)
   at System.Web.UI.WebControls.Button.RaisePostBackEvent(String eventArgument)
   at System.Web.UI.WebControls.Button.System.Web.UI.IPostBackEventHandler.RaisePostBackEvent(String eventArgument)
   at System.Web.UI.Page.RaisePostBackEvent(IPostBackEventHandler sourceControl, String eventArgument)
   at System.Web.UI.Page.RaisePostBackEvent(NameValueCollection postData)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint).

', N'')
GO
INSERT [dbo].[Log] ([Id], [Date], [Thread], [Level], [Logger], [Message], [Exception]) VALUES (1004, CAST(N'2019-07-12 17:16:42.200' AS DateTime), N'5', N'ERROR', N'SYSPUNDTLVQ1', N'
Exception: 
Message: Exception of type ''System.Web.HttpUnhandledException'' was thrown.
StackTrace:    at System.Web.UI.Page.HandleError(Exception e)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)
   at System.Web.UI.Page.ProcessRequest()
   at System.Web.UI.Page.ProcessRequestWithNoAssert(HttpContext context)
   at System.Web.UI.Page.ProcessRequest(HttpContext context)
   at ASP.employeeform_aspx.ProcessRequest(HttpContext context)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously).

Inner Exception: 
Message: The remote server returned an error: (500) Internal Server Error.
StackTrace:    at System.Net.HttpWebRequest.GetResponse()
   at EmployeeDetails_Demo.EmployeeForm.SOAPManual(Int32 empID) in C:\Users\Swati.Dubey\source\repos\EmployeeDetails_Demo\EmployeeDetails_Demo\EmployeeForm.aspx.cs:line 174
   at EmployeeDetails_Demo.EmployeeForm.loadEmployeeDetails() in C:\Users\Swati.Dubey\source\repos\EmployeeDetails_Demo\EmployeeDetails_Demo\EmployeeForm.aspx.cs:line 77
   at EmployeeDetails_Demo.EmployeeForm.ddlEmpID_SelectedIndexChanged(Object sender, EventArgs e) in C:\Users\Swati.Dubey\source\repos\EmployeeDetails_Demo\EmployeeDetails_Demo\EmployeeForm.aspx.cs:line 44
   at System.Web.UI.WebControls.ListControl.OnSelectedIndexChanged(EventArgs e)
   at System.Web.UI.WebControls.DropDownList.RaisePostDataChangedEvent()
   at System.Web.UI.WebControls.DropDownList.System.Web.UI.IPostBackDataHandler.RaisePostDataChangedEvent()
   at System.Web.UI.Page.RaiseChangedEvents()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint).

', N'')
GO
SET IDENTITY_INSERT [dbo].[Log] OFF
GO

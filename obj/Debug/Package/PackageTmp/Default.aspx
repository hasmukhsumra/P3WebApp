﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="_Default" Codebehind="Default.aspx.cs" MasterPageFile="~/Site.Master" %>
<%@ Register src="RssReader.ascx" tagname="RssReader" tagprefix="uc1" %>
<asp:Content runat="server" ContentPlaceHolderID="MetaContent" ID="contentMeta">
    <title>PMP Certification Boot Camp Training and Lean Six Sigma Training</title>
<meta name="description" content="Our PMP Certification and Lean Six Sigma Boot Camp Training Classes have the Highest Pass Rate, Guaranteed! !" />
<meta name="keywords" content="PMP Certification, PMP Certification Training, PMP Boot Camp, PMP Bootcamp, Lean Six Sigma Certification, Lean Six Sigma Training"/>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="BannerContent" ID="contentBanner">
    <div id="flashDropZone"></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="MainContent" ID="contentMain">
                        <h1 style="text-align:center">PMP&reg; Certification  and Lean Six Sigma Training</h1>
                	    <p align="left">At Pinnacle 3 Learning we are committed to ensuring that we provide the Best PMP<span style="text-align:center">&reg;</span> Certification and Lean Six Sigma Training available. We offer a variety of intense, Instructor Led, Boot Camp style classes. We specialize in PMP&reg; Certification and Lean Six Sigma Training and we understand the value of your time. We make every effort to maximize your learning, while delivering unparalleled Service and Quality.  Let us help you achieve your Pinnacle today!
                         </p>
                	    <h2 align="center" class="pPadH2">Upcoming PMP Certification Boot Camp Training Classes</h2>
                	    <div style="text-align:center">
                            <div style="margin:2px 4px 4px 4px;">
                                <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="false" DataSourceID="defaultQuery" Skin="Web20"
                                 GridLines="None" BorderWidth="0px"
                                >
                                <ClientSettings EnableRowHoverStyle="true">
                                 <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="True" ScrollHeight="175px"></Scrolling>
                                </ClientSettings>
                                <MasterTableView DataKeyNames="ClassID" Width="100%">
                                <HeaderStyle Font-Size="Medium" HorizontalAlign="Center"  Font-Bold="True"  />
                                <ItemStyle CssClass="TelerikItem"/>
                                <AlternatingItemStyle CssClass="TelerikItem" />
                                    <Columns>                                       
                                        <telerik:GridTemplateColumn HeaderText="Location" SortExpression="City" >
                                        <HeaderStyle Width="180px" />
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink1" Font-Size="Small" runat="server" ToolTip="More info about this city" NavigateUrl='<%#"pmp-certification-" + Eval("LocationSeo") %>' Text='<%# Bind("City") %>' ></asp:HyperLink>
                                                <%--<asp:Image ID="Image1" runat="server" ImageUrl='<%#  Eval("HOT") %>' AlternateText="$250 Discount. Already applied to select Classes."  />--%>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                         <telerik:GridTemplateColumn HeaderText="Date" SortExpression="ClassDate">
                                        <HeaderStyle Width="180px" />
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" Font-Size="Small" runat="server" Text='<%# Bind("ClassDate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>         
                                        <telerik:GridTemplateColumn HeaderText="Register">
                                            <ItemTemplate>
                                            <asp:imagebutton runat="server" ImageUrl="~/images/register_now.jpg" ToolTip="Register now for this class" ID="ibtnRegister"  CommandArgument='<%#Eval("ClassID") %>' PostBackUrl='<%#"register.aspx?classID=" + Eval("ClassID") %>' />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                </MasterTableView>
                                </telerik:RadGrid>
                            </div>
                            See Our Full <a class="classTypes" href="pmp-certification-training.aspx"><i>PMP&reg; Certification Class</i> schedule</a>
                	        <asp:AccessDataSource ID="defaultQuery" runat="server" 
                                DataFile="~/App_Data/classes_v2.mdb" SelectCommand="
                                SELECT TOP 8 classes.ClassID, ClassType.classTypeDesc, DaysOfWeek.Description, Hotels.HotelWebsite,Locations.LocationSeo, Locations.LocationDesc as City, classes.HOT, 
                                iif (DaysOfWeek.DaysOfWeekID =1,
                                Format(classes.ClassDate,&quot;mmm d&quot;) & &quot; - &quot; & Format(classes.ClassDate+3,&quot;d&quot;) & &quot;, &quot; & Format(classes.ClassDate,&quot;yyyy&quot;)  
,
Format(classes.ClassDate,&quot;mmm d&quot;) & &quot;, &quot; &  
iif(Format(classes.ClassDate,&quot;mm&quot;) <> Format(classes.ClassDate+1,&quot;mm&quot;), Format(classes.ClassDate+1,&quot;mmm&quot;) & &quot; &quot;, &quot;&quot;) & Format(classes.ClassDate+1,&quot;d&quot;) & &quot; & &quot;  &
iif(Format(classes.ClassDate+1,&quot;mm&quot;) <> Format(classes.ClassDate+7,&quot;mm&quot;), Format(classes.ClassDate+7,&quot;mmm&quot;) & &quot; &quot;, &quot;&quot;) & Format(classes.ClassDate+7,&quot;d&quot;) & &quot;, &quot; &
iif(Format(classes.ClassDate+7,&quot;mm&quot;) <> Format(classes.ClassDate+8,&quot;mm&quot;), Format(classes.ClassDate+8,&quot;mmm&quot;) & &quot; &quot;, &quot;&quot;) & Format(classes.ClassDate+8,&quot;d&quot;) 

) as ClassDate,
    classes.ClassDate as dtClassDate,  
    classes.Comment,
                                classes.SeatsAvailable, classes.numdays, classes.ClassDaysID
                            FROM Locations INNER JOIN (ClassType INNER JOIN (Hotels INNER JOIN (DaysOfWeek INNER JOIN classes ON DaysOfWeek.DaysOfWeekID=classes.ClassDaysID) ON Hotels.HotelID=classes.HotelID) ON ClassType.classTypeID=classes.ClassTypeID) ON Locations.LocationID=classes.LocationID
                            WHERE (((classes.ClassDate)&gt;=Now()))
                            AND classes.ClassTypeID=1
                            AND classes.ClassDaysID = 1
                            AND ((classes.ClassDate) Between DateAdd(&quot;d&quot;,1,Date()) And DateAdd(&quot;d&quot;,30,Date())) 
                                "></asp:AccessDataSource>
                	        <%-- AND ((classes.ClassDate) Between DateAdd(&quot;d&quot;,7,Date()) And DateAdd(&quot;d&quot;,20,Date())) ;--%>
                	        
                	        
                	    </div>
                        <h2 align="center" class="pPadH2">Upcoming Lean Six Sigma Certification Classes</h2>
                        <div style="text-align:center">
                            <div style="margin:2px 4px 4px 4px;">
                                <telerik:RadGrid ID="RadGrid2" runat="server" AutoGenerateColumns="false" DataSourceID="leanSixQuery" Skin="Web20"
                                 GridLines="None" BorderWidth="0px"
                                >
                                <ClientSettings EnableRowHoverStyle="true">
                                 <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="True" ScrollHeight="175px"></Scrolling>
                                </ClientSettings>
                                <MasterTableView DataKeyNames="G_ClassID" Width="100%">
                                <HeaderStyle Font-Size="Medium" HorizontalAlign="Center"  Font-Bold="True"  />
                                <ItemStyle CssClass="TelerikItem"/>
                                <AlternatingItemStyle CssClass="TelerikItem" />
                                    <Columns>
                                        <telerik:GridTemplateColumn HeaderText="Location" SortExpression="LocationDesc" >
                                            <HeaderStyle Width="115px" />
                                            <ItemTemplate>
                                                <%# Eval("LocationDesc") %>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn HeaderText="Green Belt" >
                                            <HeaderStyle Width="100px" />
                                            <ItemTemplate>
                                            <%# Eval("G_Days")%>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn HeaderText="Register" >
                                            <HeaderStyle Width="100px" />
                                            <ItemTemplate>
                                            <asp:imagebutton runat="server" ImageUrl="~/images/register_now.jpg" ToolTip="Register now for this class" ID="ibtnRegisterL6G"  CommandArgument='<%#Eval("G_ClassID") %>' PostBackUrl='<%#"register.aspx?classID=" + Eval("G_ClassID") %>' />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn HeaderText="Black Belt">
                                            <HeaderStyle Width="100px" />
                                            <ItemTemplate>
                                            <%# Eval("B_Days")%>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridTemplateColumn HeaderText="Register">
                                            <HeaderStyle Width="100px" />
                                            <ItemTemplate>
                                            <asp:imagebutton runat="server" ImageUrl="~/images/register_now.jpg" ToolTip="Register now for this class" ID="ibtnRegisterL6B"  CommandArgument='<%#Eval("B_ClassID") %>' PostBackUrl='<%#"register.aspx?classID=" + Eval("B_ClassID") %>' />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        
                                    </Columns>
                                </MasterTableView>
                                </telerik:RadGrid>
                            </div>
                            <p>
                            See Our Full <a class="classTypes" href="lean-six-sigma-black-belt.aspx">Lean Six Sigma <i>Black Belt</i> Schedule</a></p>
                            <p>See Our Full <a class="classTypes" href="lean-six-sigma-green-belt.aspx">Lean Six Sigma <i>Green Belt</i> Schedule</a></p>
                	        <asp:AccessDataSource ID="leanSixQuery" runat="server" 
                                DataFile="~/App_Data/classes_v2.mdb" SelectCommand="
 SELECT classes.ClassID as B_ClassID, classes_1.ClassID as G_ClassID, classes.ClassTypeID as B_ClassTypeID, classes_1.ClassTypeID as G_ClassTypeID, ClassType.classTypeDesc, ClassType_1.classTypeDesc, DaysOfWeek.Description, DaysOfWeek_1.Description, Locations.LocationDesc, Locations.LocationSeo,
Format(classes.ClassDate,&quot;mmm d&quot;) & &quot; - &quot; & Format(classes.ClassDate+4,&quot;d&quot;) as B_Days ,
Format(classes_1.ClassDate,&quot;mmm d&quot;) & &quot; - &quot; & Format(classes_1.ClassDate+2,&quot;d&quot;) as G_Days ,
classes.ClassDate
FROM (((classes AS classes_1 INNER JOIN Locations AS Locations_1 ON classes_1.LocationID = Locations_1.LocationID) INNER JOIN ClassType AS ClassType_1 ON classes_1.ClassTypeID = ClassType_1.classTypeID) INNER JOIN DaysOfWeek AS DaysOfWeek_1 ON classes_1.ClassDaysID = DaysOfWeek_1.DaysOfWeekID) INNER JOIN (Locations INNER JOIN (DaysOfWeek INNER JOIN (ClassType INNER JOIN classes ON ClassType.classTypeID = classes.ClassTypeID) ON DaysOfWeek.DaysOfWeekID = classes.ClassDaysID) ON Locations.LocationID = classes.LocationID) ON (classes_1.LocationID = classes.LocationID) AND (classes_1.ClassDate = classes.ClassDate)
WHERE (((classes.ClassTypeID)=7) AND ((classes_1.ClassTypeID)=6))
                            AND (((classes.ClassDate)&gt;=Now()))
                            AND ((classes.ClassDate) Between DateAdd(&quot;d&quot;,1,Date()) And DateAdd(&quot;d&quot;,30,Date())) 
                            ORDER BY classes.classdate, locations.locationdesc, classtype.classtypedesc
                                "></asp:AccessDataSource>
                	        
                	        
                	    </div>
                        <p align="left" style="margin-top:6px;">&nbsp;</p>
                        <h2 align="center"><u>PMP&reg; &amp; Lean Six Sigma Certification News</u></h2>
                        <uc1:RssReader ID="RssReader" runat="server" />
<script type="text/javascript">
    var flashvars = {};
    var params = {};
    var attributes = {};
    swfobject.embedSWF("flash/pinnacle3Header.swf", "flashDropZone", "958", "254", "9.0.0", "expressInstall.swf", flashvars, params, attributes);
</script>
</asp:Content>
                	
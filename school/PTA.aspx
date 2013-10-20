﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PTA.aspx.vb" Inherits="Blaeneinion.PTA" %>

<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
<body style="font-family: 'Comic Sans MS'">
    <form id="form1" runat="server">
    <asp:GridView ID="grdPTA" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="id" DataSourceID="ds_pta" 
        EmptyDataText="{no data}" ForeColor="#333333" GridLines="None" 
        ShowHeader="False" Width="711px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id" 
                Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblID" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <dx:ASPxBinaryImage ID="ASPxBinaryImage1" runat="server" 
                        ContentBytes='<%# IIf(Typeof(Eval("image_blob")) is DBNull, Nothing, Eval("image_blob")) %>' Height="50px" Width="50px">
                             <EmptyImage Url='~/school/images/generic_sex_icon.jpg'>
                            </EmptyImage>
                    </dx:ASPxBinaryImage>
                </ItemTemplate>
                <ItemStyle Width="51px" />
            </asp:TemplateField>
            <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="pta_name" HeaderText="Fullname" 
                SortExpression="pta_name">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="blurb" HeaderText="blurb" SortExpression="blurb">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <EmptyDataRowStyle BackColor="#FF9933" Font-Bold="True" 
            HorizontalAlign="Center" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="ds_pta" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ysgolConnectionString %>" 
        SelectCommand="SELECT school_pta.id, school_pta.pta_name, school_pta.title, school_pta.blurb, school_pta.image_url, school_pta.image_id, school_images.image_blob 
FROM school_pta 
LEFT OUTER JOIN school_images ON school_pta.image_id = school_images.uniq" 
        ProviderName="<%$ ConnectionStrings:ysgolConnectionString.ProviderName %>">
    </asp:SqlDataSource>
    </form>
</body>
</html>

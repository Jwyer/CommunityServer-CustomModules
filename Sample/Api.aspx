<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Api.aspx.cs" MasterPageFile="Masters/BasicTemplate.Master" Inherits="ASC.Web.Sample.Api" %>

<%@ MasterType TypeName="ASC.Web.Sample.Masters.BasicTemplate" %>

<asp:Content ID="CommonContainer" ContentPlaceHolderID="BTPageContent" runat="server">
    <div>
        <h1>How to create  API for your own module</h1>
        <ol>
            <li>Create an Class Library (ASC.Api.Sample) project<br />
                and put it to the ...module\ASC.Api\ASC.Api.Sample folder<br />
                IMPORTANT!!! The output dll file name must be "ASC.Api.*.dll";
            </li>
            <li>Connect the required references from ...\web\studio\ASC.Web.Studio\bin\
<pre>
<code>
ASC.Api.dll
ASC.Web.Sample.dll
</code>
</pre>
            </li>
            <li>Create SampleApi class and implement the IApiEntryPoint interface.
<pre>
<code>
public class SampleApi : IApiEntryPoint
{
    public string Name
    {
        get { return "sample"; }
    }
}
</code>
</pre>
            </li>
            <li>Create public methods with specific attributes.
<pre>
<code>
[Attributes.Create("create", false)]
public SampleClass Create(string value)
{
    return SampleDao.Create(value);
}

[Attributes.Read(@"read/{id:[0-9]+}", false)]
public SampleClass Read(int id)
{
    return SampleDao.Read(id);
}

[Attributes.Read("read", false)]
public List&lt;SampleClass&gt; Read()
{
    return SampleDao.Read();
}

[Attributes.Update("update", false)]
public void Update(int id, string value)
{
    SampleDao.Update(id, value);
}

[Attributes.Delete("delete/{id:[0-9]+}", false)]
public void Delete(int id)
{
    SampleDao.Delete(id);
}
</code>
</pre>
                The attribute specifies the type of method, the path by which this method will be called, the authorization and verification of the tariff plan in it.<br />
                Possible options are shown below:
<pre>
<code>
CreateAttribute(string path, bool requiresAuthorization = true, bool checkPayment = true) //corresponds to the "POST" request
UpdateAttribute(string path, bool requiresAuthorization = true, bool checkPayment = true) //corresponds to the "PUT" request
DeleteAttribute(string path, bool requiresAuthorization = true, bool checkPayment = true) //corresponds to the "DELETE" request
ReadAttribute(string path, bool requiresAuthorization = true, bool checkPayment = true) //corresponds to the "GET" request
</code>
</pre>
                the parameters requiresAuthorization, checkPayment are optional and have a value of true by default
            </li>
            <li>Set the output path in the project properties as
<pre>
<code>
&lt;OutputPath&gt;..\..\..\web\studio\ASC.Web.Studio\bin\&lt;/OutputPath&gt;
&lt;DocumentationFile&gt;..\..\..\web\studio\ASC.Web.Studio\bin\ASC.Api.Sample.XML&lt;/DocumentationFile&gt;
</code>
</pre>
                so that the builds were created at the web\studio\ASC.Web.Studio\bin folder
            </li>
            <li>The project can be built manually or using the builder.
                <br />
                For the latter add the following lines to the build\msbuild\build.proj file:
<pre>
<code>
&lt;ProjectToBuild Include="$(ASCDir)module\ASC.Api\ASC.Api.Sample\ASC.Api.Sample.csproj"/&gt;
</code>
</pre>
                and run the build\Build.bat file
            </li>
            <li>IMPORTANT!!! Add ASC.Api.Sample.SampleApi to web\studio\ASC.Web.Studio\web.autofac.config
<pre>
<code>
&lt;component
          type="ASC.Api.Sample.SampleApi, ASC.Api.Sample"
          service="ASC.Api.Interfaces.IApiEntryPoint, ASC.Api"
          name="sample"/&gt;
</code>
</pre>
            </li>
            <li>Build project, run website and test the method by making a query with jQuery<br />
                <br />
                GET:
<pre>
<code>
$.get("http://localhost:port/api/2.0/sample/read.json");
$.get("http://localhost:port/api/2.0/sample/read/{id}.json");
</code>
</pre>
                POST:
<pre>
<code>
$.ajax({
    type: "POST",
    url: "http://localhost:port/api/2.0/sample/create.json",
    data: {value: "create"}
});
</code>
</pre>
                PUT:
<pre>
<code>
$.ajax({
    type: "PUT",
    url: "http://localhost:port/api/2.0/sample/update.json",
    data: {id: 100500, value: "update"}
});
</code>
</pre>
                DELETE:
<pre>
<code>
$.ajax({
    url: "http://localhost:port/api/2.0/sample/delete/{id}.json",
    type: "DELETE"
});
</code>
</pre>
            </li>
        </ol>

        <h1>Example</h1>

        <table id="itemsTbl">
            <colgroup>
                <col width="150px" />
                <col width="300px" />
                <col width="300px" />
            </colgroup>
            <thead>
                <tr>
                    <th>id</th>
                    <th>value</th>
                    <th>actions</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>

        <div class="middle-button-container">
            <a id="addBtn" class="button blue middle">Add</a>
        </div>

        <script id="itemTmpl" type="text/x-jquery-tmpl">
            <tr>
                <td>${id}
                </td>
                <td id="itemValue_${id}">${value}
                </td>
                <td>
                    <a data-id="${id}" class="button blue middle editBtn">Edit</a>
                    <span class="splitter-buttons"></span>
                    <a data-id="${id}" class="button blue middle deleteBtn">Delete</a>
                </td>
            </tr>
        </script>

        <div id="itemDialog" class="display-none">
            <div class="popupContainerClass">
                <div class="containerHeaderBlock">
                    <table style="width: 100%;" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr>
                                <td>
                                    <div>Item Dialog</div>
                                </td>
                                <td class="popupCancel">
                                    <div class="cancelButton close-popup">×</div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="containerBodyBlock">
                    <input id="itemValue" type="text" class="textEdit" style="width: 100%" maxlength="255" />
                    <input id="itemId" type="hidden" />
                    <div class="middle-button-container">
                        <a class="button blue middle save-popup">Save</a>
                        <span class="splitter-buttons"></span>
                        <a class="button gray middle close-popup">Cancel</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


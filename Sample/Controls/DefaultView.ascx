<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DefaultView.ascx.cs" Inherits="ASC.Web.Sample.Controls.DefaultView" %>

<div>

    <h1>How to create your own module for ONLYOFFICE</h1>

    <ol>
        <li>
            Create an ASP.NET Web Application (ASC.Web.Sample) project<br/>
            and put it to the ...web\studio\ASC.Web.Studio\Products\Sample folder<br/>
            IMPORTANT!!! The output dll file name must be "ASC.Web.*.dll";
        </li>
        <li>
            Connect the required references from ...\web\studio\ASC.Web.Studio\bin\
<pre>
<code>
ASC.Common.dll
ASC.Core.Common.dll
ASC.Data.Storage.dll
ASC.Web.Core.dll
ASC.Web.Studio.dll
</code>
</pre>
        </li>
        <li>
            Implement the IProduct interface in the ProductEntryPoint.cs file<br/>
            IMPORTANT!!! The ProductID must be unique Guid (in VS2012 is generated as TOOLS->GUID->New GUID)
        </li>
        <li>
            NOTE!!! Add the following in the AssemblyInfo.cs file:
<pre>
<code>
[assembly: Product(typeof(ASC.Web.Sample.Configuration.ProductEntryPoint))]
</code>
</pre>
        </li>
        <li>
            Inherit the Master from web\studio\ASC.Web.Studio\Masters\BaseTemplate.master
        </li>
        <li>
            Set the output path in the project properties as 
<pre>
<code>
&lt;OutputPath&gt;..\..\bin\&lt;/OutputPath&gt;
</code>
</pre>
            so that the builds were created at the web\studio\ASC.Web.Studio\bin folder
        </li>
        <li>
            The project can be built manually or using the builder. <br/>
            For the latter add the following lines to the build\msbuild\build.proj file:
<pre>
<code>
&lt;ProjectToBuild Include="$(ASCDir)web\studio\ASC.Web.Studio\Products\Sample\ASC.Web.Sample.csproj"/&gt;
</code>
</pre>
            and run the build\Build.bat file
        </li>
        <li>
            After the build run the website at the localhost:port address,<br/>
            go to the "Modules & Tools" Settings page (http://localhost:port/management.aspx?type=2)<br/>
            and enable the new Sample module.<br/>
            It will be available in the portal header drop-down menu afterwards<br/>
            or using the direct link: http://localhost:port/products/sample/default.aspx
        </li>
    </ol>

</div>

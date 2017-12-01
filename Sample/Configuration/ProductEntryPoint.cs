/*
 *
 * (c) Copyright Ascensio System Limited 2010-2017
 *
 * This program is freeware. You can redistribute it and/or modify it under the terms of the GNU 
 * General Public License (GPL) version 3 as published by the Free Software Foundation (https://www.gnu.org/copyleft/gpl.html). 
 * In accordance with Section 7(a) of the GNU GPL its Section 15 shall be amended to the effect that 
 * Ascensio System SIA expressly excludes the warranty of non-infringement of any third-party rights.
 *
 * THIS PROGRAM IS DISTRIBUTED WITHOUT ANY WARRANTY; WITHOUT EVEN THE IMPLIED WARRANTY OF MERCHANTABILITY OR
 * FITNESS FOR A PARTICULAR PURPOSE. For more details, see GNU GPL at https://www.gnu.org/copyleft/gpl.html
 *
 * You can contact Ascensio System SIA by email at sales@onlyoffice.com
 *
 * The interactive user interfaces in modified source and object code versions of ONLYOFFICE must display 
 * Appropriate Legal Notices, as required under Section 5 of the GNU GPL version 3.
 *
 * Pursuant to Section 7 § 3(b) of the GNU GPL you must retain the original ONLYOFFICE logo which contains 
 * relevant author attributions when distributing the software. If the display of the logo in its graphic 
 * form is not reasonably feasible for technical reasons, you must include the words "Powered by ONLYOFFICE" 
 * in every copy of the program you distribute. 
 * Pursuant to Section 7 § 3(e) we decline to grant you any rights under trademark law for use of our trademarks.
 *
*/


using System;
using System.Linq;
using ASC.Web.Core;
using ASC.Web.Core.Utility;
using ASC.Web.Sample.Classes;
using ASC.Web.Sample.Master.ClientScripts;
using ASC.Web.Sample.Resources;

namespace ASC.Web.Sample.Configuration
{
    public class ProductEntryPoint : Product
    {
        public static readonly Guid Id = new Guid("{314B5C27-631B-4C6C-8B11-C6400491ABEF}");

        private ProductContext _context;

        public override Guid ProductID
        {
            get { return Id; }
        }

        public override string Name
        {
            get { return SampleResource.ProductName; }
        }

        public override string ExtendedDescription
        {
            get { return string.Format(SampleResource.ExtendedProductDescription, "<span style='display:none'>", "</span>"); }
        }

        public override string Description
        {
            get { return SampleResource.ProductDescription; }
        }

        public override string StartURL
        {
            get { return PathProvider.BaseVirtualPath; }
        }

        public override string HelpURL
        {
            get { return string.Concat(PathProvider.BaseVirtualPath, "help.aspx"); }
        }

        public override string ProductClassName
        {
            get { return "sample"; }
        }

        public override bool Visible
        {
            get { return true; }
        }

        public override ProductContext Context
        {
            get { return _context; }
        }

        public string ModuleSysName { get; set; }


        public override void Init()
        {
            _context = new ProductContext
                {
                    MasterPageFile = String.Concat(PathProvider.BaseVirtualPath, "Masters/BasicTemplate.Master"),
                    DisabledIconFileName = "product_logo_disabled.png",
                    IconFileName = "product_logo.png",
                    LargeIconFileName = "product_logo_large.png",
                    DefaultSortOrder = 100,
                    SubscriptionManager = null,
                    SpaceUsageStatManager = null,
                    AdminOpportunities = () => SampleResource.ProductAdminOpportunities.Split('|').ToList(),
                    UserOpportunities = () => SampleResource.ProductUserOpportunities.Split('|').ToList(),
                };

            SearchHandlerManager.Registry(new SampleSearchHandler());

            ClientScriptLocalization = new ClientLocalizationResources();
        }
    }
}
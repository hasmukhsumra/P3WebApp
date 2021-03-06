﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using Samurai;

namespace P3WebApp
{
    public class Global : System.Web.HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            Samurai.Samurai.Options = new SamuraiOptions()
            {
                MerchantKey = "e137aef1ce125f2063824a98",
                MerchantPassword = "da21d6602f0d4028883c3b71",
                ProcessorToken = "9db5f40cbbd5340b7c2e1e60"
            };

        }

        void Application_BeginRequest(object sender, EventArgs e)
        {

            //string fullOrigionalpath = Request.Url.ToString();

            //if (fullOrigionalpath.Contains("/location.aspx"))
            //{
            //    string city = Request.QueryString["city"];
            //    Context.RewritePath(city+"-pmp-certification-training");
            //}
        } 

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
            if (ConfigurationManager.AppSettings["CustomErrors"] == "true")
                Server.Transfer("error.aspx");

        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started

        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.

        }

    }
}

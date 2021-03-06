﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Toems_FrontEnd.views.images.profiles
{
    public partial class multicast : BasePages.Images
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtSender.Text = ImageProfile.SenderArguments;
                txtReceiver.Text = ImageProfile.ReceiverArguments;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            ImageProfile.SenderArguments = txtSender.Text;
            ImageProfile.ReceiverArguments = txtReceiver.Text;
            var result = Call.ImageProfileApi.Put(ImageProfile.Id, ImageProfile);
            EndUserMessage = result.Success ? "Successfully Updated Image Profile" : result.ErrorMessage;
        }
    }
}
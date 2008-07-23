From: Dave <finalglide@gmail.com>
Subject: Re: patch-o-matic problems..?
Date: Tue, 22 Jul 2008 17:36:46 -0700
Message-ID: <935fab200807221736k5c95037fgac0eac3e1e4915b2@mail.gmail.com>
References: <alpine.DEB.1.10.0807192237270.9838@fairy.dhcp.penguin>
	 <alpine.LNX.1.10.0807201105300.21244@fbirervta.pbzchgretzou.qr>
	 <alpine.DEB.1.10.0807201544510.8813@fairy.dhcp.penguin>
	 <alpine.LNX.1.10.0807201652360.21244@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=wY+pnzaAh3ytHeu1XscpH9azPg8UIhXLv5rQUAqVjvM=;
        b=I7qA/a9qEi5QPKoSTd3r1jY3OSn7sojawwLTDmWM8tzxGh8Uu1OMohLwfHx56AOgXR
         3M91sge6YrRSwrLSLTGe2wQcDlqagl/gWjILf7iAWsHQbt30/LhH239pMzmZvMxv9elr
         oFvVs5m0wCqq0JpKCEKecDCLcVPK0GT+MwSTo=
In-Reply-To: <alpine.LNX.1.10.0807201652360.21244@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have to agree with these guys, the whole POM and Xtables things is
extremely confusing to the newbies.

Is there any way to clean this up on the Netfilter site so all the
other newbies don't have to deal with the same issues over and over?

My idea as how it should be presented >>

1) Remote POM from Netfilter.org
2) Add Xtables-Addons to Netfilter.org
3) Add documentation on reasons why moving to Xtables and how it works
to Netfilter.org

-Dave

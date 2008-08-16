From: Jan Klod <janklodvan@gmail.com>
Subject: Re: VPN (interface) access for and all traffic through from single user -- how to do it?
Date: Sat, 16 Aug 2008 23:47:54 +0300
Message-ID: <200808162347.55392.janklodvan@gmail.com>
References: <200808151255.44987.janklodvan@gmail.com> <200808152212.59882.janklodvan@gmail.com> <48A5F9E2.5080206@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=il6IcIYG8HC1h+LnxqO0GLNyyUR4zHGtcNg+CwurBOw=;
        b=ZjXmZNkTd9JW3/L358h7B4WYaXSgHgHu1kBMCKj8It9v2WPOv6l/1z7yxEO8P7QZAz
         4XS/vCaTUQ54/684rdElobgErKoHq5SDWusRPyrCmgwKtR9b2yd4EezL5SDvQJX5DmYr
         VuzJFM6qfwQCZOfoDGd6UTxIW4CWLucbHPvDM=
In-Reply-To: <48A5F9E2.5080206@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Still asking questions. I tried to follow probably the most simple case 
presented here:
http://pptpclient.sourceforge.net/routing.phtml#all-to-tunnel
but result is no access to internet at all. How can I debug these things and 
find out what is going on? Now it is like in the dark...

Is it considerable to be a proof, that pptp VPN tunnel is working, if I can 
ping -i ppp0 <remote VPN address>?

Looking for solutions,
Jan

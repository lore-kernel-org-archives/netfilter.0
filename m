From: Jan Klod <janklodvan@gmail.com>
Subject: Re: VPN (interface) access for and all traffic through from single user -- how to do it?
Date: Fri, 15 Aug 2008 19:19:22 +0300
Message-ID: <200808151919.23070.janklodvan@gmail.com>
References: <200808151255.44987.janklodvan@gmail.com> <48A5A0ED.8010502@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=pGHeD72I/+oT2+aFxpw/K2XBpc7VEOSNR8VZ96L20YQ=;
        b=vIqhh5Xlcreia4XOdDh+Zv5Xjy0N3U6K19itlOEZnq/n77A6M0jFF0ckc13ptTuSkU
         flq4KYfUNdFpjI6WeZAeew4aTn9/GWGpZ0J0g5n/9CL4ZgX9pD6oM5lzgcaKMqTkvB4r
         fhSjlg6TVWQhv8+cDuwvB5dVWlqcrlMTpX0tE=
In-Reply-To: <48A5A0ED.8010502@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I forgot to mention: this is all done on and for single machine.
Interface "separation" could be done by packet marking.... 

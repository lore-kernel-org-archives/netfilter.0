From: "JC Janos" <jcjanos245@gmail.com>
Subject: Re: ipset returns "Zero valued IP address" when trying to add '0.0.0.0/7'
Date: Wed, 12 Nov 2008 06:15:31 -0800
Message-ID: <7259d7020811120615v3fc15217p1ab466b8c7d9eadf@mail.gmail.com>
References: <7259d7020811112155j5315d0e0ke9bc7576e927ad76@mail.gmail.com>
	 <491A7648.6000703@riverviewtech.net>
	 <alpine.DEB.2.00.0811120840430.8235@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=4KGM8e3MIyCdD9De2jkJlr118cWQhFPgxlOQe6qMFMA=;
        b=nbEcO8EaxkVKy5rIERBMVsElB3wNsFqewHwDB6t9IF0OkpFs70qx5vyPiLPrLJDNYW
         w4UgujpVY/XwMn9Ht1CQrOKxFO3NOYDcCbGlyEWhBq/sHfGTx0ZW6X8RvWumgetcU2Py
         +wpsh0DoGzaTNHSXAamDSB71mCdyPUAEmJTMU=
In-Reply-To: <alpine.DEB.2.00.0811120840430.8235@blackhole.kfki.hu>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Grant Taylor <gtaylor@riverviewtech.net>, Mail List - Netfilter <netfilter@vger.kernel.org>

Hi,

On Tue, Nov 11, 2008 at 10:23 PM, Grant Taylor
<gtaylor@riverviewtech.net> wrote:
> It sounds like ipset does not like the fact that you are using an IP address
> that is all zeros.  You may have to add something like the following:

Ok, It looks like 0.0.0.1/7 works too.

For all of those, the usable range looks the same,

 First Usable IP Address = .....: 0.0.0.1
 Last Usable IP Address = ......: 1.255.255.254

> Also, are you sure you meant to enter a netmask of /7 and not /8?

Welll, that's the range the list defines ...

On Tue, Nov 11, 2008 at 11:43 PM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> > > But "0.0.0.0/7" as a network address is
not zero valued: the checking
> happens prematurely and prevents adding the network address to the hash.
> I'm going to fix it.

Thanks for explaining and the fix.

--JC

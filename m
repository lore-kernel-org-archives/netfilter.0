From: Eli Hadad <elhadad@cisco.com>
Subject: Re: iptables and performance
Date: Tue, 13 May 2008 20:03:34 +0000
Message-ID: <1210709014.5829.275.camel@localhost.localdomain>
References: <1210661080.5829.225.camel@localhost.localdomain>
	 <1210661965.5829.227.camel@localhost.localdomain>
	 <1210692588.545.119.camel@grateful.d.umn.edu>
Reply-To: elhadad@cisco.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1210692588.545.119.camel@grateful.d.umn.edu>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; l=911; t=1210709017; x=1211573017;
	c=relaxed/simple; s=amsdkim1002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=elhadad@cisco.com;
	z=From:=20Eli=20Hadad=20<elhadad@cisco.com>
	|Subject:=20Re=3A=20iptables=20and=20performance
	|Sender:=20;
	bh=fGNT+tEnFfLshb0UcTJ+3/KzIN7+gDHsf9fJbq5a0oY=;
	b=J77dj2tnCxEbfenrUSDSITghGTgQ8U7Xq1qIIwpLxabUGgdnsQvpWuTRTF
	7EIH1N6sp0TKHS8zdeFVfR6Wl6xWuKqpLj1ZCK/XFY00zg3VsQWgL1b6f+vw
	khXWCYSLqY;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Zagrabelny <mzagrabe@d.umn.edu>
Cc: netfilter@vger.kernel.org


Hi Matt,

I guess this is what I was looking for.

Thanks again,
Eli

On Tue, 2008-05-13 at 10:29 -0500, Matt Zagrabelny wrote:
> On Tue, 2008-05-13 at 09:59 +0300, Eli Hadad wrote:
> > Hi all,
> > 
> > I am new to iptables and have few question I hope you can help with:
> > 1. Is there a limit to the number of rules I can add to specific chain?
> > I need to have around 20000 rules.
> > 2. What is the performance implications of using this large number of
> > rules? Is there any numbers people can share.
> > 3. I also saw the HIPAC project which claim to have much better
> > performance. Is there any work done to integrate same type of
> > functionality into iptables?
> 
> Google: hipac ipset
> 
> Look at the first pdf link. It talks about performance and netfilter. It
> also addresses HIPAC and ipset.
> 
> I would say that you want to look at ipset.
> 
> Cheers,
> 


From: Andrew Beverley <andy@andybev.com>
Subject: Re: How can I test my tc script?
Date: Sun, 06 Feb 2011 15:54:08 +0000
Message-ID: <1297007648.1613.4.camel@andybev>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <1296761916.7587.29.camel@andybev>
	 <1296873898.3644.4.camel@debian-laptop.OptimumWireless>
	 <1296909335.1695.14.camel@andybev>
	 <1296958657.3695.22.camel@debian-laptop.OptimumWireless>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1297007661; bh=fdUoZyK/xXGEocbMRFPOzLfkgkEEDHvqEr8Oi
	xMXwdg=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=UQmpVYGc
	7tmSO/cWiwhdKL1LvSuKnTzrWxlZswhLKcIh28kZmbJftk3xRClfnIVzWLU0Lpz9EVE
	ag3NwAFXBuZTPJE4ypEo1NidetiZS0mlaEUdG+YRiEaBwL7bFFysV0HxK0Z6dS/Sr13
	4NyzsRuxh9a71Onh2opJMde70i+zs=
In-Reply-To: <1296958657.3695.22.camel@debian-laptop.OptimumWireless>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wilson@optimumwireless.com
Cc: netfilter@vger.kernel.org


> Just wondering, I have a total of 15Mbps for our total bandwidth. If I
> devide that into 512kbps then I can only have about 29 users at that
> rate.

You could use HTB's "ceil" parameter for each leaf class to specify the
max rate per user - that value can be anything up to and including the
maximum rate of the root qdisc. It's the total of all the "rate"
parameters of the leaf classes that should add up to the root's total.

>  Don't know if I'm doing the math correctly but, how many users
> should a 15Mbps line should serve without problems?

Well obviously it depends on what your users are doing, but I think
15Mbps should be fine for 2-300 users. I have a 4Mbps ADSL line shared
between 150 users. It's not the fastest, but it works for general use,
because bulk traffic gets classified at a lower priority than web
browsing.

Andy



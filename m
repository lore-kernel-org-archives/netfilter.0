From: Ming-Ching Tiew <mctiew@yahoo.com>
Subject: Re: tproxy between 2 local processes ?
Date: Mon, 6 Aug 2012 05:28:02 -0700 (PDT)
Message-ID: <1344256082.58790.YahooMailNeo@web124903.mail.ne1.yahoo.com>
References: <1343744245.78982.YahooMailNeo@web124904.mail.ne1.yahoo.com> <alpine.LNX.2.01.1208022231250.31335@frira.zrqbmnf.qr> <1343950950.62264.YahooMailNeo@web124901.mail.ne1.yahoo.com>
Reply-To: Ming-Ching Tiew <mctiew@yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1344256082; bh=ouwgjwXk2cS7vxXdMx6Pg49H5Y6aO6GfCiQixvJIs+A=; h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type; b=t/UXc7X0c2CtKkLSS3bfryzQlY+qEaVR4n+2sLHjbHBJTz9LANqUdjxEK1zRo0FNggpnxtqbChIpLy/EhYogkQSBJA2YvGpWTvLB15o1FIsw/basUcbNJ8vd4nN+d0UxgR0SD7sL3EUkay/CCWIXha4F/q1qpD52mCEKzIM/yEk=
In-Reply-To: <1343950950.62264.YahooMailNeo@web124901.mail.ne1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



From: Jan Engelhardt <jengelh@inai.de>

> On Tuesday 2012-07-31 16:17, Ming-Ching Tiew wrote:

> >Is there any hope that tproxy between 2 local processes will become possible ?

> The recipe should be the same as for incoming traffic, since in both 
> incoming and locally-outgoing cases, traffic will pass through the 
> routing table, where you specify that a target is in fact local.


Instead of using squid as a reference, perhaps anyone have tried using
tproxy-patched netcat to talk to a local tcp server ? That will be a good
test case to illustrate the configuration (netfilter/routing) need to accomplish
this.

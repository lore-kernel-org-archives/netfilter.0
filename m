From: Ming-Ching Tiew <mctiew@yahoo.com>
Subject: Re: tproxy between 2 local processes ?
Date: Thu, 2 Aug 2012 16:42:30 -0700 (PDT)
Message-ID: <1343950950.62264.YahooMailNeo@web124901.mail.ne1.yahoo.com>
References: <1343744245.78982.YahooMailNeo@web124904.mail.ne1.yahoo.com> <alpine.LNX.2.01.1208022231250.31335@frira.zrqbmnf.qr>
Reply-To: Ming-Ching Tiew <mctiew@yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1343950950; bh=g4YsJLQWAQVse78N4MBgpQlRZuyNV70lyBsnxwOb5Xc=; h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type; b=jrztzj9isw4ApbMW0NOW60vIrG2vCTfkOgP9fbhQikXtXiPKsUWBCchTSTaXPuW2PONx1mRvlQuq0oKbXzzaeGw4rfJHkgqyNRLQ5Cl8cgMx+HPGX+PqswKwpvwcyiNhjh/slM3RgKBxJiSXfi9LNjlxNIjWGXowNzVnm/C6oIo=
In-Reply-To: <alpine.LNX.2.01.1208022231250.31335@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



From: Jan Engelhardt <jengelh@inai.de>

> On Tuesday 2012-07-31 16:17, Ming-Ching Tiew wrote:

> >Is there any hope that tproxy between 2 local processes will become possible ?

> The recipe should be the same as for incoming traffic, since in both 
> incoming and locally-outgoing cases, traffic will pass through the 
> routing table, where you specify that a target is in fact local.

Could you please elaborate the iptables/routing needed ? Right now for a local 
client process (squid) tproxy with an external web server residing on another computer, the
iptables/routing has been set up following this instruction :-

http://wiki.squid-cache.org/Features/Tproxy4

However when the web server is made a local process, the local client process (squid) 

will fail to communicate with it. It seems not able to get the reply from the local web 

server.

Thank you for your patience.

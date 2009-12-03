From: Ming-Ching Tiew <mctiew@yahoo.com>
Subject: Re: match SIP & RTP packets
Date: Thu, 3 Dec 2009 03:50:00 -0800 (PST)
Message-ID: <582211.62204.qm@web31506.mail.mud.yahoo.com>
References: <4B179CD8.2080002@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1259841000; bh=GhOwm8+hGCH2VhR05Ojri1qMDNhClE+K7AkJknLKyL0=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type; b=CWKtuoSPnQi+/KBwLhEC+wd9BnSjbUzUOYb+EeL1HAoIMHS9Yp8SE29pMGMBy52yNZRLFsYfG4c1d4BVFTmnyVLnnz7tiaeyRdIeoW13a0kzTVYQfrU+NOhZXDI69YjgzMIPNpygIZ/LLfUguRc8udehbyRsIrWTTv3R0u8nY5s=
In-Reply-To: <4B179CD8.2080002@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netdev@vger.kernel.org



--- On Thu, 12/3/09, Patrick McHardy <kaber@trash.net> wrote:

> From: Patrick McHardy <kaber@trash.net>
> Subject: Re: match SIP & RTP packets
> To: "Lorenzo Allegrucci" <lorenzo.allegrucci@forinicom.it>
> Cc: netfilter@vger.kernel.org, netdev@vger.kernel.org
> Date: Thursday, December 3, 2009, 11:11 AM
> Lorenzo Allegrucci wrote:
> > 
> > Hi all, it's not clear to me whether nf_conntrack_sip
> does SIP and RTP
> > connection
> > tracking or just SIP.. can you clarify?
> > I need to match both SIP and RTP packets and I was
> wondering if the rule
> > below would satisfy my requirements:
> > 
> > iptables -t mangle -A FORWARD -o eth0 -m helper
> --helper sip -j CLASSIFY
> > --set-class 1:1
> 
> Almost, this will match on RTP packets and incoming
> signalling
> connections (-m helper matches on expected connections).
> What's
> missing is the original signalling connection on port
> 5060.
> --

So there is no way to identify it based on NEW connection state ?

(... Want to route new SIP calls to different locations .... )

Regards.


      

From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: NAT table bypass for local traffic
Date: Wed, 28 Apr 2010 22:55:06 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1004282253090.2332@aurora.sdinet.de>
References: <n2h812495871004281019nb633c037i7dc04336bc47bd59@mail.gmail.com>  <h2v7d7f2e8c1004281059l2ad0d411x1e5f17fd6d7e489f@mail.gmail.com>  <alpine.LSU.2.01.1004282136590.18231@obet.zrqbmnf.qr>
 <h2i812495871004281350j23f2bdefhe18b60101fcf5acc@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <h2i812495871004281350j23f2bdefhe18b60101fcf5acc@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Prochazka <billprozac@gmail.com>
Cc: Jan Engelhardt <jengelh@medozas.de>, Steve Fink <sphink@gmail.com>, netfilter@vger.kernel.org

On Wed, 28 Apr 2010, Bill Prochazka wrote:

> A more simple example is that ICMP echo requests
> go out the nat table's output chain, but ICMP echo replies do not.

The incoming ICMP echo-request (should be visible in PREROUTING) sets up 
a conntrack entry, the outgoing echo-reply matches to it and thus does 
not show up in nat OUTPUT/POSTROUTING.

c'ya
sven-haegar

-- 
Three may keep a secret, if two of them are dead.
- Ben F.

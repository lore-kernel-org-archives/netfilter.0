From: Vladislav Kurz <vladislav.kurz@webstep.net>
Subject: Re: MARK and CONNMARK
Date: Wed, 16 Jul 2008 12:33:51 +0200
Message-ID: <200807161233.51463.vladislav.kurz@webstep.net>
References: <200807161046.39247.vladislav.kurz@webstep.net> <alpine.LNX.1.10.0807161156560.26724@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0807161156560.26724@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Wednesday 16 of July 2008, Jan Engelhardt wrote:
> On Wednesday 2008-07-16 10:46, Vladislav Kurz wrote:
> >Hello,
> >
> >could someone explain (or point me where to RTFM) the difference between
> > MARK and CONNMARK? Are they both usable by "tc filter", or "ip rule", as
> > fwmark?
>
> Where does it say that?

Nowhere I just ask if

> As for the point to manuals, man iptables  is usually in good shape.

Ok, I can read this, but i just wonder what is the difference and how can I 
use connmark. Just marking connections for fun? What other use they are for?

connmark - 
This module matches the netfilter mark field associated with a connection

mark - 
This module matches the netfilter mark field associated with a packet


-- 
S pozdravem
        Vladislav Kurz

=== WebStep, s.r.o. (Ltd.) ========= a step to the Web ===
address: Mezirka 1, 602 00 Brno, CZ, tel: +420 548 214 711
=== www.webstep.net ======= vladislav.kurz@webstep.net ===


From: "Andreas Wolff" <aw-netfilter@mw-itcon.de>
Subject: Re: ip_nat_pptp & ip_conntrack_pptp help appreciated.
Date: Tue, 1 Oct 2002 08:43:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002901c26915$d2e6dc90$03c0a8c0@aw01>
References: <20020930213601.9696.62125.Mailman@kashyyyk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

> > My configuration is like this :
> > ---------------------------------------------
> > 80.x.x.x  (Valid IP)
> > Cisco DSL router
> > (one rule - NAT all to 10.0.2.1)
> >
> > 10.0.2.1 - RedHat 7.3 - kernel-2.4.20-pre8   (this Iface will receive
> >      all data
> > from valid-IP)
> > (Routing enabled, Netfilter 1.2.7a)
> > 10.0.0.1 - RedHat 7.3 - kernel-2.4.20-pre8
> >
> > 10.0.0.2 - Windows box (Client)
> >
> > My goal is to have a PPTP server (with PoPToP).
>
> If you need to build NAT support for PPTP into the Linux box, then you
would
> need to do the same thing on the Cisco box if you're going to do NAT there
as
> well.

Just check my understanding: Do you really need to have NAT support for PPTP
on the Cisco if just maps the 80.x.x.x address to the internal 10.0.2.1? My
understanding up to now was that I only need NAT support for PPTP if I have
multiple local addresses that are SNAT-ed to a single external address (to
keep track of and map callids).


Regards,

Andreas
------------------------------------------------------------
Andreas Wolff
Menzebach und Wolff IT-Consulting

phone: +49 7503 916 716 - 2, mobile: +49 160 7 54 11 53
email: Andreas.Wolff@mw-itcon.de
http:  www.mw-itcon.de
------------------------------------------------------------



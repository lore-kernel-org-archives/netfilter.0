From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: SNAT before IPSec
Date: Thu, 07 Jun 2007 12:07:53 -0500
Message-ID: <46683B69.8000303@riverviewtech.net>
References: <8bd3dfad0706050529s484d42b6t9ef4ae0fd1730367@mail.gmail.com>	<web-74829660@bk1.webmaillogin.com>	<8bd3dfad0706051429r7c37e29dhcd8d2550a613bab3@mail.gmail.com>	<web-17532572@bk3.webmaillogin.com>	<8bd3dfad0706051540t626bf02fk15e20eace4818b3e@mail.gmail.com>	<web-17534558@bk3.webmaillogin.com>	<8bd3dfad0706051605u49cdbf17jca76d1d74ebdd26b@mail.gmail.com>	<web-73937813@bk2.webmaillogin.com>
	<8bd3dfad0706070840i2b80fa4bl5a9a4ae5973b0e01@mail.gmail.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8bd3dfad0706070840i2b80fa4bl5a9a4ae5973b0e01@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 06/07/07 10:40, noa levy wrote:
> Well, I agree with you in principle, but it's been this way for 
> years, so routing practices are in place to handle it. I'm trying to 
> recreate the setup we have now, which is using commercial VPN 
> gateways, with Linux-based ones, but the addressing scheme is a 
> given, I have no control over it.

Ah, you have a "Double NAT scenario".  What fun.

In short, you have two networks with the same subnet A.B.C.x/24 that 
need to talk to each other.  So, you make each network think that the 
other is D.E.F.x/24.  This way, either network can reach the other 
network by using the D.E.F.x/24 addresses.

Traditionally, double NAT is done on two different systems b/c of 
conflicts.  However I suspect that it could be done on one system with 
multiple routing tables.  I'll have to think on this as to how to 
possibly make this happen.  I'd need you to do some testing on your end 
to let me know if it would work or not as I don't have a test bed that 
will encompasses this at present.

With the traditional double nat, you have a fake subnet that is remapped 
in to the local network.  The routers know how to get between each other 
using the fake network.

A.B.C.x/24 <router A> --- (vpn) --- <router B> A.B.C.x/24

Router A thinks that D.E.F.x/24 is available via router B.
Router B thinks that D.E.F.x/24 is available via router A.

Both router A and router B do a network map to translate any incoming 
traffic destined to D.E.F.x/24 to A.B.C.x/24.  Thus when any traffic 
comes in to either router from A.B.C.9 destined to D.E.F.3, it DNATs the 
traffic down to A.B.C.3 AND SNATs the traffic up to D.E.F.9.  Thus the 
real receiving host will see traffic from D.E.F.9 to A.B.C.3.  With the 
real receiving host having what it thinks to be valid source and 
destination IPs, it can communicate just like normal.  When the real 
receiving host replies to the real sending host, the traffic goes out to 
D.E.F.9.  Then the other router will see traffic coming in from A.B.C.3 
to D.E.F.9 it will DNAT the traffic to be to A.B.C.9 and SNAT the 
traffic to be from D.E.F.3.  Notice how we now have a complete 
by-directional route between two very different subnets that share the 
same subnet address space?  Interesting isn't it?  Complex though as it 
is, it does work and is done a LOT.

See if this helps you at all.

Seeing as how your subnets were suppose to be set up identically I'm 
going to presume that servers and routers on the subnets have the same 
IP addresses.  Thus, you would probably be able to get away using NETMAP 
target.  I.e.

iptables -t nat -A PREROUTING -i $WAN -d D.E.F.x/24 -j NETMAP --to 
A.B.C.x/24
iptables -t nat -A POSTROUTING -o $LAN -s A.B.C.x/24 -j NETMAP --to 
D.E.F.x/24

This should cause the NETMAPing to happen at the remote end of the vpn 
link and (hopefully) not confuse the router at the local end of the vpn 
link.



Grant. . . .

P.S.  I said "fun right???".  :0


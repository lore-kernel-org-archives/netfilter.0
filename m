From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Odd issue with two SNATed Firewalls and Wireless router
Date: Wed, 24 Aug 2005 15:47:18 -0500
Message-ID: <200508241547.18164.rob0@gmx.co.uk>
References: <1124886644.9968.186.camel@andrew.iface.lan>
	<WorldClient-F200508241343.AA43070008@acerlandslp.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <WorldClient-F200508241343.AA43070008@acerlandslp.com.mx>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wednesday 2005-August-24 13:43, ISC Jorge Ceron Galvan wrote:
> I'm not doing nat because I want a real IP at my wireless client.
>
> cisco eth0  200.0.0.1/24

What a great netblock that is! Uh, this *is* your real IP, or did you 
munge it for posting? It's not the same as what appears in your mail 
headers.

If you're going to munge IP addresses, you should not use a live 
netblock. Pick something from RFC 1918 or an unassigned (bogon) range.

> linux eth0  200.0.0.10/24  gw 200.0.0.1/24

/24 covers 200.0.0.0 (the network address) through 200.0.0.255 (the 
broadcast address.)

> linux eth1  200.0.0.129/27

And this is included in the eth0 network. Perhaps you should use /25 
netmask or greater on eth0.

> remote fortinet router eth0 200.0.0.130/27   gw 200.0.0.129

I don't know what this means.

> I thougth it could be a routing problem because I'm using subnet 0 at
> eth0, and at eth1 I set up a subnet from eth0.

Yes, that is a part of the problem, I would think.

> It's not an iptables 
> issue because I'm not using it at all. The configuration is quite

This is the netfilter list, so you're off topic here.

> simple, but I don't know whether you can subnet a class C net this

I don't know either. I generally find that doing things the right way 
works better. ;)

> way. The mail server we are trying to reach is somewhere in the
> internet.
>
> I'm using a wireless AP at my side and a wireless bridge at the other
> side; the bridge is connected directly to the fortinet router. Could
> it be a protocol bridge problem?

1. Check the routing
2. Check the routing
3. Check the routing
4. Look at packet counters, is eth1 being used at all?

replying to the OP as well:
> -----Original Message-----
> From: Andrew Gargan <andrew@iface.co.za>
snip
> > Has anyone experienced similar issues using a shared NATed
> > mywireless ....
> >
> > most of the mail comes down .... it seems to break when
> > transmissions are over +-600 KB)
> >
> > I was told that changing the MTU for the ppp0 device to 1300 would
> > help but no luck there.

It does sound like a possible router MTU issue. It does not sound like 
iptables/netfilter is involved.

> > eth1      Link encap:Ethernet  HWaddr 00:03:47:71:7B:37
> >           inet addr:10.0.7.2  Bcast:10.255.255.255  Mask:255.0.0.0
> >           inet6 addr: fe80::203:47ff:fe71:7b37/64 Scope:Link
> >           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
> >           RX packets:27333550 errors:0 dropped:0 overruns:0 frame:0
> >           TX packets:28013971 errors:1 dropped:0 overruns:0
> > carrier:1 collisions:614337 txqueuelen:1000

That is a lot of collisions. It might not indicate a problem, but 
likewise, it might.

> > and iptables -L:

... is utterly useless. "iptables -vL" is better, but iptables-save(8) 
is greatly preferred.

That said, nothing indicates the likelihood of a problem with your 
iptables rules.

> > I am using rp-pppoe I think ...

You think?
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header


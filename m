From: Dwayne Hottinger <dhottinger@harrisonburg.k12.va.us>
Subject: Re: cant connect to kernel.org behind firewall
Date: Sat,  8 Jul 2006 08:03:44 -0400
Message-ID: <1152360224.69e336c8e8d91@webmail.harrisonburg.k12.va.us>
References: <1152305262.7ca44f2ca1f53@webmail.harrisonburg.k12.va.us>
	<1082.10.0.1.3.1152335260.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1082.10.0.1.3.1152335260.squirrel@webmail.sterenborg.info>
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



Quoting Rob Sterenborg <rob@sterenborg.info>:

>
> On Fri, July 7, 2006 22:47, Dwayne Hottinger wrote:
> > Sirs,
> > I read the FAQ on kernel.org and they have the following:
> > Please note that kernel.org uses Explicit Congestion Notification (ECN), as
> > defined in RFC 3168. Some broken firewalls or gateways may have problem
> > connecting to ECN-enabled servers. Please contact your firewall or gateway
> > vendor for necessary updates.
> >
> > How can I get around this (short of replacing my firewall), if this is the
> > issue of why I cant connect to kernel.org?  Also how can I check if this is
> my
> >  problem?
>
> On your end you can disable ECN by:
> cat 0 > /proc/sys/net/ipv4/tcp_ecn
>
> I don't think you can make kernel.org disable it...
> (If ECN is the problem and if the suffering firewalls/gateways are in your
> control, the real solution would be to fix the firewalls/gateways.)
>
>
> Gr,
> Rob
>
>
>
>
Thanks Rob,
I'll give that a try, but I think I ruled out the ECN issue last night.  See my
below message to Greg Carter.  I think it is a routing issue left over from my
old firewall rules.  But I cant figure out how to prove this at this stage or
fix it.


No didnt work.  But when I ran lynx to make a connection I did a netstat on my
proxy server (squid) and saw the following connections pertinant to kernel.org:
tcp        0      1 proxy.harrisonbur:35418 zeus-pub2.kernel.o:http SYN_SENT
tcp        0      0 proxy.harrison:webcache raspberry.hhs.har:57739 TIME_WAIT
Raspberry then gets a timeout.  I dont see any connections on my firewall with
tcpdump while trying to make the connection.  I can ping kernel.org, but a
tracroute stops at the interface that is connected to the subnet I am on.  For
example, If I am on my 10. network and do a traceroute, it stops at 10.10.220.1
which is the ip interface on the firewall that connects to that subnet.  A
traceroute to any other address goes right through.  I can access the site from
the firewall, which rules out any upstream routers.  I would say it was a
routing issue on my firewall, but then nothing would work.  The only clue I
have is before I made the switch to my present internet connection, I had 2 t1
connections and the firewall routed traffic to them.  Rules on the firewall
controlled what traffic went out which interface.  When I switched over, the
only thing I changed on the firewall was the rules that controlled this and any
rules that were pertinant to the interface that plugged into the second t-1.
Kernel.org was one of the sites that was placed on the second t1.  However, so
was apple.com, dell.com, novell.com, and quite a few more.  I can access all
the other sites.  But now Im back to tracerts stop at the firewall for
kernel.org.  Any other ideas?  Firewall is a 2.6.3 kernel, iptables v1.2.9.  Im
pretty sure the packets are not getting passed between the interfaces.

thanks,

ddh


Quoting Gregory Carter <gcarter@aesgi.com>:

> First of all, I would issue this on your outside interface of your
> firewall:
>
> ifconfig <interface to your isp usually eth0, or eth1...etc> mtu 1024
>
> Next, try it from an internal workstation.
>
> If it works, you got issues with icmp ENC more than likely with your
> ISP's router, or any router inbetween the workstation and kernel.org.
>
> Next, we will have to make sure your firewall rules are not blocking
> icmp messages.
>
> To test that is complex, so I won't go into the details, but to figure
> this out, turn off all your firewall and packet inspect semantics, and
> reboote the router with just IP masquerade enabled.
>
> If that works, and your mtu size if 1500, your filtering icmp messages
> for packet reassembly and its your router that is at fault.
>
> But first try my suggestion above by resetting the ISP side of the
> router MTU size too 1024.
>
> -gc

Thanks all,

--
Dwayne Hottinger
Network Administrator
Harrisonburg City Public Schools


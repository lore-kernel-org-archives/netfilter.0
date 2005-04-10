From: Francesco Ciocchetti <primero@fastwebnet.it>
Subject: Re: Iptables vs. Cisco PIX
Date: Sun, 10 Apr 2005 13:06:03 +0200
Message-ID: <4259089B.6070305@fastwebnet.it>
References: <038201c53c4c$6e94e540$0200a8c0@ale>
	<42581A90.3050706@fastwebnet.it>
	<425827DA.9020706@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <425827DA.9020706@riverviewtech.net>
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
To: gtaylor@riverviewtech.net, "Netfilter lista (iptables)" <netfilter@lists.netfilter.org>

Grant Taylor wrote:

> You make some very good points.  You are also correct in the fact that
> at your border firewall you need to be more liberal in what you let
> through as you don't have the flexibility to shut down what comes in
> on a bulk pattern, but you could shut things down based on their
> destination, or have a small sub chain set aside for each system and
> redirect traffic in to each sub chain depending on what system it is
> destined for.


What i tried to imagine is a situation where you can have both solution
(Pix and Iptables) without looking at money or Knowledge. In Such a
situation i would choose what i said, a PIX Firewall to manage an
'higher level' filtering , static configuration for Public IP and
filtering for the 'internet' access to public services.
I think that an iptables based firewall is much more usable in the
opposite situation where you need to filter traffic 'from users' to
'Internet or Internal Serivces', where you would like to use features
that PIX has not as Transparent Firewall, Schedulers (Linux Rulez;) ) ,
Special Target as TARPIT, Port Scan detection, filtering on TIME or
Connection/IP, Byte/IP and so on ...
The power of chains in iptables is something that is Unreachable for PIX
& C. and there resides the flexibility of a Netfilter firewall but is
not so simple to understand and implement as is an 'access-list ...
access-group....' commands.

>   As far as the redundancy / fail over you can accomplish much the
> same thing via VRRP in Linux with two firewalls configured
> identically.  In this case you would have two firewalls with their IP
> on the network both of which would be imulating a 3rd IP which would
> be the IP that all systems would use as their gateway.  This way the
> VRRP enabled Linux nodes would constantly pole each other to make sure
> that they are alive and functional.  If one of them goes down the
> other takes up the slack in a very short amount of time (I'm not sure
> what it is, I think it's less than 30 seconds).  Granted I have never
> messed with VRRP my self but from the reading that I have done on it
> this is EXACTLY what it is meant for.  Virtual Router Redundancy
> Protocol (VRRP) is the industry standard of Cisco's Hot Standby Router
> Protocol (HSRP).  You can also look at some of the Linux clustering
> technologies but I don't think they are exactly appropriate here.
>
VRRP , and all the implementaion that in linux are available, could
gives redundancy but not a Statefull one.
In Fact HSRP is used on Cisco Routers but not on PIX Firewall. With the
ctnetlink libs will be possible to have a statefull failover also on
linux/iptables but is not ready yet (unlucky).

> Of course there is also the fact that there are a LOT of people that
> know how to work with PIXies and could come in after you are hit by a
> Greyhound buss and take over, where there are relatively few people
> that could walk in and take over a complex Linux IPTables, IPRoute2,
> VRRP firewall.  But to each his own.
>
Yep, i think that there is a reverse relationship beetween Iptables and
PIX Firewalls and i've seen it a lot of time ...
who know how to work with a complex environment such Iptables + iproute2
+ VPN + VRRP will find PIXOS Simple and fast but the reverse will not ;)
as usual ... Linux/Netfilter open your mind , the 'OTHERS' teach you how
to open or close a port ;)

>
>
> Grant. . . .
>
Bye
<P>


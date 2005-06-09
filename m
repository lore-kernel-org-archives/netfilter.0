From: David Busby <busby@edoceo.com>
Subject: Re: --policy DROP kills everything?
Date: Thu, 09 Jun 2005 13:59:20 -0700
Message-ID: <42A8ADA8.5000008@edoceo.com>
References: <B80488675062364A909EE60F4A666038078EEA9E@usilms23.ca.com>
	<Pine.LNX.4.60.0506091359050.9191@darkstar.sysinfo.com>
	<42A888C4.20006@edoceo.com>
	<Pine.LNX.4.62.0506091426590.14790@dgray-test.acs.internap.com>
	<42A8909E.1030104@edoceo.com>
	<Pine.LNX.4.62.0506091515190.14790@dgray-test.acs.internap.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.62.0506091515190.14790@dgray-test.acs.internap.com>
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
To: netfilter@lists.netfilter.org

Damon Gray wrote:
> David,
>     Sorry, but all I can suggest is getting rid of the -i eth0 on the 
> port 22 and port 80 rules because you won't be able to connect from lo0 
> with that. You also don't need the the --state NEW rule for ssh either, 
> your allow anything to port 22 will be enough for that and anything 
> destined for port 22. And also (like someone else suggested) put the 
> --state ESTABLISHED,RELATED at the top. Other than that your rules look 
> correct to me. Is there anything in any of the other tables? Like if you 
> do a iptables -t nat -nvL or -t mangle? What kernel are you running?
> 
> Sorry I couldn't be of more help.
> 
> -Damon-
> 

I appreciate all the help this list is providing, it seems very odd to me and it's nice to know it's also confusing to
others ;)  I've got no other tables, no nat, no mangle (I didn't even build those modules)  I moved EST,REL to the top,
it was last while I was testing.  I'm still at the same state, my established is OK but NEW (tcp/udp) are not.  I'm
using kernel 2.6.10-gentoo-r6, so it's vanilla with gentoo patches.  I've fetched 2.6.11-gentoo-r9 and am currently
building it, I'll try my rules with it.

I also tried getting rid of the interface parameter rules, no help.  I tried getting rid of destination IP rules, no go.
I ended up with this very loose setup

imperium syslog-ng # iptables -nv -L
Chain INPUT (policy DROP 43 packets, 3392 bytes)
  pkts bytes target     prot opt in     out     source               destination
     6   312 ACCEPT     all  --  *      *       127.0.0.0/8          0.0.0.0/0
  4067 3419K ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
     0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0           udp dpt:53
     0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0           udp dpt:514
     0     0 ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0           udp dpt:123
     0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp dpt:22
     0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp dpt:80
     3   180 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0
    43  3392 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 4

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 3270 packets, 277K bytes)
  pkts bytes target     prot opt in     out     source               destination

But I still cannot connect :(  My TCP and UDP traffic is still dead.  Do I need to enable something in /proc?  This
machine isn't forwarding or being a router, the rules are only to protect this single host.  I've unloaded and reloaded
the kernel modules no go.

(time passes)

Rebooted with the 2.6.11-gentoo-r9 kernel, set my firewall rules and presto!
Every thing is working perfectly with the above rules.
I then went through and tied the rules to more be more specific and it's all still working perfect.
Glad that's over, thanks to everyone who helped out!

/djb










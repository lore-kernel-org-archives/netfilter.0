From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: a sort of n00b question here but I'ld like to know.
Date: Mon, 20 Oct 2003 19:03:02 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031021020302.80084.qmail@web40208.mail.yahoo.com>
References: <013f01c39776$2d3ddd30$0301a8c0@SIMON>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <013f01c39776$2d3ddd30$0301a8c0@SIMON>
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
Content-Transfer-Encoding: 7bit
To: Simon Garner <sgarner@expio.co.nz>, netfilter@lists.netfilter.org


--- Simon Garner <sgarner@expio.co.nz> wrote:
> On Tuesday, October 21, 2003 2:24 PM [GMT+1200=NZT],
> SBlaze <dagent.geo@yahoo.com> wrote:
> 
> > Ok I did that(with top) My CPU usage for both procs is relativly low.
> > They both tend to idle with other visable processes at 96-100% idle.
> >
> > root@nixn00b:~# vmstat
> > procs -----------memory---------- ---swap-- -----io---- --system--
> >  ----cpu---- r  b   swpd   free   buff  cache   si   so    bi    bo
> >  in    cs us sy id wa 0  0  27464   5848  22848  44388    0    0
> > 1     2   11     8  0  1 99  0
> >
> 
> Looks fine... sounds to me like this is a red herring, are you sure your
> problem is not just with your connection itself? You said:
> 
> 
> > The reason I ask is that I have what I think is an unusual amount of
> > inbound unsolicited udp traffic(which is dropped by
> > iptables/netfilter).
> >
> 
> Inbound unsolicited traffic will be dropped with or without iptables -
> you don't need a firewall to stop that as it won't have anywhere to go
> anyway. And you'd have to have a serious amount of traffic to choke the
> CPU like that. But, that traffic could be using up your bandwidth of
> course... If that's a possibility, you need to find out more about where
> the traffic is coming from and where it's going to and why you're
> receiving it.
> 
> -Simon
> 

It would appear that most of the data that comes to me is udp and by
unsolicited I mean that in stateful inspections they are NEW or INVALID
connections. 98% of them are from my own IP range and are targeted at me or my
ISP's broadcast address for my range. Alot of them are "valid" in that they are
basically Windows RPC scans/virii and the like.

About the CPUT... thats what I'm wondering really. Is all this traffic silently
choking my system. If it is I need to know.. if its not..then we know its
probably just an OOB deal.

You be the judge. I start my firewall when the box boots up. Pay special
attention to the UDP rule. Note that in the 11 day up time we have 16 Million
droppped UDP NEW/Invalid packets. Is this enough to choke down a Dual Pentium
Pro 200mhz box?

root@nixn00b:/proc/net# uptime ; iptables -vnL
 21:56:57 up 11 days, 21:21,  4 users,  load average: 0.00, 0.00, 0.00
Chain INPUT (policy ACCEPT 1008K packets, 736M bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       all  --  *      *       68.119.x.x          0.0.0.0/0
    0     0 DROP       all  --  *      *       68.119.x.x       0.0.0.0/0
    0     0 DROP       all  --  *      *       68.119.x.x         0.0.0.0/0
85058 5514K ACCEPT     all  --  eth0   *       68.1.x.x         0.0.0.0/0
 4676  432K ACCEPT     all  --  eth0   *       68.63.x.x        0.0.0.0/0
 9656  639K ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0  
       tcp dpt:80
 309K   20M ACCEPT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0  
       udp dpt:27015 state NEW,RELATED,ESTABLISHED
 3262  191K DROP       tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0  
       state INVALID,NEW
 288K  427M ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0  
       state RELATED,ESTABLISHED
  16M 1945M DROP       udp  --  eth0   *       0.0.0.0/0            0.0.0.0/0  
       state INVALID,NEW
 6815 1166K ACCEPT     udp  --  eth0   *       0.0.0.0/0            0.0.0.0/0  
       state RELATED,ESTABLISHED
 2767  249K DROP       icmp --  eth0   *       0.0.0.0/0            0.0.0.0/0  
       state INVALID,NEW
  339 24646 ACCEPT     icmp --  eth0   *       0.0.0.0/0            0.0.0.0/0  
       state RELATED,ESTABLISHED


=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com


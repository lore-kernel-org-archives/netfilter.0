From: Joel Solanki <zealous@bonbon.net>
Subject: Re: Ip accounting Help--> Urgent
Date: Sat, 26 Jun 2004 14:50:59 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088241658.2283.35.camel@joel.d2visp.com>
References: <1087962571.2041.10.camel@joel.d2visp.com>
	 <200406231241.29378.Antony@Soft-Solutions.co.uk>
	 <1088224225.3133.20.camel@joel.d2visp.com>
	 <200406260922.14221.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406260922.14221.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

Good morning Antone and all.

			
	LINUX SERVER eth0 200.200.200.200 (public ip) --> switch 
		     eth1 192.168.0.1/24   -------------> switch


Yes 192.168.0.2 is the ip of windows 98 machine.
I have done SNAT on linux server.
Below are the rules:-

[root@joel root]# iptables -t mangle -nvL
Chain PREROUTING (policy ACCEPT 5321 packets, 1574K bytes)
 pkts bytes target     prot opt in     out     source        destination

Chain INPUT (policy ACCEPT 4 packets, 452 bytes)
 pkts bytes target     prot opt in     out     source        destination

Chain FORWARD (policy ACCEPT 5299 packets, 1571K bytes)
 pkts bytes target     prot opt in     out     source        destination
 2672 1461K            all  --  eth1   *       192.168.0.2   0.0.0.0/0
 2627  110K            all  --  eth0   *       0.0.0.0/0     192.168.0.2

Chain OUTPUT (policy ACCEPT 2 packets, 140 bytes)
 pkts bytes target     prot opt in     out     source        destination

Chain POSTROUTING (policy ACCEPT 5301 packets, 1571K bytes)
 pkts bytes target     prot opt in     out     source        destination

[root@joel root]#

I have tested again this rules
I just upload squid.tar.gz which is of 1.3M. and i found the above
results. Its only showing the 110K bytes ...file is of 1.3M and traffic
bytes are more in other rule ..its showing 1461K. so i cant get what is
exactly going on with this chains...

Below are other iptables results..........
------------------------------------------------------------------------------------------------------------------------

[root@joel root]# iptables -nvL
Chain INPUT (policy ACCEPT 9 packets, 1053 bytes)
 pkts bytes target     prot opt in     out     source        destination
    0     0 ACCEPT     all  --  eth1   *       192.168.0.2   0.0.0.0/0

Chain FORWARD (policy DROP 0 packets, 0 bytes)
pkts	bytes	target	prot	opt	in	out	source		destination
2690	1462K	ACCEPT	all	--	*	eth1	192.168.0.2	0.0.0.0/0	state	NEW,RELATED,ESTABLISHED
2638	111K	ACCEPT	all	--	*	eth1	0.0.0.0/0	192.168.0.2	state	NEW,RELATED,ESTABLISHED

Chain OUTPUT (policy ACCEPT 7 packets, 450 bytes)
pkts	bytes	target	prot	opt	in	out	source		destination
---------------------------------------------------------------------------------------------------------------------------


[root@joel root]# iptables -t nat -nvL
Chain PREROUTING (policy ACCEPT 463 packets, 43776 bytes)
 pkts bytes target     prot opt in     out     source       destination

Chain POSTROUTING (policy ACCEPT 41 packets, 2532 bytes)
pkts	bytes	target	prot	opt	in	out	source		destination
237	12398	SNAT	all	--	*	eth0	192.168.0.2	0.0.0.0/0	to:200.200.200.200

Chain OUTPUT (policy ACCEPT 41 packets, 2532 bytes)
 pkts bytes target     prot opt in     out     source       destination


---------------------------------------------------------------------------------------------------------------------------

Regards,

On Sat, 2004-06-26 at 13:52, Antony Stone wrote:
> On Saturday 26 June 2004 5:30 am, Joel Solanki wrote:
> 
> > Hello all, ANTONY ...hoping something from u :)
> 
> Good morning :)
> 
> > I am testing ip accounting on my production server for last 2 days but i
> > can sort the things. Any body if u could throw little light that would
> > be really helpful to me.
> > This is my testing results.
> >
> > # $IPT -t mangle -i eth1 -A FORWARD -s 192.168.0.2
> > # $IPT -t mangle -o eth0 -A FORWARD -d 192.168.0.2
> >
> > Results:-
> >
> > Chain FORWARD (policy ACCEPT 6853 packets, 2981K bytes)
> >  pkts bytes target     prot opt in     out     source        destination
> >  3267 1483K            all  --  eth1   *       192.168.0.2   0.0.0.0/0
> >     0     0            all  --  *      eth0    0.0.0.0/0     192.168.0.2
> >
> > I download squid-2.5.STABLE5.tar.gz from my ftp server.
> > The size of squid is 1.3M
> >
> > Now when i did upload same squid package from local machine to remote
> > ftp server it doesnt show any bytes counter in second command :--you can
> > see that above ...counters bytes are 0.
> 
> Two very obvious questions first - I don't think these will be the problem, 
> but I might as well check:
> 
> 1. Is the machine you are uploading to connected via eth0?
> 2. Does the machine you are uploading to have IP address 192.168.0.2?
> 
> Both the above must be "yes" for the second rule you have (the one that's not 
> apparently working properly) to count packets.
> 
> Now for the suggestion where I think you *may* have an error:
> 
> 3. Do you have any PREROUTING nat rules which mean that by the time packets 
> hit the FORWARD chain, they're no longer addressed to 192.168.0.2?
> 
> A good way to answer this would be to show us the rule in your FORWARDing 
> filter table which allows the connection (the upload connection which you are 
> having problems measuring) to work.
> 
> I cannot think of any reason why a rule in the FORWARD mangle table would not 
> see packets which are correctly being processed by the FORWARD filter table.
> 
> Regards,
> 
> Antony.
-- 
Joel n.solanki
Systems Administrator
(M) 91-9825500258
D2V ISP PVT LTD
http://www.d2visp.com





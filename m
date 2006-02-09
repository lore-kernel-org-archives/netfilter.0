From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: help with netmap.
Date: Thu, 09 Feb 2006 12:52:11 -0500
Message-ID: <1139507531.2958.21.camel@localhost>
References: <Pine.GSO.4.58.0602080823470.26810@mcnet.marietta.edu>
	<1139407730.2969.13.camel@localhost>
	<Pine.GSO.4.58.0602080912470.26810@mcnet.marietta.edu>
	<1139409331.2969.42.camel@localhost>
	<Pine.GSO.4.58.0602080953380.26810@mcnet.marietta.edu>
	<1139414648.2969.46.camel@localhost>
	<Pine.GSO.4.58.0602091202460.8009@mcnet.marietta.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.58.0602091202460.8009@mcnet.marietta.edu>
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
To: Stephen Beck <becks@marietta.edu>
Cc: netfilter@lists.netfilter.org

Hmmm . . . I've never tried NETMAPping to a single address.  What
happens if you NETMAP the network (be prepared for all kinds of stuff to
come through - you may want to filter on your FORWARD chain)?

By the way, what does your routing table look like?

Oh, wait, what are those other rules in your PREROUTING chain?

Would you mind forwarding your (edited) rule set? - John

On Thu, 2006-02-09 at 12:25 -0500, Stephen Beck wrote:
> i am trying to add a netmap to the nat table,  PREROUTING
> chain as described below.
> 
> i have a laptop running inside as 10.0.20.42 that netmaps to the
> outside as 205.133.141.42. via these entries in the table nat, chain
> POSTROUTING:
> 
> Chain POSTROUTING (policy ACCEPT 282 packets, 19263 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>  5494  294K NETMAP all -- * * 10.0.20.0/24 0.0.0.0/0 205.133.141.0/24
>   907 45805 NETMAP all -- * * 10.0.21.0/25 0.0.0.0/0 205.133.140.0/25
>  2446  123K NETMAP all -- * * 10.0.22.0/25 0.0.0.0/0 205.133.140.128/25
> 
> the laptop ( and about 400 users ) can get out just fine.
> 
> I have an outside pc trying to ping the laptop from outside
> ( 205.133.146.31 -> 205.133.141.42 ) . I can watch its packets go to the
> inside interface and not be maped to 10.0.20.42 (system arps for
> 205.133.141.42 on the inside interface.
> 
> ]# tcpdump -nn  -i eth3.920 host 205.133.141.42
> tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
> listening on eth3.920, link-type EN10MB (Ethernet), capture size 96 bytes
> 13:29:52.840744 arp who-has 205.133.141.42 tell 10.0.20.2
> 13:29:53.840464 arp who-has 205.133.141.42 tell 10.0.20.2
> 13:29:54.840227 arp who-has 205.133.141.42 tell 10.0.20.2
> 13:29:55.842960 arp who-has 205.133.141.42 tell 10.0.20.2
> 
> so now ime ready to add the netmap entry to the PREROUTING chain
> but it dosnt seem to work. in troubleshooting ive added several
> entries with no target to serve as counters ( this works elsewhere )
> but they arnt catching the packets ???
> 
> Chain PREROUTING (policy ACCEPT 1149 packets, 76872 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>     0     0        all -- * *  205.133.146.31       0.0.0.0/0
>     0     0        all -- * *  205.133.141.42       0.0.0.0/0
>     0     0        all -- * *  10.0.20.42           0.0.0.0/0
>     0     0 NETMAP all  -- * * 205.133.141.42 0.0.0.0/0 10.0.20.42/32
>  1149 76872        all  -- * * 0.0.0.0/0            0.0.0.0/0
> 
> shouldnt i expect to see these packets comming through this chain?
> 
> On Wed, 8 Feb 2006, John A. Sullivan III wrote:
> 
> > Ah, seeing the rules helps.  I'm afraid I've only looked at them quickly
> > as I need to get on some other projects here at work.  However, a couple
> > of notes.
> >
> > You will need NETMAPs in both PREROUTING and POSTROUTING chains if you
> > want bidirectional NAT.
> >
> > I think you will need to bind all of the addresses for the public
> > subnets to the interface of the gateway in order for it to respond to
> > ARP requests for those addresses.
> >
> > Perhaps you are already doing this and I did not look closely enough at
> > your rules but, hopefully, this gives you something to consider.  Sorry
> > that I can't give it a little more time right now.  Good luck - John
> >
> > On Wed, 2006-02-08 at 10:20 -0500, Stephen Beck wrote:
> > > yes, this is a test setup. ime also inside of a second firewall.
> > >
> > > well it sounds as if i have broken the netmap. with only the
> > > netmap targets, but no dnat. i cant ping an inside address.
> > > using the outside number.
> > >
> > > my laptop is running as 10.0.20.42 on the inside.
> > >
> > > ping returns:
> > >
> > > [user@becks ~]$ ping 205.133.141.42
> > > PING 205.133.141.42 (205.133.141.42) 56(84) bytes of data.
> > > >From 199.218.109.243 icmp_seq=1 Destination Host Unreachable
> > > >From 199.218.109.243 icmp_seq=2 Destination Host Unreachable
> > > >From 199.218.109.243 icmp_seq=3 Destination Host Unreachable
> > >
> > > #arp -n 10.0.20.42
> > > 10.0.20.42  ether 00:00:86:51:21:5A C eth3.920
> > > as expecter, however
> > >
> > > #arp -n 205.133.141.42
> > > 205.133.141.42 (incomplete) eth3.920
> > >
> > > so the packet made it to the inside address without being natted???
> > >
> > >
> > > the system is running  Red Hat Enterprise Linux AS (2.6.9-22.0.1.EL)
> > >
> > > #route -n
> > > Kernel IP routing table
> > > Destination     Gateway         Genmask         Flags Metric Ref    Use
> > > Iface
> > > 205.133.140.128 0.0.0.0 255.255.255.128 U     0      0        0 eth3.922
> > > 205.133.140.0   0.0.0.0 255.255.255.128 U     0      0        0 eth3.921
> > > 10.0.20.0       0.0.0.0 255.255.255.0   U     0      0        0 eth3.920
> > > 10.0.21.0       0.0.0.0 255.255.255.0   U     0      0        0 eth3.921
> > > 10.0.22.0       0.0.0.0 255.255.255.0   U     0      0        0 eth3.922
> > > 205.133.141.0   0.0.0.0 255.255.255.0   U     0      0        0 eth3.920
> > > 199.218.109.0   0.0.0.0 255.255.255.0   U     0      0        0 eth2
> > > 169.254.0.0     0.0.0.0 255.255.0.0     U     0      0        0 lo
> > > 0.0.0.0         199.218.109.1 0.0.0.0         UG    0      0        0 eth2
> > >
> > > note that i added routes for the 'real' ip's. without these ping gets a
> > > ttl error and best i can tell the packet is bouncing around in the router
> > > that many times;-)
> > >
> > > filter
> > > :INPUT ACCEPT [0:0]
> > > :FORWARD ACCEPT [0:0]
> > > :OUTPUT ACCEPT [586:91329]
> > > :is_coll - [0:0]
> > > -A INPUT -i eth3.920 -p udp -m udp --dport 67 -j ACCEPT
> > > -A INPUT -i eth3.921 -p udp -m udp --dport 67 -j ACCEPT
> > > -A INPUT -i eth3.922 -p udp -m udp --dport 67 -j ACCEPT
> > > -A INPUT -s 10.0.20.0/255.255.255.0 -p icmp -j ACCEPT
> > > -A INPUT -s 10.0.21.0/255.255.255.0 -p icmp -j ACCEPT
> > > -A INPUT -s 10.0.22.0/255.255.255.0 -p icmp -j ACCEPT
> > > -A INPUT -s 205.133.146.31 -j ACCEPT
> > > -A INPUT -s 205.133.146.0/255.255.255.0 -j is_coll
> > > -A INPUT -s 199.218.109.0/255.255.255.0 -j is_coll
> > > -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> > > -A INPUT -j DROP
> > > -A FORWARD -d 205.133.146.31 -j ACCEPT
> > > -A FORWARD -p udp -m udp --dport 68 -j DROP
> > > -A FORWARD -p udp -m udp --dport 67 -j DROP
> > > -A FORWARD -d 205.133.144.0/255.255.255.0 -j ACCEPT
> > > -A FORWARD -d 205.133.146.0/255.255.255.0 -j DROP
> > > -A FORWARD -d 199.218.109.1 -j ACCEPT
> > > -A FORWARD -d 199.218.109.2 -j ACCEPT
> > > -A FORWARD -d 199.218.109.4 -j ACCEPT
> > > -A FORWARD -d 199.218.109.6 -j ACCEPT
> > > -A FORWARD -d 199.218.109.7 -j ACCEPT
> > > -A FORWARD -d 199.218.109.20 -j ACCEPT
> > > -A FORWARD -d 199.218.109.21 -j ACCEPT
> > > -A FORWARD -d 199.218.109.27 -j ACCEPT
> > > -A FORWARD -d 199.218.109.28 -j ACCEPT
> > > -A FORWARD -d 199.218.109.30 -j ACCEPT
> > > -A FORWARD -d 199.218.109.38 -j ACCEPT
> > > -A FORWARD -d 199.218.109.206 -j ACCEPT
> > > -A FORWARD -d 199.218.109.0/24 -j REJECT
> > > -A FORWARD -p udp -m udp --dport 137 -j DROP
> > > -A FORWARD -p udp -m udp --dport 445 -j DROP
> > > -A FORWARD -p tcp -m tcp --dport 445 -j DROP
> > > -A FORWARD -j ACCEPT
> > > -A is_coll -p icmp -j ACCEPT
> > > -A is_coll -p udp -m udp --sport 20 -j ACCEPT
> > > -A is_coll -p tcp -m tcp --sport 20 -j ACCEPT
> > > -A is_coll -p udp -m udp --sport 21 -j ACCEPT
> > > -A is_coll -p tcp -m tcp --sport 21 -j ACCEPT
> > > -A is_coll -p udp -m udp --dport 22 -j ACCEPT
> > > -A is_coll -p tcp -m tcp --dport 22 -j ACCEPT
> > > -A is_coll -p udp -m udp --sport 53 -j ACCEPT
> > > -A is_coll -p tcp -m tcp --sport 53 -j ACCEPT
> > > -A is_coll -j DROP
> > > COMMIT
> > > # Completed on Wed Nov  2 14:59:14 2005
> > > # Generated by iptables-save v1.2.11 on Wed Nov  2 14:59:14 2005
> > > *nat
> > > :PREROUTING ACCEPT [5141:627771]
> > > :POSTROUTING ACCEPT [5:410]
> > > :OUTPUT ACCEPT [2:173]
> > > -A POSTROUTING -s 10.0.20.0/255.255.255.0 -j NETMAP --to 205.133.141.0/24
> > > -A POSTROUTING -s 10.0.21.0/255.255.255.128 -j NETMAP --to
> > > 205.133.140.0/25
> > > -A POSTROUTING -s 10.0.22.0/255.255.255.128 -j NETMAP --to
> > > 205.133.140.128/25
> > > COMMIT
> > > # Completed on Wed Nov  2 14:59:14 2005
> > > ~
> > >
> > > On Wed, 8 Feb 2006, John A. Sullivan III wrote:
> > >
> > > > That sounds like a very dangerous setup.  Nonetheless, if you are indeed
> > > > allowing all inbound access and you are NETMAPped, it should work except
> > > > for those protocols which embed IP address information in the upper
> > > > layers and do not have a nat helper.
> > > >
> > > > For example, NetBIOS browsing includes the IP address in the NetBIOS
> > > > header.  There is not yet a helper in iptables to rewrite the NetBIOS
> > > > portion of the packet so this application breaks when NAT'd with
> > > > iptables.  This could explain why a particular application does not
> > > > work.
> > > >
> > > > It could also be the result of personal firewalls running on the end
> > > > points.
> > > >
> > > > Perhaps you could put a protocol analyzer on the line (e.g., ethereal -
> > > > http://www.ethereal.com) to see where the packets are stopping.  Good
> > > > luck - John
> > > >
> > > > On Wed, 2006-02-08 at 09:15 -0500, Stephen Beck wrote:
> > > > > well at the moment mo FORWARD table blocks a few virus ports
> > > > > and protects a few of my on campus servers. otherwise has a blanket
> > > > > Accept at the bottom, so ime not perventing outside connections there.
> > > > > but they dont seem to be working across the netmap. should netmap pervent
> > > > > outside connections or have I broken it somehow.
> > > > >
> > > > >
> > > > > On Wed, 8 Feb 2006, John A. Sullivan III wrote:
> > > > >
> > > > > > On Wed, 2006-02-08 at 08:35 -0500, Stephen Beck wrote:
> > > > > > > I have several dorm firewalls with nearly 250 users behind each.
> > > > > > > I nat the inside ip's using netmap. this has been up and running for
> > > > > > > 6 months and for the inside users its working fine. for the most part
> > > > > > > I dont want connections orginating from the outside and netmap seems
> > > > > > > to be perventing this. However I now have an application that needs to
> > > > > > > be able to orginate a stream from the outside to any inside
> > > > > > > ip( CopySense ).
> > > > > > >
> > > > > > > ime really not shure:
> > > > > > > if netmap alone should block incomming connections ?
> > > > > > > how to go about allowing them?
> > > > > > >
> > > > > > > from what i see the folling is a start:
> > > > > > > existing netmap lines on one router:
> > > > > > >
> > > > > > > Chain POSTROUTING (policy ACCEPT 6 packets, 300 bytes)
> > > > > > >  362 20370 NETMAP     all  --  *      *       10.0.20.0/24
> > > > > > > 0.0.0.0/0           205.133.141.0/24
> > > > > > >    75  4208 NETMAP     all  --  *      *       10.0.21.0/25
> > > > > > > 0.0.0.0/0           205.133.140.0/25
> > > > > > >   223 10925 NETMAP     all  --  *      *       10.0.22.0/25
> > > > > > > 0.0.0.0/0           205.133.140.128/25
> > > > > > >
> > > > > > > to allow the outside connection for my laptop this works:
> > > > > > >
> > > > > > > Chain PREROUTING (policy ACCEPT 1620 packets, 92093 bytes)
> > > > > > > target     prot opt in     out     source
> > > > > > > destination
> > > > > > > DNAT       all  --  *      *       0.0.0.0/0
> > > > > > > 205.133.141.42      to:10.0.20.42
> > > > > > >
> > > > > > > ile tighten up that rule once i get it working ;-)
> > > > > > >
> > > > > > > however I neet to allow that rule to work for all 255 ip's
> > > > > > > and i cant seem to get the syntax right ???
> > > > > > >
> > > > > > >
> > > > > > > Stephen Beck, Marietta College, 740-376-4366
> > > > > > >
> > > > > > You've hit upon an important distinction -- the nat table does not
> > > > > > handle access control.  That will be handled by your filter table and,
> > > > > > in this case, the FORWARD chain.
> > > > > >
> > > > > > I would suggest a FORWARD policy of DROP and only allow outbound traffic
> > > > > > and inbound from the specific socket you want to allow.
> > > > > >
> > > > > > If you need more information on using nat and filter, Oskar Andreasson
> > > > > > has a great tutorial at
> > > > > > http://iptables-tutorial.frozentux.net/iptables-tutorial.html and there
> > > > > > are some slightly dated training slide shows in the training section of
> > > > > > the ISCS network security management project at
> > > > > > http://iscs.sourceforge.net.  Hope this helps - John
> > > > > > --
> > > > > > John A. Sullivan III
> > > > > > Open Source Development Corporation
> > > > > > +1 207-985-7880
> > > > > > jsullivan@opensourcedevel.com
> > > > > >
> > > > > > If you would like to participate in the development of an open source
> > > > > > enterprise class network security management system, please visit
> > > > > > http://iscs.sourceforge.net
> > > > > >
> > > > --
> > > > John A. Sullivan III
> > > > Open Source Development Corporation
> > > > +1 207-985-7880
> > > > jsullivan@opensourcedevel.com
> > > >
> > > > Financially sustainable open source development
> > > > http://www.opensourcedevel.com
> > > >
> > >
> > --
> > John A. Sullivan III
> > Open Source Development Corporation
> > +1 207-985-7880
> > jsullivan@opensourcedevel.com
> >
> > Financially sustainable open source development
> > http://www.opensourcedevel.com
> >
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com



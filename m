From: "Caracal - G. Hostettler" <100112_2660@bluewin.ch>
Subject: Re: Multihomed firewall and port forwarding nightmare ))):-(
Date: Thu, 15 Jan 2004 19:27:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005901c3db95$45d98840$017ca8c0@lucens.caracal.ch>
References: <00db01c3db07$9daf47f0$0200000a@heretic>
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
Cc: Alexis <alexis@attla.net.ar>

First of all THANX to both Alexis and Anthony !!!

The problem was, as you both pointed out a - basic - routing error.
I did not noticed the stupidity of  3 external gateways...
The origin is that I just copied 3 times the nic def in the
/etc/network/interfaces file w/o editing anything else but the IP address of
the nic.
BTW rules posted work fine w/o modification, but using one NIC.

Being an old man does not protect from doing full newbie errors. Make me
feel muuuuuch younger !

GH

> > this is the solution for the schema with 3 external interfaces.
> > First some basics, you dont need 3 default routes, as the word say, the
> > DEFAULT is the route that packets will take if no other more specific
> route
> > is in the routing table, so if you have one default this is enough. In
> some
> > devices, having 3 defaults will (in some way) do a load balancing by
> flows,
> > im not really shure if it works in linux, but i could say it isnt.
> >
> > Having 3 interfaces to the same lan is not a good idea, but if you think
> > you're protected with this schema, so you can use it. Those interfaces
are
> > connected and remember the term "connected" to the same net, so all
> packets
> > will not follow any route at all, all packets in a connecetd network are
> > switched, but not routed, this means that you dont need at all to
specify
> a
> > default route, but, in order to keep the mind sanity, we will think that
> we
> > need the default route. or better said, the default route pointing to a
> next
> > hop.
> >
> > so , having 3 interfaces for wan, 1 router for gateway (if the router
> > crashed, all 3 wan interfaces will stop working) and one lan interface
you
> > need to do this in order to get some "backup" route if some ethernet wan
> > interfaces gets down.
> >
> > ip route add default dev eth1
> > ip route add default dev eth2 metric 10
> > ip route add default dev eth3 metric 20
> >
> > so, all outgoing traffic will use eth1 when its up and so on.
> >
> > All incoming traffic will use its assigned interface (the router will
> check
> > its arp table and then use the MAC address in his table to switch the
> packet
> > with this mac address as destination)
> >
> >
> > now you have a "correct" routing.
> >
> > how i didnt read (and i wont do this :) ) the rules that youve posted,
ill
> > assume for internal LAN the following IP for the servers
> >
> > 192.168.124.5 ftp
> > 192.168.124.6 mail
> > 192.168.124.7 http
> >
> > (i assume all LAN hosts have the Firewall IP address as default next
hop)
> >
> > this are the MOST basic set of rules for your  schema
> >
> > modprobe ip_nat_ftp
> > iptables -P INPUT DROP
> > iptables -P FORWARD DROP
> >
> > iptables -A FORWARD -i lo -j ACCEPT
> > iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> > #all outgoing traffic allowed
> > iptables -A FORWARD -i eth0 -m state --state NEW -j ACCEPT
> > #incoming traffic restricted by services
> > iptables -A FORWARD -i eth1 -d 195.65.176.162 -p tcp --dport 21 -m
> > state --state NEW -j ACCEPT
> > iptables -A FORWARD -i eth2 -d 195.65.176.163 -p tcp --dport 110 -m
> > state --state NEW -j ACCEPT
> > iptables -A FORWARD -i eth2 -d 195.65.176.163 -p tcp --dport 25 -m
> > state --state NEW -j ACCEPT
> > iptables -A FORWARD -i eth3 -d 195.65.176.164 -p tcp --dport 80 -m
> > state --state NEW -j ACCEPT
> > iptables -A FORWARD -i eth4 -d 195.65.176.164 -p tcp --dport 443 -m
> > state --state NEW -j ACCEPT
> >
> > echo 1 > /proc/sys/net/ipv4/ip_forward
> >
> > #now the POSTROUTING and PREROUTING statements (in order to figure, the
> > following statements are nasty, dirty and ugly too :) )
> >
> > iptables -t nat -A PREROUTING -i eth1 -d 195.65.176.162 -p tcp --dport
> 21 -j
> > DNAT --to 192.168.124.5:21
> > iptables -t nat -A PREROUTING -i eth2 -d 195.65.176.163 -p tcp --dport
> 25 -j
> > DNAT --to 192.168.124.6:25
> > iptables -t nat -A PREROUTING -i eth2 -d 195.65.176.163 -p tcp --dport
> > 110 -j DNAT --to 192.168.124.6:110
> > iptables -t nat -A PREROUTING -i eth3 -d 195.65.176.164 -p tcp --dport
> 80 -j
> > DNAT --to 192.168.124.7:80
> > iptables -t nat -A PREROUTING -i eth3 -d 195.65.176.164 -p tcp --dport
> > 443 -j DNAT --to 192.168.124.7:443
> >
> > iptables -t nat -A POSTROUTING -o eth1 -s 192.168.124.5 -j SNAT --to
> > 195.65.176.162
> > iptables -t nat -A POSTROUTING -o eth2 -s 192.168.124.6 -j SNAT --to
> > 195.65.176.163
> > iptables -t nat -A POSTROUTING -o eth3 -s 192.168.124.7 -j SNAT --to
> > 195.65.176.164
> >
> >
> > ill repeat, this is a nasty way to achieve the goal, ill use some
chains,
> > other PRE & POST routing statements and for shure, only one interface.
> >
> >
> > try this and then tell us a tail how it was
> >
> >
> > regards
> >
> >
> >
> >



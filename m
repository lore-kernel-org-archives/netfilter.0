From: Tim Nelson <tnelson@rockbochs.com>
Subject: Re: Bridging / VLANs / ebtables
Date: Wed, 17 Dec 2014 10:51:53 -0600 (CST)
Message-ID: <11784487.350636.1418835113805.JavaMail.root@rockbochs.com>
References: <20141217025514.GW967@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20141217025514.GW967@titan.lakedaemon.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

----- Original Message -----
> Tim,
> 
> Ah crap.  I should've read the OP first.  Definitely some scenario
> lost
> in quote-trimming...
> 
> On Fri, Dec 12, 2014 at 02:03:12PM -0600, Tim Nelson wrote:
> > Greetings-
> > 
> > I have an interesting situation that requires bridging some VLAN
> > enabled interfaces together on a Debian 7.x x86 system. On the
> > host,
> > there is a single physical interface passing traffic natively
> > (eth0),
> > and two tagged VLANs also passing traffic (eth0.2 and eth0.3).
> > 
> > The use case is that I need to bridge eth0 with eth0.2, allowing
> > layer
> > two traffic to pass seamlessly between interfaces, and still leave
> > eth0.3 in a usable state. The switch this system is connected to is
> > outside of my control, which is the reason for the odd network
> > setup.
> > 
> > What I'm finding by simply creating a new bridge br0 with members
> > eth0
> > and eth0.2 is no connectivity on eth0.2, and slow/quirky
> > connectivity
> > on eth0 (native connectivity to Debian 7.x host).
> 
> This sounds a bit like an IP address / routing rule conflict.  Did
> you
> set eth0 and eth0.2 0.0.0.0 and promiscuous?  Did you assign one IP
> address to the bridge?  Would you mind sending the output of:
> 

I had not thought of putting the interfaces in promiscuous mode, but have since tested (as per your last email). Still no change.

> # ip addr show
> 

1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,PROMISC,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast master br0 state UP qlen 1000
    link/ether b8:27:eb:bd:9e:51 brd ff:ff:ff:ff:ff:ff
3: eth0.3@eth0: <BROADCAST,MULTICAST,PROMISC,UP,LOWER_UP> mtu 1500 qdisc noqueue master br0 state UP
    link/ether b8:27:eb:bd:9e:51 brd ff:ff:ff:ff:ff:ff
4: eth0.2@eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP
    link/ether b8:27:eb:bd:9e:51 brd ff:ff:ff:ff:ff:ff
    inet 172.31.255.249/29 brd 172.31.255.255 scope global eth0.2
       valid_lft forever preferred_lft forever
    inet6 fe80::ba27:ebff:febd:9e51/64 scope link
       valid_lft forever preferred_lft forever
5: br0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP
    link/ether b8:27:eb:bd:9e:51 brd ff:ff:ff:ff:ff:ff
    inet 172.16.23.152/24 brd 172.16.23.255 scope global br0
       valid_lft forever preferred_lft forever
    inet6 fe80::ba27:ebff:febd:9e51/64 scope link
       valid_lft forever preferred_lft forever


> and
> 
> # route -n
> 

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         172.16.23.1     0.0.0.0         UG    0      0        0 br0
172.16.23.0     0.0.0.0         255.255.255.0   U     0      0        0 br0
172.31.255.248  0.0.0.0         255.255.255.248 U     0      0        0 eth0.2


> ?
> 
> > It has been suggested to use ebtables to filter the VLANs from the
> > eth0 interface on the bridge, yet allow operation to the system
> > interface eth0.2/eth0.3. I found a very specific reference on the
> > ebtables site for this scenario [1], usage suggested (modified to
> > fit
> > my environment):
> > 
> > ebtables -t broute -A BROUTING -i eth0 -p 802_1Q --vlan-id 3 -j
> > DROP
> > ebtables -t broute -A BROUTING -i eth0 -p 802_1Q --vlan-id 2 -j
> > DROP
> > 
> > If my understanding of the ebtables usage as a brouter, and the
> > kernel's interaction between all components involved, this should
> > work. However, as noted, no change in operation is observed.
> 
> Yes, based on your description of the network you are going to need
> the
> above rules.
> 

I've added the above rules, no change:

root@h4222:~# ebtables -t broute -L
Bridge table: broute

Bridge chain: BROUTING, entries: 2, policy: ACCEPT
-p 802_1Q -i eth0 --vlan-id 3 -j DROP
-p 802_1Q -i eth0 --vlan-id 2 -j DROP

Thank you,

--Tim

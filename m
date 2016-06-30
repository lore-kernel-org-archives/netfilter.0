From: Leon Brits <leonb@parsec.co.za>
Subject: iptables drop packet after nat-prerouting
Date: Thu, 30 Jun 2016 06:22:55 +0000
Message-ID: <9abd20b2e6b342d4b55080723ccfc544@EXCHANGESRV.PARSEC.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

I have been using iptables for quite a while, but ran into this problem
the other day when I reconfigured the ip4 networks.

I have three open networks connected via IPsec. Hosts on two of the open
networks (192.168.2.10/24 and 192.168.3.10/24) can ping each other via the
IPsec connection and I can see logs printed for ICMP as they are forwarded
("filter forward" table) and then out after they've go through the "xfrm
encode" steps. If I try to ping the other network (192.168.1.0/24) from
the local host (192.168.2.10), I can see the ICMP packet enter the system
(using tcpdump) and it even gets to the "nat prerouting" table, but after
that it is gone! I've logged at "mangle input and forward" tables and even
the link-layer at "mangle forward" table. Nothing! There is only 'DROP'
jumps in my rules after forwarding has taken place. It seems to be dropped
at "routing decision" [according to the "Packet flow in netfilter and
general networking" diagram of Jan Engelhardt of 28/02/2014]

Is there a way to see what packets are dropped due to routing issues?

My routing table is:
~#ip r
192.168.254.252/30 dev dbg  proto kernel  scope link  src 192.168.254.253
172.21.6.0/24 dev black  proto kernel  scope link  src 172.21.6.171
192.168.2.0/24 dev red  proto kernel  scope link  src 192.168.2.1
192.168.0.0/24 dev man  proto kernel  scope link  src 192.168.0.202
127.0.0.0/8 dev lo  scope link
default via 172.21.6.5 dev black

As you can see I have a 'dbg' interface, an external IPsec interface
'black', an internal open interface 'red' and a management interface
'man'. The default is out on the 'black' interface with IPsec via the ADSL
router.

It cannot be the IPsec config since the packet to this specific target
network is never forwarded and therefore never reaches the "xfrm lookup".
And a ping to the other network succeeds completely in both ways.

Any thoughs? Thanks for your time - appreciated.

Regards,
LJB




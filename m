From: "Patrick Ahler" <patrick@vikus.com>
Subject: RE: Network config review
Date: Fri, 30 Jul 2004 10:02:09 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <810BC538117E9F4E9BB152E0C100DF1F18F4B9@farmer.vikus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Basically what I'm trying to do with this configuration is replace a
current firewall. I am just having trouble getting the ISP
gateway's(JACK's) arp requests to recognize my firewall's (BILL's) MAC
address for all arp requests to my network.  When I switch firewalls
(BILL'S), everything will work fine until the ISP's gateway (JACK) sends
an arp request to my network for an ip, as the ISP's gateway requests
ip's on my network they return unanswered. On the old firewall(Previous
BILL) when the ISP's gateway would send an arp request for anything on
my network my firewall machine would respond with it's MAC address.=20


My current network setup (a.b.c. Refers to public ip's; X=3D any # =
between
3 and 62)
-------------
| Internet |
------------- (ISP gateway) a.b.c.1  255.255.255.192 (JACK)
     |
     |
     |
-------------------- eth0 a.b.c.2  255.255.255.192
| gateway/firewall |   (BILL)
-------------------- eth1 192.168.1.2  255.255.255.0
     |    =20
     |
     |
-------------------- (192.168.1.X) 255.255.255.0=20
| Internal Machines |
--------------------
  =20

 =20
NAT
iptables -t nat -A PREROUTING -d a.b.c.X -i eth0 -j DNAT
--to-destination 192.168.1.X=20
iptables -t nat -A POSTROUTING -s 192.168.1.X -o eth0 -j SNAT
--to-source a.b.c.X
 Or
Iptables -L -t nat -nvx
(pkts bytes target prot opt in out)
PREROUTING
0  0	DNAT	all -- eth0  *  0.0.0.0/0   a.b.c.X   to:192.168.1.X
POSTROUTING
0  0	SNAT	all -- *   eth0 192.168.1.X   0.0.0.0/0 to:a.b.c.X

The rest of the iptables ruleset Policies are currently set to accept.

Routing tables (sample)
Destination		GW		Genmask		Iface
a.b.c.X	       * 	  255.255.255.255	  UH	 eth1 (??eth0??)
a.b.c.0	       * 	  255.255.255.192	  U	 eth0
192.168.1.0	       * 	  255.255.255.0	  U	 eth1
127.0.0.0		 *	  255.0.0.0		  U	 lo
Default	    a.b.c.1   0.0.0.0		  UG	 eth0

(??Do I need to add any of the routes below??)
192.168.1.0	 192.168.1.2  255.255.255.0     UG   eth1
a.b.c.0	   a.b.c.2    255.255.255.0     UG   eth0=20
192.168.1.2  	 *	  255.255.255.255   UH	 eth1 (??eth1??)
192.168.1.X  	 *	  255.255.255.255   UH	 eth1 (??eth1??)
a.b.c.2	       * 	  255.255.255.255	  UH	 eth1 (??eth0??)


>On the new firewall I have a few questions about my current setup; if
anyone would be so kind to take a look and let me know if there are any
issues with the configuration. Thanks!

-Patrick Ahler


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Thursday, July 29, 2004 5:56 PM
To: netfilter@lists.netfilter.org
Subject: Re: Network config review

On Thursday 29 July 2004 10:25 pm, Patrick Ahler wrote:

> I have a few questions about my current setup; if anyone would be so=20
> kind to take a look and let me know if there are any issues with the=20
> configuration. Thanks!

Instead of the output from "iptables -L", please post either your
iptables rules (the script you use to set up the ruleset) or else the
output from "iptables -L -nvx; iptables -L -t nat -nvx", since that
tells us much more information, which is helpful.

More importantly, however, please tell us what you want your firewall to
do (what to allow, what to block, that sort of thing) - then we can
suggest opinions on whether your ruleset is a good way of achieving it.

Regards,

Antony.

--
It is also possible that putting the birds in a laboratory setting
inadvertently renders them relatively incompetent.

 - Daniel C Dennett

                                                     Please reply to the
list;
                                                           please don't
CC me.





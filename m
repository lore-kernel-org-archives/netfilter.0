From: "Patrick Ahler" <patrick@vikus.com>
Subject: Network config review
Date: Thu, 29 Jul 2004 17:25:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <810BC538117E9F4E9BB152E0C100DF1F18F4A6@farmer.vikus.net>
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

I have a few questions about my current setup; if anyone would be so
kind to take a look and let me know if there are any issues with the
configuration. Thanks!

My current network setup (a.b.c.  Refers to public ip's, X=3D any #
between 3 and 62)
-------------
| Internet |
------------- (ISP gateway) a.b.c.1  255.255.255.192
     |
     |
     |
-------------------- eth0 a.b.c.2  255.255.255.192
| gateway/firewall |
-------------------- eth1 192.168.1.2  255.255.255.0
     |    =20
     |
     |
-------------------- (192.168.1.X) 255.255.255.0=20
| Internal Machines | =20
--------------------
    =20
NAT
iptables -t nat -A PREROUTING -d a.b.c.X -i eth0 -j DNAT
--to-destination 192.168.1.X
iptables -t nat -A POSTROUTING -s 192.168.1.X -o eth0 -j SNAT
--to-source a.b.c.X


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




Patrick Ahler
Systems Administrator
Vikus Corporation=20


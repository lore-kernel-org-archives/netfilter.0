From: =?iso-8859-2?Q?Horv=E1th_Szabolcs?= <hsz@leier.hu>
Subject: MASQUERADE: Route sent us somewhere else
Date: Tue, 11 Jan 2005 14:48:15 +0100 (CET)
Message-ID: <33675.10.1.0.231.1105451295.squirrel@10.1.0.231>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hello!

We have a firewall, and it's inside many UML's.
I can't establish new connections from UML, kernel log says
"MASQUERADE: Route sent us somewhere else".

The host system:

# ip rule
0:      from all lookup local
32760:  from 192.168.14.2 lookup uml
32761:  from 192.168.13.2 lookup uml
32762:  from 192.168.12.2 lookup uml
32763:  from 192.168.11.2 lookup uml
32764:  from 213.253.196.232 lookup pantel
32765:  from 213.253.196.226 lookup pantel
32766:  from all lookup main
32767:  from all lookup default

# ip route list table uml
192.168.14.0/24 dev tap4  scope link
192.168.13.0/24 dev tap3  scope link
192.168.12.0/24 dev tap2  scope link
192.168.11.0/24 dev tap1  scope link
10.1.0.0/24 dev eth2  scope link
10.0.0.0/8 via 10.1.0.3 dev eth2
default via 213.253.196.225 dev eth1

# ifconfig
eth1      Link encap:Ethernet  HWaddr 00:0D:88:B4:1C:9F
          inet addr:213.253.196.226  Bcast:213.253.195.255 
Mask:255.255.255.240

eth1:1    Link encap:Ethernet  HWaddr 00:0D:88:B4:1C:9F
          inet addr:213.253.196.232  Bcast:213.253.195.255 
Mask:255.255.255.240

eth2      Link encap:Ethernet  HWaddr 00:50:8D:E9:29:90
          inet addr:10.1.0.1  Bcast:10.255.255.255  Mask:255.255.255.0

ppp0      Link encap:Point-to-Point Protocol
          inet addr:81.182.243.194  P-t-P:195.228.253.19 
Mask:255.255.255.255

tap4 is masqed through eth1. We use shorewall, and it logs any rejected
or dropped packet, but we didn't find this entry, so I think
there isn't rule which drops the packet.

The all we see is the following:
Jan 11 14:53:14 localhost kernel: MASQUERADE: Route sent us somewhere else.

What is this message means? How can I debug more precisely?
What manual I need to read?

Thanks in advance,
Szabolcs Horvath




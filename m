From: Matthew Cornwell Williams <os@UDel.Edu>
Subject: Masquerading Firewall <--GRE--> Bridging Masquerading Firewall?
Date: Mon, 18 Nov 2002 09:06:38 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.SOL.4.44.0211180847260.29014-100000@copland.udel.edu>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi..  I was wondering if a certain setup was even remotely possible ;)

Here's my current setup:

I have a home network and a school network in my dorm.  At home, I have a
bunch of 198.168.1.0/24 hosts.  One of them, 198.168.1.70, has a second
NIC.  On this second NIC, it uses 198.168.2.1 and the AUI port has a
direct crossover to 198.168.2.3.  198.168.2.3 and 198.168.1.0/24 are all
set to use 198.168.1.5 as the nameserver and default gateway.
198.168.1.5 is running bind and has an Internet link at 68.x.y.z.
68.x.y.z AKA 198.168.1.5 has a very very complex firewall setup to prevent
intruders from doing nasty things to my box.  It has IP masquerading for
198.168.1.0/24 and 198.168.2.0/24 through 68.x.y.z.  It has a route for
198.168.2.0/24 through 198.168.1.70, so any 198.168.1.0/24 host which
doesn't pick up the router advertisements from 198.168.1.70 and doesn't
already have a static route for 198.168.2.0/24 will be able to get to it
through 198.168.1.5.  198.168.1.70 and 198.168.1.5 both run Linux, kernel

Still part of the current setup:

I have a small network in my dorm with just two hosts (a linux box and an
irix box) and one hub.  The linux box is a bridging masquerading firewall.
Sometimes I test new boxes in my dorm before adding them to my home
network, so I give them 192.168.1.0/24 addresses and plug them in to the
hub.  The linux box, 192.168.1.1 AKA 128.a.b.c on the campus network, has
two NIC's.  One NIC connects to the campus network and one to the hub.
This box masquerades 192.168.1.0/24 through 128.a.b.c.  It responds to
128.a.b.c on either NIC and 192.168.1.1 just on the hub-side NIC.
Because it is a bridge, I don't use ifconfig to assign addresses to
NIC's; I bind them with ip, and control them with iptables.  Just FYI, I
am using the bridging firewall patch from bridge.sf.net.

I want a GRE tunnel that lets 198.168.1.0/24 and 198.168.2.0/24 see
192.168.1.0/24, and 128.a.b.c and 128.d.e.f (the irix box) see
198.168.1.0/24 and 198.168.2.0/24.  192.168.1.0/24 should also be able to
see 198.168.1.0/24 and 198.168.2.0/24.  I managed to get a tunnel that
lets 192.168.1.1 see 198.168.1.0/24 and 198.168.2.0/24, but only through
IP masquerading; in other words, 198.168.1.0/24 hosts see connections from
128.a.b.c AKA 192.168.1.1 as coming from 68.x.y.z.  68.x.y.z can't ping
192.168.1.1.  The IRIX box doesn't know where to begin.  I am playing
with IP aliasing to give it a second address like 192.168.1.W, but right
now it insists there is no route through 192.168.1.1 to 198.168.1.0/24.
I tried the linux IPIP tunnel and all I got was collisions on either end.
Yes, I deleted the stupid auto-pointopoint route that ifconfig set up.

I can be reached at os@udel.edu.  Full details of my setup are available
upon request.  I'm not comfortable with sending my internet IP's and
firewall setups to a mailing list with not only potentially subscribers
who may be threats to my network but also a public archive.

--os (the orange squid)
a.k.a. Matt Williams
os@udel.edu os@os.us.eu.org



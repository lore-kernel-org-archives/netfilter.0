From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: 2 NICs on same subnet
Date: Fri, 5 Nov 2004 10:45:45 -0800
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E38F@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: a.ledvinka@promon.cz, schuster.sven@gmx.de, netfilter@lists.netfilter.org

Ok, here's my two cents. There IS a solution, I can feel it. I'm just
going to work through it through talking, and hope for the best. (Note,
Although not totally in topic, the solution is in fact)

1. You're getting inbound responses on the wrong NIC because you're
sending IP requests from the wrong device. The Switch thinks that NIC 1
does have IP #2 (AKA: Accidental ARP poison).=20
2. I'm assuming you're using this for either an extra security mechanism
or for a backup line
3. I'm assuming that the machine is standalone and is not hosting
services behind it. Lets just throw that complexity out the window.

So, the real thing you need to do is FORCE packets to/from IP1 in/out of
IF1 and packets to/from IP2 in/out of IF2.


Solution Overview

1. Application Layer
When you start your application, you must bind inbound/outbound traffic
to a specific port. If your software doesn't support this, you could
setup a local proxy server to do it.

2. Firewall Layer
When packets sourced as either IP1 or IP2 come into the OUTPUT chain,
mark it accordingly.

3. Routing Layer
Read the mark on the packets coming down the pipe (Firewall OUTPUT) and
direct the packets out the correct interface

4. Datalink Layer=20
We must flush out all ARP caches on any devices that may have been
poisoned after everything else has been complete. This usually means
turning off/on the network switch.


Implementation details

Step 1. Routing Tables
Your routing tables should probably look like the following if it was
setup default.

192.168.1.0/24 dev eth0  scope link=20
192.168.1.0/24 dev eth1  scope link=20
127.0.0.0/8 dev lo  scope link=20
default via 192.168.1.254 dev eth0=20
default via 192.168.1.254 dev eth1

As you can see here, there's nothing FORCING the packets to go out
either of the interfaces. Lets create a couple tables that will FORCE
the traffic to one interface or the other.

# Create a couple tables that will match against firewall MARK rules and
direct them to new tables
   ip rule add table 1 fwmark 1
   ip rule add table 2 fwmark 2

# Create the new tables to have 1 single route (I'm assuming there are
no other routes!)
   ip route add default dev ${IF_1} table 1 src ${SRC_IP_1}
   ip route add default dev ${IF_2} table 2 src ${SRC_IP_2}

All done. That takes care of the routing. Now to activate the routing
code: Firewalls

Step 2. Firewall Layer

In order for all this to work, we need to mark packets that come in/out
of the system on the correct ports. Since we don't have any other
routes, I'm going to make this simple. If you want to be totally
correct, I think the CONNMARK rule would be better, but worry about it
after everything already works.

# Mark packets from a source address to a specific MARK
   iptables -t mangle -A OUTPUT --source ${SRC_IP_1} -j MARK 1
   iptables -t mangle -A OUTPUT --source ${SRC_IP_2} -j MARK 2
# If we get here without hitting one of the above rules, I'm going to
take a default route from the 'main' routing table

# Make sure that no matter what don't send packets with the wrong
routing out unfettered
   iptables -t nat -A POSTROUTING -o ${IF_1} -j SNAT --to ${IP_1}
   iptables -t nat -A POSTROUTING -o ${IF_2} -j SNAT --to ${IP_2}


Step 3. Application Layer

Notice that in the firewall layer it used the --source to determine what
MARK to assign. Any normal connection coming from the socket layer
generally doesn't set the internet address source of the connection. If
you know socket coding, you usually call socket then connect when a
client connects to a server. Neither of these commands specify the
IP/Port that you are connecting FROM. If your tool doesn't allow you to
specify a src ip/port to connect from, you have issues.

One workaround that I came across was Squid Proxy. It does allow you to
hard code the source address of the external connection by specifying
tcp_outgoing_address. If your tool allows you to specify a proxy server,
this could be your solution. If your tool doesn't allow you to specify
the proxy / src ip of the connection, you may need to explore other
alternatives.



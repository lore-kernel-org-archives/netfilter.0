From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Short questions about NAT and FTP
Date: Thu, 13 Jul 2006 15:17:41 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C40127C0@knowledge.wizdom.nu>
References: <44B6475A.70305@tournet.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: sisdis@tournet.com.ar, "Netfilter lista (iptables)" <netfilter@lists.netfilter.org>

1. NAT rule from a to be would be enough, though it's best to use =
standard ports (ie 21 for ftp), or connection tracking might cause =
problems. Oh yeah, do not forget a FORWARD rule (to the internal IP of =
machine B) to allow the incoming traffic.
=20
2. Unless all your internal machines have routable Internet addresses, =
you will need a SNAT or MASQUARADE rule too.
=20
-Sietse

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Alejandro
Sent: Thu 13-Jul-06 15:15
To: Netfilter lista (iptables)
Subject: Short questions about NAT and FTP



Dear all,

I have two short question please:

1) Machine A from Internet accesses machine B from (web server) my DMZ
behind my linux/iptables, is it necessary to build a NAT rule from A to
B and from B to A, or just A to B is enough ???


2) I want my LAN users to access all FTP servers from Internet, and I
have loaded the ip_conntrack_ftp module.

Are this rules enough or do I have to specify something else (taking
into account FTP active and passive modes) ???

$IPTABLES -A FORWARD  -i eth0  -m state --state ESTABLISHED,RELATED  -j
ACCEPT

$IPTABLES -A FORWARD -p tcp -m tcp  -s 192.168.0.0  --dport 21  -m state
--state NEW  -j ACCEPT


Thanking in advance !!!!

Alejandro





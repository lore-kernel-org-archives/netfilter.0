From: mad.eye@gmx.net
Subject: Re: Help on this iptable script
Date: Tue, 17 Jun 2003 21:58:56 +0200 (MEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <14035.1055879936@www50.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org
Cc: sun@percipia.com

Change the rules order to:

$IPT -N tcp_packets
....more stuff...

$IPT -A tcp_packets -p tcp -m multiport --destination-ports ${IN_PORTS} -j
ACCEPT
...more stuff...

$IPT -A INPUT -i eth0 -p tcp -j tcp_packets
...more stuff

instead of:
$IPT -N tcp_packets
....more stuff...

$IPT -A INPUT -i eth0 -p tcp -j tcp_packets
...more stuff

$IPT -A tcp_packets -p tcp -m multiport --destination-ports ${IN_PORTS} -j
ACCEPT
...more stuff...

HTH



---original message---

Hi All,
=20
Sorry for asking this question again.  I have machine with single interface
card, We want to black all incoming, outgoing package other than
21,22,23,53,80,2020,3306,8080 ports.
=20
When default OUTPUT policy is ACCEPT every thing working fine.
=20
$IPT -P OUTPUT ACCEPT
=20
=20
If I make default OUTPUT policy is DROP, I was not able login using ssh,
also iptables -L command takes about 3 minutes to display the result.
=20
$IPT -P OUTPUT DROP
=20
What I am dong wrong? Any tips to improve this script
=20
=20
Thanks
-SR
=20
#!/bin/bash

#set -xv

INT=3D"eth0"

LO=3D"lo"

ANY=3D"Any/0"

PRIVP=3D"0:1023"

UNPRI=3D"1024:65535"

IN_PORTS=3D"21,22,23,53,80,2020,3306,8080"

OUT_PORTS=3D"21,22,23,53,80,2020,3306,8080"

IPT=3D"/sbin/iptables"

# Set the Default Policies

$IPT -P INPUT DROP

$IPT -P OUTPUT ACCEPT

$IPT -P FORWARD DROP

$IPT -F

$IPT -X icmp_packets

$IPT -X tcp_packets

$IPT -X udp_packets


#Local Loopback Address

$IPT -A INPUT -i $LO -j ACCEPT

$IPT -A OUTPUT -o $LO -j ACCEPT

$IPT -N icmp_packets

$IPT -N tcp_packets

$IPT -N udp_packets

# Filter untrusted traffic

$IPT -A INPUT -i eth0 -p icmp -j icmp_packets

$IPT -A INPUT -i eth0 -p tcp -j tcp_packets

$IPT -A INPUT -i eth0 -p udp -j udp_packets

# Trust traffic we initiated from untrusted networks.

$IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# Log dropped traffic.

$IPT -A INPUT -m limit --limit 3/min --limit-burst 3 -j LOG --log-prefix
"IPT INPUT packet died: " --log-level 6

# Allow outbound traffic.=20

$IPT -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

$IPT -A OUTPUT -p tcp -m multiport --source-ports ${OUT_PORTS} -j ACCEPT

$IPT -A OUTPUT -p udp -m multiport --source-ports ${OUT_PORTS} -j ACCEPT

# Log dropped traffic.

$IPT -A OUTPUT -m limit --limit 3/min --limit-burst 3 -j LOG --log-prefix
"IPT OUTPUT packet died: " --log-level 6

=20

# Allow incoming ports=20

$IPT -A tcp_packets -p tcp -m multiport --destination-ports ${IN_PORTS} -j
ACCEPT

## Manage the following ICMP traffic .

$IPT -A icmp_packets -p icmp -m icmp --icmp-type 0 -j ACCEPT

$IPT -A icmp_packets -p icmp -m icmp --icmp-type 3 -j ACCEPT

$IPT -A icmp_packets -p icmp -m icmp --icmp-type 5 -j ACCEPT

$IPT -A icmp_packets -p icmp -m icmp --icmp-type 11 -j ACCEPT

$IPT -A icmp_packets -i eth1 -p icmp -m icmp --icmp-type 8 -j ACCEPT

$IPT -A icmp_packets -i lo -p icmp -m icmp --icmp-type 8 -j ACCEPT

# Allow potentially untracked valid DNS traffic.

$IPT -A udp_packets -p udp -m udp --sport 53 -j ACCEPT

=20

--=20
+++ GMX - Mail, Messaging & more  http://www.gmx.net +++
Bitte l=E4cheln! Fotogalerie online mit GMX ohne eigene Homepage!



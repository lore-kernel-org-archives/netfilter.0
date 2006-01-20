From: SainTiss <saintiss@gmx.net>
Subject: ip forwarding: client has stalling problems
Date: Fri, 20 Jan 2006 15:16:11 +0100
Message-ID: <200601201516.13638.saintiss@gmx.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1753552.9TQlCdv9H5";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

--nextPart1753552.9TQlCdv9H5
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

I just set up IP forwarding on a 2.6.12 debian system (server) and a 2.6.12=
=20
ubuntu client. I used this script:

#!/bin/sh
export PATH=3D$PATH:/sbin

# first empty everything
iptables -F
iptables -t nat -F
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# this lets all established connections through
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# allow incoming packets if they are a reply to packets from this computer
iptables -A INPUT -p tcp ! --syn -j ACCEPT

# lets some connections to this computer
iptables -A INPUT -m state --state NEW -p tcp -m multiport --dports=20
113,22,4662,2735,1731,6891,2566,1919,9876,2234,3707,6881,6346 -j ACCEPT

iptables -A INPUT -m state --state NEW -s 127.0.0.1 -p all -j ACCEPT
iptables -A INPUT -m state --state NEW -s 192.168.0.1 -p all -j ACCEPT

iptables -A INPUT -m state --state NEW -i eth0 -j ACCEPT
iptables -A INPUT -m state --state NEW -s 192.168.0.2 -p udp -j ACCEPT

iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

# logs everything not accepted earlier
iptables -A INPUT -j LOG --log-level info --log-prefix "IPT INPUT REJECT: "

# let forwarded ready connections through
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# let anything from your internal lan machines to net and back
iptables -A FORWARD -m state --state NEW -i eth0 -j ACCEPT
iptables -A FORWARD -m state --state NEW -s 192.168.0.2/24 -j ACCEPT

# logs everything not accepted earlier
iptables -A FORWARD -j LOG --log-level info --log-prefix "IPT FORWARD REJEC=
T:"

# this is the masquerading
# all the masquerading in iptables is done in NAT table
iptables -t nat -A POSTROUTING -o ppp0 -s 192.168.0.2 -j MASQUERADE


=2D------------

I also echo 1 to /proc/sys/net/ipv4/ip_forward.

I am able to e.g. ping www.google.com on the client, so it is basically=20
working. However, whenever it is supposed to keep a connection for a longer=
=20
time, then it just stalls. e.g. when I want to scp something off a server, =
or=20
apt-get update or something similar, it creates the connection all right, b=
ut=20
just downloads a minimal amount or even nothing, then just stalls.

Server routing table:
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Ifa=
ce
86-39-33-1.cust *               255.255.255.255 UH    0      0        0 ppp0
localnet        *               255.255.255.0   U     0      0        0 eth0
default         86-39-33-1.cust 0.0.0.0         UG    0      0        0 ppp0

Client routing table:
Destination     Gateway         Genmask         Flags Metric Ref    Use Ifa=
ce
192.168.0.0	*		255.255.255.0		U	0	0	0	eth0
default         192.168.0.1       0.0.0.0         UG    0      0        0 e=
th0


Any hints?

Thanks in advance,

Hans


=2D-=20
If we cannot live so as to be happy, let us at least live so as to deserve =
it
 -- Immanuel Hermann Fichte

People are promoted up to their level of incompetence
 -- Peter's Principle

Ark Linux - Linux for the Masses (http://arklinux.org)

Hans Schippers
Aspirant FWO - Vlaanderen
=46ormal Techniques in Software Engineering (FoTS)
University of Antwerp
Middelheimlaan 1
2020 Antwerpen - Belgium
Phone: +32 3 265 38 71
=46ax: +32 3 265 37 77

--nextPart1753552.9TQlCdv9H5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBD0PCtXlnUYIbmLOQRAtk1AKCmpp3Lkyd/S1VJKonIDim4CRHfdQCeMn5c
44rxm6iYLMwiMi1BlAZ40go=
=hFwl
-----END PGP SIGNATURE-----

--nextPart1753552.9TQlCdv9H5--


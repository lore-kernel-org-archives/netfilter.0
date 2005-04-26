From: "=?iso-8859-15?q?Nicol=E1s_Vel=E1squez?= O." <gnicolax@gmail.com>
Subject: define what to nat
Date: Tue, 26 Apr 2005 13:17:28 -0500
Message-ID: <200504261317.29179.gnicolax@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


Hello there,=20

I've done some research, and yet I couldn't find any information.

I want to define what is natted, not only filter what is natted.

An example where it could be needed:
Let's say that I have openswan and 2.6 native ipsec. That means no=20
virtual ipsec iface. I want to connect various site LANs to my hq LAN=20
through VPN, so no nat should be done between those LAN-LAN=20
connections.

An example of one site-hq lan-lan connection:
LAN A <---> FW A / VPN A <---> INTERNET <---> FW B / VPN B <---> LAN B

segment A: 192.168.0.0/24 (HQ)
segment B: 192.168.1.0/24 (site)

I could use:
On FW A:
iptables -t nat -A POSTROUTING -o eth0 -d ! 192.168.1.0/24 -j MASQUERADE

On FW B:
iptables -t nat -A POSTROUTING -o eth0 -d ! 192.168.0.0/24 -j MASQUERADE

That would work, yet if the number of site-hq lan-lan connections grows,=20
it becomes either not useful and/or difficult to maintain.

So I was wondering if there is a way to do something like:
iptables -t nat -A POSTROUTING -o eth0 -d 192.168.0.0/24 -j "DO NOT NAT"
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

This way even if the number of sites to connect using VPN grows, it will=20
be easy to maintain.

Is there a way to achieve what I want??

Ps: I tried the mangle table too.
Ps2: Sorry for my english.



=2D-=20

Atentamente,
Nicol=E1s Vel=E1squez O.
Bogot=E1, Colombia

(^) =A0 ASCII Ribbon Campaign
 X =A0 =A0NO HTML/RTF in e-mail
/ \ =A0 NO Word docs in e-mail


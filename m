From: Detmar  Liesen <mad.eye@gmx.net>
Subject: static NAT and ARP problem
Date: Fri, 13 Jun 2003 08:23:43 +0200 (MEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <13472.1055485423@www20.gmx.net>
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

Hi all,
I am new to the list, so please forgive me if this problem has already been
discussed.
;)

I have installed a vpn-gateway (commercial solution) on linux.

This gateway does not provide NAT, so I have to use netfilter, which I am
quite used to,=20
because I already have set up 3 or so internet firewalls using
netfilter/iptables.

Now the problem is that we are NAT-ing vpn ip addresses (source) to internal
LAN-addresses
that are blocked on our DHCP in order to prevent conflicts.

The netfilter NAT works great - I can see the packets leave the gateway with
the correct=20
source addresses - but of course - our internal machines do not
automatically route the=20
replies to those packets to the gateway, because the packets have internal
addresses.

Instead, the internal machines send out an arp-request in order to retrieve
the MAC address
for the corresponding ip address.

Of course, my vpn-gateway does not respond to those arp-requests because
it's own address is
different from the NAT-source address.

Here is an example of my NAT rules:
iptables -t nat -A POSTROUTING -s a.b.c.d/32 -o eth0 \
           -j SNAT --to-source e.f.g.h
  iptables -t nat -A PREROUTING -s e.f.g.h/32 -i tap0 \
           -j DNAT --to-destination a.b.c.d

where tap0 is the loopback-device for encryption/decryption (bump in the
stack method).

Now I have done some google search and found various ways to solve this:

1. Multihoming (eth0:1, eth0:2, eth0:3 etc)
2. arp -Ds w.x.y.z eth0 pub
3. echo "1" > /proc/sys/net/ipv4/conf/eth0/proxy_arp
4. using iproute2 instead of netfilter/iptables

The first one works, but is not very elegant. Imagine a gateway having 60+
virtual ip addresses (shudder).
And another reason I don't like this is the additional administrative work
for each new ip address.

The second and the third solution didn't work (BTW: I am using SuSE 8.x)

Iproute2 is completely new to me and I'd prefer iptables, because with
iptables I can also edit=20
complex stateful firewall rules - which iproute2 cannot.

Please help me.

Thanks,
Mad Eye

--=20
+++ GMX - Mail, Messaging & more  http://www.gmx.net +++
Bitte l=E4cheln! Fotogalerie online mit GMX ohne eigene Homepage!



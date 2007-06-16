From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ""how can i allow IP protocol 47 "" on iptables to connet a pptp
 VPN server.
Date: Sat, 16 Jun 2007 14:29:13 +0200
Message-ID: <4673D799.30503@plouf.fr.eu.org>
References: <000e01c7b005$cb371be0$1664a8c0@ssplscu22>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000e01c7b005$cb371be0$1664a8c0@ssplscu22>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

rajeev.sekhar a =E9crit :
>=20
> Right now my PPTP VPN server is outside the firewall consuming 2 Static=
=20
> IPaddress,
>=20
> I want to pleace my PPTP VPN server behind firewall.
>=20
> i followed good docs on=20
> http://tldp.org/HOWTO/VPN-Masquerade-HOWTO-5.html , but still cant=20
> understand some words in it.

This document is largely outdated regarding the filtering/NAT rules as=20
it does mention only the old ipfwadm/ipchains for 2.0 and 2.2 kernels.

> I DNATed 1723, and 500 (which is used for control channels on pptp) to=20
> my vpn server behind my firewall.

UDP 500 is used by IPSec. I have never seen it used by PPTP.

> The encrypted data channel in PPTP is carried over GRE, IP protocol 47,=
 =20
> Now how can allow IP protocol 47 from outside , Is this possible? (=20
> pretty new for me)

-p 47

> I am pasting my firewall rules.
[...]
> iptables -A INPUT -s 127.0.0.1 -j ACCEPT
> iptables -A INPUT -s 192.168.1.0/24 -j ACCEPT

IMO, you'd better filter by interface (or by interface AND address)=20
rather than only by address. Filtering only on the source address won't=20
protect from IP spoofing. Also, allowing only 127.0.0.1 may block=20
loopback communications using other addresses in the 127.0.0.0/8 range.

> iptables -A OUTPUT -s 192.168.1.0/24 -j ACCEPT

Not needed, as the OUTPUT policy is ACCEPT.

> iptables -A INPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -p tcp -m state --state RELATED,ESTABLISHED -j ACCE=
PT

Why only TCP ? What about other protocols ? Doing so may break=20
communications, e.g. blocking incoming UDP DNS replies, ICMP error=20
messages, or GRE return traffic.

> iptables -A FORWARD -s 192.168.1.0/24 -j ACCEPT
> #### SNATing VPN server to go out #########################
> iptables -A FORWARD -d 192.168.1.34 -j ACCEPT
> iptables -A POSTROUTING -t nat -s 192.168.1.34 -j SNAT --to-source=20
> 203.129.224.181

Same as above, better use the input and/or output interface.

> ####  DNATing 1723 and 500 port for VPN server ##############
> iptables -A PREROUTING -t nat -p tcp --dport 1723 -i eth1 -d=20
> 203.129.224.181 -j DNAT --to-destination 192.168.1.34:1723
> iptables -A PREROUTING -t nat -p udp --dport 500 -i eth1 -d=20
> 203.129.224.181 -j DNAT --to-destination 192.168.1.34:500

See the above comment about UDP 500 not being used by PPTP.

> I tried to NAT port 41 so that protocol 41 will work ( But as expected=20
> it didnt worked)

*Protocol*, not port. Protocol 41 is used for encapsulating IPv6 over=20
IPv4. GRE is protocol *47*.

> #### DNATing 41 port
> iptables -t nat -A PREROUTING -i eth1 -p 41 -j DNAT --to 192.168.1.34
> iptables -t filter -A FORWARD -i eth1 -p 41 -d 192.168.1.34 -j ACCEPT

"-p 47" should work better. You should also accept GRE traffic from the=20
server to the outside.

> Is it possible to put vpn server befind firewall?
> Is anybody did this before?

I did. It worked fine.

Note : AFAIK the Netfilter conntrack+NAT PPTP helper modules=20
(ip_conntrack_pptp+ip_nat_pptp or nf_conntrack_pptp+nf_nat_pptp on some=20
recent 2.6 kernels) are not required for a masqueraded server.

You may try the following rather simple ruleset (assuming eth0 is the=20
internal interface and eth1 the external interface) with the same=20
default policies :

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# accept established and related traffic
# put these rules first as they will catch most traffic
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

# accept incoming loopback and internal traffic
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i eth0 -s 192.168.1.0/24 -j ACCEPT

# DNAT and accept external new PPTP traffic to the server
iptables -t nat -A PREROUTING -i eth1 -d 203.129.224.181 \
   -p tcp --dport 1723 -j DNAT --to 192.168.1.34
iptables -A FORWARD -i eth1 -d 192.168.1.34 -m state --state NEW \
   -p tcp --dport 1723 -j ACCEPT
iptables -t nat -A PREROUTING -i eth1 -d 203.129.224.181 \
   -p 47 -j DNAT --to 192.168.1.34
iptables -A FORWARD -i eth1 -d 192.168.1.34 -p 47 -j ACCEPT

# accept and SNAT/masquerade new internal traffic to the outside
iptables -A FORWARD -i eth0 -s 192.168.1.0/24 -m state --state NEW \
  -j ACCEPT
iptables -t nat -A POSTROUTING -o eth1 -s 192.168.1.0/24 \
   -j SNAT --to 203.129.224.181


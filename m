From: "rajeev.sekhar" <rajeev.sekhar@sumasoft.net>
Subject: Re: ""how can i allow IP protocol 47 "" on iptables to connet a
	pptp VPN server.
Date: Sat, 16 Jun 2007 19:08:32 +0530
Message-ID: <002601c7b01b$a1e5dc70$1664a8c0@ssplscu22>
References: <000e01c7b005$cb371be0$1664a8c0@ssplscu22>
	<4673D799.30503@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"; reply-type="response"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@lists.netfilter.org

----- Original Message -----=20
From: "Pascal Hambourg" <pascal.mail@plouf.fr.eu.org>
To: <netfilter@lists.netfilter.org>
Sent: Saturday, June 16, 2007 5:59 PM
Subject: Re: ""how can i allow IP protocol 47 "" on iptables to connet a=20
pptp VPN server.


Hello,

rajeev.sekhar a =E9crit :
>
> Right now my PPTP VPN server is outside the firewall consuming 2 Static=20
> IPaddress,
>
> I want to pleace my PPTP VPN server behind firewall.
>
> i followed good docs on http://tldp.org/HOWTO/VPN-Masquerade-HOWTO-5.html=
=20
> , but still cant understand some words in it.

This document is largely outdated regarding the filtering/NAT rules as
it does mention only the old ipfwadm/ipchains for 2.0 and 2.2 kernels.

> I DNATed 1723, and 500 (which is used for control channels on pptp) to my=
=20
> vpn server behind my firewall.

UDP 500 is used by IPSec. I have never seen it used by PPTP.

> The encrypted data channel in PPTP is carried over GRE, IP protocol 47,=20
> Now how can allow IP protocol 47 from outside , Is this possible? ( prett=
y=20
> new for me)

-p 47

> I am pasting my firewall rules.
[...]
> iptables -A INPUT -s 127.0.0.1 -j ACCEPT
> iptables -A INPUT -s 192.168.1.0/24 -j ACCEPT

IMO, you'd better filter by interface (or by interface AND address)
rather than only by address. Filtering only on the source address won't
protect from IP spoofing. Also, allowing only 127.0.0.1 may block
loopback communications using other addresses in the 127.0.0.0/8 range.

> iptables -A OUTPUT -s 192.168.1.0/24 -j ACCEPT

Not needed, as the OUTPUT policy is ACCEPT.

> iptables -A INPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT

Why only TCP ? What about other protocols ? Doing so may break
communications, e.g. blocking incoming UDP DNS replies, ICMP error
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

> I tried to NAT port 41 so that protocol 41 will work ( But as expected it=
=20
> didnt worked)

*Protocol*, not port. Protocol 41 is used for encapsulating IPv6 over
IPv4. GRE is protocol *47*.

> #### DNATing 41 port
> iptables -t nat -A PREROUTING -i eth1 -p 41 -j DNAT --to 192.168.1.34
> iptables -t filter -A FORWARD -i eth1 -p 41 -d 192.168.1.34 -j ACCEPT

"-p 47" should work better. You should also accept GRE traffic from the
server to the outside.

> Is it possible to put vpn server befind firewall?
> Is anybody did this before?

I did. It worked fine.

Note : AFAIK the Netfilter conntrack+NAT PPTP helper modules
(ip_conntrack_pptp+ip_nat_pptp or nf_conntrack_pptp+nf_nat_pptp on some
recent 2.6 kernels) are not required for a masqueraded server.

You may try the following rather simple ruleset (assuming eth0 is the
internal interface and eth1 the external interface) with the same
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


Thanks  Pascal Hambourg,

Thats a lot of tips apart from NATing VPN server.
I am new to iptables, Was not sure with the security related problem with=20
the rules i used.

I will try all the things and let you know.
Its nice when you tired google-ng & trying some combination , & then some=20
one helps to move forward.

Thanks again.........:)

Regards
---------------------------------------------
Rajeev Sekhar
Suma Soft Pvt. Ltd
Jr System Administrator
Ph no :91-020-25425655
cell no :91-9370677989
email:rajeev.sekhar@sumasoft.net



----------------------------------------------
Confidentiality Note: This e-mail message and any attachments to it are
intended only for the named recipients and may contain legally privileged
and/or confidential information. If you are not one of the intended
recipients, please notify the sender and do not duplicate or forward this
e-mail message and immediately delete it from your computer.
----------------------------------------------


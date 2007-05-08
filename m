From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: DNAT and local hosts
Date: Tue, 08 May 2007 10:34:30 +0200
Message-ID: <46403616.60103@plouf.fr.eu.org>
References: <C3FA62B1A90D7440B9B6C7C31895994F03663A32@zadbn02100.vodacom.corp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <C3FA62B1A90D7440B9B6C7C31895994F03663A32@zadbn02100.vodacom.corp>
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

Pieter De Wit a =E9crit :
> =20
> C1 --.
>      |
>      |-FW--- internet
>      |
> C2 --'
>=20
> Ok - for this email, I will give C1 192.168.0.10 and C2 192.168.0.11.
> The Firewall (FW) has two ethernet connections, eth0 and eth1. eth1 is
> used to an adsl modem in bridged mode, which creates ppp0. Lets say for
> this email, ppp0 get 1.2.3.4.
>=20
> Now, all connections are routed out via FW:ppp0 and at NAT'ed. There is
> a rule that allows connections to ppp0 on port 1234 and DNAT's them to
> C1. When C2 makes a connection to 1.2.3.4:1234 it fails with "Connectio=
n
> refused" since there is no "server" listening on the firewall's
> ppp0,port 1234.
>=20
> How can I solve this ? I need FW to DNAT "local/C2" connections back to
> C1.

Here is the FGA (Frequently Given Answer) to your FAQ (Frequently Asked=20
Question).

1) NAT the incoming connections on the LAN interface based on the=20
destination address and port. If ppp0 gets a different address at each=20
PPP session, this rule must be created at the beginning (and deleted at=20
the end) of the PPP session, for instance using the /etc/ppp/ip-up and=20
/etc/ppp/ip-down scripts :

iptables -t nat PREROUTING -i eth0 -d 1.2.3.4 -p tcp --dport 1234 \
   -j DNAT --to-destination 192.168.0.10

2) Allow forwarded traffic from LAN to LAN, if blocked by default :

iptables -A FORWARD -i eth0 -o eth0 -j ACCEPT

3) NAT or MASQUERADE the source address of the redirected connections,=20
so the replies from C1 are routed back to the firewall and can be=20
properly un-DNATed before they reach C2 :

iptables -t nat POSTROUTING -o eth0 -d 192.168.0.10 \
   -p tcp --dport 1234 -j SNAT --to-source <eth0_address>

or :

iptables -t nat POSTROUTING -o eth0 -d 192.168.0.10 \
   -p tcp --dport 1234 -j MASQUERADE

Note that if C2 runs Linux too, an alternative is to create a single=20
DNAT rule on it in order to divert locally generated traffic sent to=20
1.2.3.4:1234 :

iptables -t nat OUTPUT -d 1.2.3.4 -p tcp --dport 1234 \
   -j DNAT --to-destination 192.168.0.10

Note : there is no INPUT chain in the 'nat' table because it is=20
traversed after the routing decision, so it is too late to change the=20
destination.


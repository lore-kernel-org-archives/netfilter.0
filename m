From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: nat no traffic returns
Date: 21 May 2003 21:19:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053544772.1913.28.camel@kermit.spenneberg.de>
References: <5.0.0.25.0.20030521073603.040dfeb0@pop.atz-hosting.nl>
	<5.0.0.25.0.20030521073603.040dfeb0@pop.atz-hosting.nl> 
	<5.0.0.25.0.20030521161513.04adceb0@pop.atz-hosting.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.0.0.25.0.20030521161513.04adceb0@pop.atz-hosting.nl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: "B. van Ouwerkerk" <bvo@atz.nl>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mit, 2003-05-21 um 16.39 schrieb B. van Ouwerkerk:
>=20
> Tried but still no sigar :(
>=20
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source EXT_IP
> iptables -t nat -A POSTROUTING -s 10.0.0.112 -j SNAT --to EXT_IP
> echo "1" > /proc/sys/net/ipv4/ip_forward
> iptables -t nat -A PREROUTING -i eth0 -p tcp -d EXT_IP --dport 3389 -j DN=
AT=20
> --to 10.0.0.112:3389
> iptables -t nat -A PREROUTING -i eth0 -p tcp -d EXT_IP --dport 21 -j DNAT=
=20
> --to 10.0.0.112:21
> iptables -t nat -A PREROUTING -i eth0 -p tcp -d EXT_IP --dport 80 -j DNAT=
=20
> --to 10.0.0.112:80
> iptables -A FORWARD -i eth1 -o eth0 -s 10.0.0.112 -j ACCEPT
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
>=20
You are only allowing packets through the forward chain in the direction
eth1->eth0.
There is no packet allowed in the other direction.
iptables -A FORWARD -i eth0 -o eth1 -d 10.0.0.112 -m multiport --dport
3389,21,80 -m state --state NEW -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                   =20
http://honeynet.spenneberg.org


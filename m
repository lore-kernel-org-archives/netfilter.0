From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: default policy
Date: 25 Aug 2003 10:59:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1061801982.1507.38.camel@kermit>
References: <20030826083534.GA1573@linux.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030826083534.GA1573@linux.local>
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
To: Payal Rathod <payal-iptables@staticky.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Die, 2003-08-26 um 10.35 schrieb Payal Rathod:
> $IPTABLES -P INPUT DROP
> $IPTABLES -P OUTPUT ACCEPT
> $IPTABLES -P FORWARD DROP
>=20
> $IPTABLES -t nat -A POSTROUTING -j MASQUERADE
>=20
> $IPTABLES -A FORWARD -s 125.125.125.0/24 -p tcp -m tcp --dport 21 -j ACCE=
PT
> $IPTABLES -A FORWARD -s 125.125.125.0/24 -p tcp -m tcp --dport 80 -j ACCE=
PT
> $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A FORWARD -p icmp --icmp-type 0 -j ACCEPT
>=20
> When I make FORWARD POLICY as ACCEPT it works, but not when I make it
> to DROP? Is there any bad rule anywhere?
Yes, apply masquerading only to the external interface, like
$IPTABLES -t nat -A POSTROUTING -o eth1 -j MASQUERADE
If 125.125.125.0 is your internal ip-range you should be able to browse
to:
http://217.160.128.61
But since you do not allow any DNS traffic you can't resolve any
hostnames.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org


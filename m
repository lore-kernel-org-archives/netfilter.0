From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: logging and pinging localhost
Date: 08 Aug 2003 08:25:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060323922.1880.3.camel@kermit>
References: <1060278704.3499.8.camel@vimes.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1060278704.3499.8.camel@vimes.localdomain>
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
To: Rob Verduijn <rverduij@dds.nl>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Don, 2003-08-07 um 19.51 schrieb Rob Verduijn:

> the default policy that I set is drop
> $IPTABLES -t filter -P INPUT DROP
> $IPTABLES -t filter -P OUTPUT DROP
> $IPTABLES -t filter -P FORWARD DROP
> $IPTABLES -t nat -P PREROUTING DROP
> $IPTABLES -t nat -P POSTROUTING DROP
> $IPTABLES -t nat -P OUTPUT DROP
> $IPTABLES -t mangle -P PREROUTING DROP
> $IPTABLES -t mangle -P POSTROUTING DROP
> $IPTABLES -t mangle -P INPUT DROP
> $IPTABLES -t mangle -P OUTPUT DROP
> $IPTABLES -t mangle -P FORWARD DROP
Don't do this. The mangle and the nat table are only for mangling and
natting. Please only filter in the filter table. Once you have
understood why some packets traverse the nat table and others do not you
may think about filtering in the nat table, but I would advise against
it.
The above rules are only useful if you do not want any traffic on your
machine, like a panic situation.

>=20
> I also read that the following allows all the localtraffic
> $IPTABLES -A INPUT  -i lo -j ACCEPT
> $IPTABLES -A OUTPUT -o lo -j ACCEPT
>=20
> but why can't I ping localhost?????
Because those packets still pass the nat and the mangle table. You drop
everything there.=20
Remove the DROP rules in the nat and mangle table.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org


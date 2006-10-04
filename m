From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: redirect all HTTP traffic
Date: Wed, 04 Oct 2006 12:30:12 +0200
Message-ID: <45238D34.8040104@plouf.fr.eu.org>
References: <452387A9.3010906@eccotours.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <452387A9.3010906@eccotours.co.za>
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

Brent Clark a =E9crit :
>=20
> Ive been trying to redirect all HTTP traffic to my newly built proxy=20
> (squid).
>=20
> But I cant seem to get it working.

Please elaborate. What's happening exactly ?

> This is what I have
>=20
> $IPT -t nat -A PREROUTING -i eth1 -s 192.168.111.0/24 -p tcp --dport 80=
=20
> -j DNAT --to 192.168.111.9:3128
> $IPT -t nat -A POSTROUTING -o eth1 -s 192.168.111.0/24 -j SNAT --to=20
> 192.168.111.10
>=20
> and
>=20
> $IPT -t filter -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEP=
T
> $IPT -t filter -A FORWARD -i eth1 -o eth1 -p tcp --dport 3128 -m state=20
> --state NEW -j ACCEPT

It seems that the proxy is in the same network as the clients. Does it=20
use the same gateway too ? If so, you need to set a no-DNAT exception in=20
PREROUTING for the proxy source address and a rule in FORWARD to allow=20
NEW packets from the proxy to the outside.


From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: -m limit
Date: Fri, 06 Sep 2002 11:51:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D787ABA.80801@fugmann.dhs.org>
References: <014501c25512$5932a9e0$0101a8c0@osbourn>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?=22Lu=EDs_Fernando_C=2E_Talora=22?= <talora@4networks.com.br>
Cc: "netfilter.org" <netfilter@lists.netfilter.org>

Lu=EDs Fernando C. Talora wrote:
> Fellows,
>=20
> I'd like some help using ntefilter "limit" module.
>=20
> If I put something like the following in a firewall script (to limit tc=
p syn
> packets):
>=20
> # Block tcp syn floods
>      $IPTABLES -A FORWARD -p tcp --syn -m limit --limit 1/s -j ACCEPT
>=20
>         (and then, latter, I put the following)
>=20
> # Access to my web server
>      $IPTABLES -A FORWARD -p tcp -d $MY_WEB_SERVER --dport 80 -j ACCEPT=


This is definatly dot what you want. As it is now, 1 syn packet is=20
acceted per sec, regardless of destination port or address.

>=20
> In this example, will a tcp syn flood be barred by the first line? Is i=
t the
> second line allowing more than 1 packet per second? Do I have to use "-=
m
> limit --limit 1/s" on the second line too (and all lines that allow inc=
oming
> packets)?
No. If you want to limit all syn packets you mist create a new chain.=20
like this:

$IPTABLES -N LIMIT_SYN
$IPTABLES -A LIMIT_SYN -m limit --limit 1/s -j RETURN
$IPTABLES -A LIMIT_SYN -j DROP
$IPTABLES -A FORWARD -p tcp --syn -j LIMIT_SYN

This contrsruction limit syn to one per sec by dropping syns above the=20
limit (Acts like a filter). You then need other rules to actually accept =

the syn packet:

$IPTABLES -A FORWARD -p tcp -d $MY_WEB_SERVER --dport 80 -j ACCEPT

If you only want to limit http requests, you should  use
$IPTABLES -A FORWARD -p tcp -d $MY_WEB_SERVER --dport 80 --syn \
	-m limit --limit 1/s -j ACCEPT

Hope it helps.

--=20
Author of FIAIF
FIAIF Is An Intelligent Firewall
http://fiaif.fugmann.dhs.org



From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: Port-forwarding Perfomance
Date: Wed, 23 Feb 2005 11:56:09 +0100
Message-ID: <1109156169.11713.2.camel@nostromo.bgsecm.com>
References: <421D2F04.8090100@wildcash.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <421D2F04.8090100@wildcash.com>
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
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El mi=C3=A9, 23-02-2005 a las 17:33 -0800, Rudi Starcevic escribi=C3=B3:
> Hi,
>=20
> I have www port-forwarding setup and running OK.
>=20
> However I wonder if they way I have configured it is not the most=20
> optimal for speed and performance.
>=20
> I have a default policy of DROP with a total of about 30 rules.
>=20
> These rules below do my www port-forwarding, can you see if there is a=20
> better way to do this ?
>=20
> # ENABLE FORWARDING / NAT / MASQUERADING
> echo "1" > /proc/sys/net/ipv4/ip_forward
>=20
> # NAT Forwarding Setup
> $IPTABLES --table nat --append POSTROUTING --out-interface $ETH0 -j=20
> MASQUERADE

The only thing I can say about your rules it's that if you
know the firewall IP it's much better to use SNAT than
MASQUERADE, because you gain some speed with it.

> $IPTABLES -A FORWARD -i $ETH1 -j ACCEPT
> $IPTABLES -A FORWARD -i $ETH0 -j ACCEPT
> $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>=20
> # http Port-Forwarding setup
> $IPTABLES -t nat -A PREROUTING -i $ETH0 -p tcp --dport 80 -d $MEDIA1_IP=
=20
> -j DNAT --to $MEDIA1_LO:80

The rule it's OK, I don't know how you can do it better to achieve
more speed.

> Many thanks,
> Kind regards
> Rudi

Regards.

--=20

Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"




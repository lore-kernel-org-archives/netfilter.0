From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: state NEW
Date: 19 Nov 2004 20:16:03 +0100
Message-ID: <1100864139.1922.5.camel@nostromo.bgsecm.com>
References: <D3DD55FDB74AD511BA5100500416368053EB16@ORION>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D3DD55FDB74AD511BA5100500416368053EB16@ORION>
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

El vie, 19 de 11 de 2004 a las 10:31, Jochen Vogel escribi=C3=B3:
> hi,
>=20
> i have the following forwarding rule
>=20
> $IPT -A FORWARD -i $INT -o $EXT -m state --state NEW,ESTABLISHED,RELATE=
D -j
> QUEUE

Here you are sending all this traffic to userspace, I suppose to
snort-inline or similar program. You could use stateless rules because
you are sending everything...

> $IPT -A FORWARD -i $EXT -o $INT -m state --state ESTABLISHED,RELATED   =
  -j
> ACCEPT
>=20

And this rule does nothing, because all the traffic has been sent to
userspace and then accepted or dropped, probably.

> if i send an ACK with hping from INT to EXT it reaches the target syste=
m
>=20
> if i do
>=20
> $IPT -A FORWARD -i $INT -o $EXT -m state --state NEW -j ACCEPTLOG
> $IPT -A FORWARD -i $EXT -o $INT -m state --state ESTABLISHED,RELATED-j
> ACCEPT

Here you are logging and accepting all the new connections and accepting
all the related conections.

>=20
> i can see the following
>=20
> Nov 19 12:05:20 snolin kernel: ACPT IN=3Deth0 OUT=3Dppp0 SRC=3D1.1.1.1 =
DST=3D2.2.2.2
> LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D12368 PROTO=3DTCP SPT=3D2=
618 DPT=3D63
> WINDOW=3D512 RES=3D0x00 ACK URGP=3D0
>=20

So everything it's working as you have configured it.

> did i have a false understanding from NEW or whats wrong
>=20

I don't know what you want to do exactly.

> thx for help
> jo

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



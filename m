From: Jochen Vogel <jvogel@it-sec.de>
Subject: AW: state NEW
Date: Mon, 22 Nov 2004 10:25:14 +0100
Message-ID: <D3DD55FDB74AD511BA5100500416368053EB22@ORION>
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
Content-Type: text/plain; charset="iso-8859-1"
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

in the past i thought the state NEW is the state of the connection viz =
only
SYN packets
and not if i write it to conntrack table.



> -----Urspr=FCngliche Nachricht-----
> Von: Jose Maria Lopez [mailto:jkerouac@bgsec.com]=20
> Gesendet: Freitag, 19. November 2004 20:16
> An: netfilter@lists.netfilter.org
> Betreff: Re: state NEW
>=20
>=20
> El vie, 19 de 11 de 2004 a las 10:31, Jochen Vogel escribi=F3:
> > hi,
> >=20
> > i have the following forwarding rule
> >=20
> > $IPT -A FORWARD -i $INT -o $EXT -m state --state=20
> NEW,ESTABLISHED,RELATED -j
> > QUEUE
>=20
> Here you are sending all this traffic to userspace, I suppose to
> snort-inline or similar program. You could use stateless rules =
because
> you are sending everything...
>=20
> > $IPT -A FORWARD -i $EXT -o $INT -m state --state=20
> ESTABLISHED,RELATED     -j
> > ACCEPT
> >=20
>=20
> And this rule does nothing, because all the traffic has been sent to
> userspace and then accepted or dropped, probably.
>=20
> > if i send an ACK with hping from INT to EXT it reaches the=20
> target system
> >=20
> > if i do
> >=20
> > $IPT -A FORWARD -i $INT -o $EXT -m state --state NEW -j ACCEPTLOG
> > $IPT -A FORWARD -i $EXT -o $INT -m state --state=20
> ESTABLISHED,RELATED-j
> > ACCEPT
>=20
> Here you are logging and accepting all the new connections=20
> and accepting
> all the related conections.
>=20
> >=20
> > i can see the following
> >=20
> > Nov 19 12:05:20 snolin kernel: ACPT IN=3Deth0 OUT=3Dppp0=20
> SRC=3D1.1.1.1 DST=3D2.2.2.2
> > LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D12368 PROTO=3DTCP =
SPT=3D2618 DPT=3D63
> > WINDOW=3D512 RES=3D0x00 ACK URGP=3D0
> >=20
>=20
> So everything it's working as you have configured it.
>=20
> > did i have a false understanding from NEW or whats wrong
> >=20
>=20
> I don't know what you want to do exactly.
>=20
> > thx for help
> > jo
>=20
> --=20
> Jose Maria Lopez Hernandez
> Director Tecnico de bgSEC
> jkerouac@bgsec.com
> bgSEC Seguridad y Consultoria de Sistemas Informaticos
> http://www.bgsec.com
> ESPA=D1A
>=20
> The only people for me are the mad ones -- the ones who are=20
> mad to live,
> mad to talk, mad to be saved, desirous of everything at the same =
time,
> the ones who never yawn or say a commonplace thing, but burn,=20
> burn, burn
> like fabulous yellow Roman candles.
>                 -- Jack Kerouac, "On the Road"
>=20
>=20


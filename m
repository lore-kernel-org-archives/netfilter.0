From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Can't interpret this log entry
Date: 26 Sep 2004 22:34:28 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096228742.7416.36.camel@nostromo.bgsecm.com>
References: <415442FF.1060304@mail.co.gilchrist.fl.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <415442FF.1060304@mail.co.gilchrist.fl.us>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El vie, 24 de 09 de 2004 a las 17:53, Eric Ellis escribi=C3=B3:
> I'm slightly confused about this log entry that I'm seeing pop up in my=
=20
> syslog.
>=20
> The firewall is 200.21.1.254, on a private net.
>=20
> Sep 24 11:57:03 firewall kernel: IN=3Deth0 OUT=3D=20
> MAC=3D00:40:05:3d:51:e9:00:50:3e:ed:28:a0:08:00 SRC=3D200.175.75.101 DS=
T=3D200.2
> 1.1.254 LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D43 ID=3D10814 PROTO=3DICM=
P TYPE=3D3=20
> CODE=3D3 [SRC=3D200.21.1.254 DST=3D200.175.75.101 LEN=3D48 T
> OS=3D0x00 PREC=3D0x00 TTL=3D102 ID=3D2554 DF PROTO=3DTCP INCOMPLETE [8 =
bytes] ]=20
>=20
>=20
> it *almost* looks like my box is sending an ICMP query, and getting a=20
> "port closed" response.  The thing that bothers me about this is that I=
=20
> don't allow ICMP to talk on the box at all, so I shouldn't be sending=20
> ICMP, or if the machine tries to, I should be getting it logged, as I'm=
=20
> logging all of my drops.
>=20
> Confused.

It seems you are getting an ICMP Port Unreachable from the machine
the firewall is trying to connect. It's not a bad idea to let this
kind of traffic to go through your firewall, because if the application
don't get this kind of message it can try again to connect to the
port. It's a kind of response that use to give other firewall when
they don't want your traffic to go through them.
=20
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



From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: 4 NIC cards
Date: 17 Nov 2004 20:14:37 +0100
Message-ID: <1100714973.24948.22.camel@nostromo.bgsecm.com>
References: <20041117100208.92063.qmail@web60402.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041117100208.92063.qmail@web60402.mail.yahoo.com>
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

El mi=C3=A9, 17 de 11 de 2004 a las 11:02, ads nat escribi=C3=B3:
> Hi,
> I have setup a Redhat 9.0 Linux server with 5 NIC=20
> (Intel Motherboard) router.
>=20
> I will be getting bandwidth (256 kbps) from 4 dialup
> supplies all are through dialer installed by ISP. Each
> dialer is assigened to each NIC.
>=20
> I would like to get bandwidth from all 4
> simulteneously so that totally it will make
> (256x4=3D1024 kbps) and want to distribute it to my LAN
> through Ethernet card no. 5.
>=20
> Is it possible to achieve this? and if so please guide
> me to URL OR howto to achieve this.
>=20
> Thanks for support.

Yes, it's possible. Just look at the nexthop option of
the iproute2 "ip" command. It's explained in the lartc
howto (lartc.org).


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



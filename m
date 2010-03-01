From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Subject: AW: module owner does not work
Date: Mon, 1 Mar 2010 18:03:16 +0100
Message-ID: <15785B7E063D464C86DD482FCAE4EBA5D794CFF8DB@XCH11.scidom.de>
References: <15785B7E063D464C86DD482FCAE4EBA5D794CFF8D5@XCH11.scidom.de>
 <56378e321003010306n21050b6dwd01154e0420b666a@mail.gmail.com>
 <4B8BA314.60804@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B8BA314.60804@plouf.fr.eu.org>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

Pascal Hambourg wrote:

> Hello,
>=20
> Richard Horton a =E9crit :
> > On 1 March 2010 09:33, Lentes, Bernd=20
> <bernd.lentes@helmholtz-muenchen.de> wrote:
> >>

> >=20
> > Do pings still work?
>=20
> Probably, as ping runs with suid root. Better try with=20
> something like telnet or netcat (nc).

I tried telnet, and it worked ! Thanks for your answer.

>=20
> >> But uid 1000 is still able e.g. to send emails from the=20
> shell using mail.
> >
> > If you have an MTA locally its probably not going out of the box as=
=20
> > the uid of the process which called mail but as the uid of=20
> the MTA...
>=20
> I agree.
>=20

I also agree.

Bernd
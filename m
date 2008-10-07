From: "Sebastian Seemann" <MisterSeaman@gmx.de>
Subject: Re: Re:
Date: Tue, 07 Oct 2008 11:26:12 +0200
Message-ID: <20081007092612.44400@gmx.net>
References: <S1752389AbYJDKwq/20081004105246Z+121@vger.kernel.org>
 <20081004112000.258830@gmx.net> <48E84D36.20206@riverviewtech.net>
 <j9lge49sifmaovo3en60ss9am36lbi4g76@4ax.com> <20081005084518.61060@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20081005084518.61060@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

  -------- Original-Nachricht -------- > Datum: Sun, 05 Oct 2008 10:45:=
18 +0200 > Von: "Sebastian Seemann" <MisterSeaman@gmx.de> > An: netfilt=
er@vger.kernel.org > Betreff: Re: Re:  > > On Sun, 05 Oct 2008 00:14:30=
 -0500, Grant Taylor
> > >I would be tempted to re-write your rule like this
> > >
> > >    iptables -A INPUT ! -m geoip --src-cc [country] -j ACCEPT
>=20
> > >The difference being that you are moving the negative logic out of=
 an=20
> > >unpredictable failure situation (GeoIP not knowing where the IP is
> from)=20
> > >to a controlled situation (IPTables inverting the result of a matc=
h=20
> > >extension).
> Ah, I see. So simple but so great. Thank you.
In fact, sadly this doesn't seem to work in general. iptables reports=20
"unexpected ! flag before match". This was with iptables 1.4.0. Any=20
other ideas?

Regards,
Sebastian

--=20
Der GMX SmartSurfer hilft bis zu 70% Ihrer Onlinekosten zu sparen!=20
Ideal f=FCr Modem und ISDN: http://www.gmx.net/de/go/smartsurfer

--=20
GMX startet ShortView.de. Hier findest Du Leute mit Deinen Interessen!
Jetzt dabei sein: http://www.shortview.de/wasistshortview.php?mc=3Dsv_e=
xt_mf@gmx

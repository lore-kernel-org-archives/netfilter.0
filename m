From: "Sebastian Seemann" <MisterSeaman@gmx.de>
Subject: Re: Re:
Date: Sun, 05 Oct 2008 10:45:18 +0200
Message-ID: <20081005084518.61060@gmx.net>
References: <S1752389AbYJDKwq/20081004105246Z+121@vger.kernel.org>
 <20081004112000.258830@gmx.net> <48E84D36.20206@riverviewtech.net>
 <j9lge49sifmaovo3en60ss9am36lbi4g76@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <j9lge49sifmaovo3en60ss9am36lbi4g76@4ax.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

> On Sun, 05 Oct 2008 00:14:30 -0500, Grant Taylor
> <gtaylor@riverviewtech.net> wrote:
>=20
> >I don't know for sure what the GeoIP match extension will do if the =
IP=20
> >is not in the database.  I would expect the match to fail.  However =
with=20
> >inverse logic included I'd guess that the failure would turn in to a=
=20
> >success.  But with out testing, this is only a guess.
> >
> >I would be tempted to re-write your rule like this
> >
> >    iptables -A INPUT ! -m geoip --src-cc [country] -j ACCEPT

> >The difference being that you are moving the negative logic out of a=
n=20
> >unpredictable failure situation (GeoIP not knowing where the IP is f=
rom)=20
> >to a controlled situation (IPTables inverting the result of a match=20
> >extension).
Ah, I see. So simple but so great. Thank you.

> >Further, the GeoIP match extension should only return a successful m=
atch=20
> >/if/ the source IP is in said source country.  Rather GeoIP will not=
=20
> >match if the IP is included in the database but not associated with =
said=20
> >country.  Likewise GeoIP should not success on an unknown IP because=
 it=20
> >could not make a match.
Good to know. That is exactly what I was wondering about.

> Looking at the source, geoip is very careful to make sure the IP is=20
> within a particular IP block to return match, so it should=20
> return no match for missing IP.  The maxmind database is sparse, as=20
> not all IPs appear within it.
Maxmind write on their homepage the free database, while containing sub=
nets, is right in 99.3 % of the cases, excluding AOL-users, which alway=
s are reported as US. I think this, if it is true, is sufficient for me=
, as long as unknown users are avoided.

Thanks guys.

Regards,
Sebastian
--=20
Psssst! Schon vom neuen GMX MultiMessenger geh=F6rt? Der kann`s mit all=
en: http://www.gmx.net/de/go/multimessenger

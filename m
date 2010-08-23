From: =?UTF-8?Q?Fran=C3=A7ois_Legal?= <francois.legal@thom.fr.eu.org>
Subject: Re: routing VPN users through transparent Squid using iptables
Date: Mon, 23 Aug 2010 17:28:03 +0200
Message-ID: <46c60f619b001f6df9a65760e1d6b8ba@thom.fr.eu.org>
References: <4C70FE76.1060204@andrewsmail.co.uk>
 <4C714C43.2050203@plouf.fr.eu.org>
 <70df47e691bedf9a4877f68170159563@thom.fr.eu.org>
 <4C723152.5080201@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C723152.5080201@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

That's correct. Maybe Jack should check the counters for that chain to
see whether or not it is matched by some traffic.

On Mon, 23 Aug 2010 10:29:06 +0200, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Fran=C3=A7ois Legal a =C3=A9crit :
>> I think the problem comes from SQUID as it has to be listening on th=
e
>> interface (here ppp+) for transparent proxying to work.
>> If SQUID is started before the pptpd connection comes up, then this =
is
>> not the case.
>=20
> I thought about this kind of issue. But then redirected HTTP connecti=
ons
> would fail.
>=20
>>> Jack Andrews a =C3=A9crit :
>>>>
>>>> But this doesn't seem to work (I'm also hoping ppp+ is the correct
>>>> formatting for a wildcard?).  Http traffic is never redirected and
>>>> bypasses the proxy.
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


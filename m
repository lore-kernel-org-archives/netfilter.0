From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: (Ab)using iptables to record byte count per IP?
Date: Fri, 09 Jan 2009 11:10:08 -0600
Message-ID: <gk80dh$4gs$1@ger.gmane.org>
References: <2d460de70901090327y625afd60g792467e843d3f1d@mail.gmail.com>	 <49673A13.6050807@arturaz.net> <2d460de70901090444v20f514dck8bc7a7740ce84685@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2d460de70901090444v20f514dck8bc7a7740ce84685@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Richard Hartmann wrote:
> On Fri, Jan 9, 2009 at 12:50, Art=C5=ABras =C5=A0lajus <x11@arturaz.n=
et> wrote:
>=20
>> iptables -A ACCOUNTING -s your_user_ip -j ACCEPT
>> iptables -A ACCOUNTING -d your_user_ip -j ACCEPT
>=20
> Doesn't that mean that I am bypassing the rest of the
> firewall rules?

Yes, it would.  Just leave off the "-j ACCEPT" or use "-j RETURN" if
you want to bypass the rest of the ACCOUNTING chain.  There is no
requirement that a rule have a target.  I have a couple of rules
like that in my "mangle" table PREROUTING and POSTROUTING chains,
and they work just fine.

You'll want to use iptables with the "-x" flag when reading the
counters so that you get exact counts and not numbers like "14G".

--=20
Bob Nichols     "NOSPAM" is really part of my email address.
                 Do NOT delete it.


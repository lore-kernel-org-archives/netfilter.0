From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: IP Addresses Changed to Hostnames in IPTables
Date: Mon, 28 Jun 2021 22:56:11 +0200
Message-ID: <5c726171-9e8c-67e3-da2e-5cb3bbb3ef70@thelounge.net>
References: <bda96448-fbd7-0c99-1bff-c3776bdfafff.ref@att.net>
 <bda96448-fbd7-0c99-1bff-c3776bdfafff@att.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <bda96448-fbd7-0c99-1bff-c3776bdfafff@att.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: slow_speed@att.net, netfilter@vger.kernel.org




Am 28.06.21 um 21:57 schrieb slow_speed@att.net:
> I created a ruleset in iptables and it was saved in=20
> /etc/iptables.up.rules as expected.=C2=A0 However, when viewing the file,=
 all=20
> IP addresses had been translated to hostnames.
>=20
> Why would it ever do such a thing, when I had entered them as IP=20
> addresses and they would have to be converted to IP addresses anyway?

show the file

that is normally only the case for "iptables -L" but not at save time

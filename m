From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Untagged Frames
Date: Sat, 18 Jun 2011 11:12:31 +0200
Message-ID: <4DFC6BFF.6070104@plouf.fr.eu.org>
References: <4DFBC1CD.3000205@abpni.co.uk> <4DFC61D0.7030009@plouf.fr.eu.org> <46C13AA90DB8844DAB79680243857F0F0B005A@server1.ABPNI.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <46C13AA90DB8844DAB79680243857F0F0B005A@server1.ABPNI.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

Jonathan Tripathy a =E9crit :
>>
>> Does ebtables have the facility to make sure that any frames enterin=
g a
>> bridge must be untagged (i.e. have no 802.1q tag)?
>=20
> I guess that it can be done by matching the 802.1q ethertype 0x8100.
>=20
> ---------------------------------------------------------------------=
---------
>=20
> So I'm guessing if I only wanted to allow untagged frames going into =
my
> bridge, I could do:
>=20
> ebtables -I FORWARD -p ! 0x8100 -i <IF of port connected to bridge> -=
j
> ACCEPT

=46ORWARD =3D frames going through the bridge, not all frames entering =
it.

> Is that correct? I don't need to use physdev (like I do in iptables) =
or
> anything, do I?

-i in ebtables is the same as --physdev-in in iptables : both are used
to match the bridge port (physical interface). If you want to match the
logical bridge interface, use --logical-in in ebtables or -i in iptable=
s.

PS : You should avoid sending HTML to the mailing list.

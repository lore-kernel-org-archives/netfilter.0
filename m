From: Jesse Molina <jesse@opendreams.net>
Subject: Re: How do we arp for NAT?  Secondary IPs, proxy arp? something else?
Date: Fri, 29 May 2009 01:09:55 -0700
Message-ID: <4A1F9853.9060000@opendreams.net>
References: <4A19235F.4070306@opendreams.net> <4A192D38.90008@redpill-linpro.com> <4A19B5F1.4080000@opendreams.net> <4A1A6178.8080907@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A1A6178.8080907@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org


BAMM!

That's exactly what I was looking for.  I'll have to give that a try an=
d=20
see if the behavior is as expected, but the way you describe it, that's=
=20
exactly what I was looking for.

I'm really surprised that this isn't an issue that has come up before,=20
especially since security is involved.

I am very grateful for your reply.



Pascal Hambourg wrote:
> Hello,
>=20
> Jesse Molina a =E9crit :
>>
>> To restate my question:  What alternative ways are there to make the=
=20
>> GNU/Linux system reply to ARP requests for an IP, without that IP=20
>> being an actual interface on the host, or that interface must not be=
=20
>> used by local services *in any way*, for the reasons of using it via=
=20
>> SNAT/DNAT?
>=20
> ip route add local <address>/<mask> table local dev <interface>
>=20
> This way <address>/<mask> will be considered local by the system whic=
h=20
> will reply to ARP requests for it, actually usable by any local proce=
ss,=20
> but won't appear assigned to <interface> so chances are that no local=
=20
> process will use it unless told explicitly.
> --=20
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
# Jesse Molina
# Mail =3D jesse@opendreams.net
# Page =3D page-jesse@opendreams.net
# Cell =3D 1.602.323.7608
# Web  =3D http://www.opendreams.net/jesse/



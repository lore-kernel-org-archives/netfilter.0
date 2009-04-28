From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Ugly problem with ebtables
Date: Tue, 28 Apr 2009 11:40:38 +0200
Message-ID: <49F6CF16.2060508@plouf.fr.eu.org>
References: <c5f74e0f56607a07b993f7b3e858a659.squirrel@limbo.ari.es>    <49F5B376.2090101@plouf.fr.eu.org> <07d1b2f79cd9ef9765046bb4503bc658.squirrel@limbo.ari.es>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <07d1b2f79cd9ef9765046bb4503bc658.squirrel@limbo.ari.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter List <netfilter@vger.kernel.org>

Juan Antonio a =E9crit :
>=20
>> Couldn't it be an MTU problem in the tunnel ? AFAIK, when TCP transm=
its
>> a message which must be segmented, it sends maximum-size segments
>> without the PUSH flag and a last smaller segment with the PUSH flag =
set
>> containing the remaining data.
>=20
> I know that, really this is the problem. The first segments without t=
he
> PUSH flag dissapear completely in spite of these go out for the tunne=
l .
> The MTU is the first thing that I verified and this is 1500 in both s=
ides.

Did you check that the tunnel can actually handle packets of that size,=
=20
for example by sending pings of various sizes up to 1500 through it ?
Tunnel encapsulation adds overhead, which might create fragmentation or=
=20
other issues.

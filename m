From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: NAT problem with iptables
Date: Sun, 07 Oct 2007 22:32:21 +0200
Message-ID: <47094255.1040101@plouf.fr.eu.org>
References: <4709153B.8060309@may.be> <470932FC.7090801@plouf.fr.eu.org> <47093D17.4010206@may.be>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47093D17.4010206@may.be>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Cliff Stanford a =E9crit :
>=20
> Pascal Hambourg wrote:
>=20
>>A possible explanation may be the following.
>>The remote box sends a continuous stream of UDP packets. The first=20
>>packet was received before the ruleset was installed but after the=20
>>conntrack was loaded, so a conntrack entry was created with no NAT, a=
nd=20
>>does not expire because of the continuous stream.
>=20
> Thank you!  You hit the nail right on the head!
>=20
>>Clear the conntrack table by any means and see what happens.
>=20
> I cleared it with conntrack -F and you were absolutely right.  It's n=
ow
> working as expected.

In order to avoid this, the iptables ruleset must preferably be=20
installed before the network interfaces are UP and some traffic is sent=
=20
or received.

> I knew it had to be my naivety but I couldn't see
> what I was doing wrong.

It has nothing to do with naivety. Your ruleset was correct. I believe=20
this kind of problem requires fair knowledge and understanding of how=20
Netfilter performs connection tracking and its side effects. Fortunatel=
y=20
you provided enough information, which not everyone does all the time.

> Out of interest, I can't seem to find a syntax that conntrack -D like=
s;
> is there a tutorial for it anywhere or any docs better than the man p=
age?

I have never used conntrack and cannot help you on this, sorry.

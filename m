From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: about dettecting different TTL value
Date: Wed, 03 May 2006 10:12:47 +0200
Message-ID: <1146643967.28003.30.camel@anduril.intranet.cartel-securite.net>
References: <1154.202.22.193.97.1146631315.squirrel@202.22.193.97>
	<44583D20.6010703@inxsoft.net>
	<1146634258.4841.19.camel@anduril.intranet.cartel-securite.net>
	<4458454C.9080705@inxsoft.net>
	<1146641546.28003.20.camel@anduril.intranet.cartel-securite.net>
	<445860BB.5030307@inxsoft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <445860BB.5030307@inxsoft.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Kuiper <tkuiper-netfilter@inxsoft.net>
Cc: netfilter@lists.netfilter.org

Le mercredi 03 mai 2006 =E0 15:50 +0800, Thomas Kuiper a =E9crit :
> But they can still use NAT behind a second router right? :-) I think the=20
> whole connection sharing issues for ISP's is that they want to sell a sec=
ond=20
> account to someone else in that house. Its bogus cause one pays (normally=
)=20
> for an agreed link speed (no matter how many computers are behind the rou=
ter=20
> and it will still be the same up/downlink speed to the ISP). Traffic amou=
nt=20
> doesn't concern either as the user should have the right to use the line =
as=20
> much as the contract allows.

Agreed.
As for the technical stuff, see situation 1... ISP do not have a single
little technical solution to achieve that properly outside finding an
effective RFC 3751 implementation.

Soho manufacturers already ship MAC spoofing because ISPs are
restricting their access to one MAC address and there's no easy way to
change it afterward. If ISPs fall into analysing traffic to spot
multiple hosts, they will ship traffic normalization as well, basicly
TTL mangling for instance, or more (see previously mentionnned
technics).

> And how many ISP's are there who promise a certain speed but never delive=
r it...

:) Quality of service...

> Still, to remain netfilter related in this topic, its a security question=
 if=20
> its possible to force without third party software that only one computer=
=20
> uses a link, and the question remains if its possible to do it with=20
> netfilter (I doubt).

The only trick I see is filtering out non default TTL values, basicly
values that differs from mostly 32, 64 or 128 (but not restricted to).


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!


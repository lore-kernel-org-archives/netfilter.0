From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Routing before LOCAL
Date: Sat, 16 May 2009 01:48:15 +0200
Message-ID: <4A0DFF3F.3040102@plouf.fr.eu.org>
References: <87ad04f0905151502l42fb74ebw364992fc7cd31dc0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <87ad04f0905151502l42fb74ebw364992fc7cd31dc0@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Michael Douglass a =E9crit :
>=20
> I want ALL traffic for the ppp interfaces to be routed out to 10.0.0.=
1
> -- EVEN if the traffic is destined for 192.168.0.10 (a LOCAL interfac=
e
> on the same box).
>=20
> My first thought was to use ip rules such as this:
[skip]
> This works for everything that I want EXCEPTtraffic to the local
> interface (192.168.0.10) doesn't hit my 'vpn' routing table because
> the route for it is in the LOCAL routing table which is rule 0 in the
> ip rule list.
>=20
> Is there a "right" way to do what I want to do?

No.

> Further, the "fwmark" doesn't appear to answer my problem because I
> still need a way to check the fwmark in my ip rule list BEFORE the
> local table which is hard coded at 0

Indeed.

=46YI, there exists a "send-to-self(loop)" patch which implements routi=
ng=20
of traffic between local IP addresses externally via ethernet=20
interfaces. See <http://www.ssi.bg/~ja/#loop>.

From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: ever block *outgoing* packets on your firewall?
Date: 15 Jan 2005 23:19:59 +0100
Message-ID: <1105802461.26750.7.camel@nostromo.bgsecm.com>
References: <20050114200228.GA21562@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050114200228.GA21562@spawar.navy.mil>
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
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El vie, 14 de 01 de 2005 a las 21:02, seberino@spawar.navy.mil escribi=C3=
=B3:
> I'm wondering if it is ever necessary to block
> *outgoing* packets at your firewall.
>=20
> As long as you block /incoming/ carefully no hacker
> on the Internet can send spam through a node on
> your network or anything nasty like that right?
>=20
> (I'm wondering for a wifi hotspot if any nastiness
> will happen if I don't block outgoing.  I block
> virtually all incoming except ssh.)
>=20
> CS

You *really* need to block outgoing traffic at your firewall.
Think about spyware, malware and the like. They can be sending
your company data to their owners. And users can use firewall-piercing
and proxies to bypass your network rules if you let them do whatever
they want.

--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"



From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: ever block *outgoing* packets on your firewall?
Date: Sat, 15 Jan 2005 21:12:04 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F0198DD@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

It's also key to stopping many of the code red and sql slammer type =
viruses.  If SQL outgoing ports would have been closed on most firewalls =
that would have slowed it down quickly.

Gary

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jose Maria =
Lopez
Sent: Saturday, January 15, 2005 2:20 PM
To: netfilter@lists.netfilter.org
Subject: Re: ever block *outgoing* packets on your firewall?

El vie, 14 de 01 de 2005 a las 21:02, seberino@spawar.navy.mil =
escribi=F3:
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
ESPA=D1A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"




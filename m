From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: what protocols need UDP instead of just TCP?? DNS, IMAP, SSH,
	etc.?
Date: 26 Jan 2005 14:29:31 +0100
Message-ID: <1106737232.14109.17.camel@nostromo.bgsecm.com>
References: <20050126000550.GB15359@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050126000550.GB15359@spawar.navy.mil>
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

El mi=C3=A9, 26 de 01 de 2005 a las 01:05, seberino@spawar.navy.mil escri=
bi=C3=B3:
> I'm only allowing TCP out of my firewall.
>=20
> What apps/protocls need UDP?
>=20
> DNS, IMAP, SSH, etc.?

DNS needs UDP for sure.

>=20
> I dunno if I need to allow UDP for anything.

Just for DNS if you don't have more protocols like NFS or the
like that use the UDP.

Make a lsof -i and look at the daemons you have and if they
are listening to UDP or TCP ports, or consult the /etc/services
list to know if your services need UDP or not.

> chris

Regards.

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



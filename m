From: Florent AIDE <faide@alphacent.com>
Subject: Re: IPTABLES vs Checkpoint
Date: Thu, 28 Nov 2002 12:23:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211281223.29395.faide@alphacent.com>
References: <96C102324EF9D411A49500306E06C8D102020659@eketsv02.cubis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <96C102324EF9D411A49500306E06C8D102020659@eketsv02.cubis.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: "Reckhard, Tobias" <tobias.reckhard@secunet.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi tobias, hi all,

> in flexibility. The company definitely becomes more dependent on the pe=
rson
> (or people) who know the system. Untrained personnel would probably not=
 be
> able to cope with it or at least its details. You couldn't buy support
> contracts for it.

I wonder how many "untrained personnel" would be able to admin a Firewall=
=20
whatever it is ;) (fw1 or iptables or else).
Yes for sure with the nice GUI provided by FW1 some "untrained personnel"=
=20
could play with rules easily but is that a good solution ?

There also exist good GUIs for iptables: Firewall Builder
http://www.fwbuilder.org/
it support iptables ipchains ipf and pix based firewalls, it also is a=20
management console which enables you to create the rules on an admin mach=
ine=20
and then "compile" them to the target "language" and then place it on the=
=20
target FW machine via a pubkey auth mechanism ...

So I think the real problem is not really with the GUI, maybe the integra=
tion=20
with VPN can be a problem... because yes FreeSwan is not really user=20
Friendly, though it works well for me and my clients (Linux and Win machi=
nes=20
alike).

And I think in many countries you can also find Linux consulting companie=
s=20
which would be likely to offer services around iptables and FreeSwan=20
management and the like. I am not sure it would be difficult to find one,=
 and=20
the price should not be much more than with a Firewall-1 consultant.

I say this because the company I work for offers just that kind of servic=
es in=20
France.

> Cheers,
> Tobias

Cheers,
Florent
http://www.alphacent.com

- --=20
As we enjoy great advantages from inventions of others, we should be glad=
 of=20
an opportunity to serve others by any invention of ours; and this we shou=
ld=20
do freely and generously.
=09--Benjamin Franklin

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE95fyuQe8gCED8yYERAmnmAJ4rfJceWb3+82Csl6B/sfpPynotdgCgm/+U
2ewmUwcJ0C2S6dsEuR+hgqE=3D
=3Dt7EB
-----END PGP SIGNATURE-----



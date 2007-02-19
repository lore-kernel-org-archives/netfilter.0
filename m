From: =?iso-8859-15?Q?Ren=E9?= Pfeiffer <lynx@luchs.at>
Subject: Re: Netfilter rule notation and rule parsers
Date: Mon, 19 Feb 2007 23:54:31 +0100
Message-ID: <20070219225430.GM24517@nightfall.luchs.at>
References: <20070219152509.GL19622@nightfall.luchs.at>
	<45D9FCAC.6090607@yahoo.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IR1Y5IvQhrKgS4e6"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <45D9FCAC.6090607@yahoo.co.uk>
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
To: netfilter@lists.netfilter.org


--IR1Y5IvQhrKgS4e6
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 19, 2007 at 2038 +0100, Franck Joncourt appeared and said:
> Ren=E9 Pfeiffer wrote:
> > I am aware that there are several rule editors out there (such as
> > FWbuilder). I am more interested in a low-level approach having simple
> > rules that can be parsed easily and possibly distributed among multiple
> > firewall systems.
>=20
> I do not think there is another way to work at low level without writing
> rules by yourself. The more you write, the more you understand.

Well, yes, but maybe my mail wasn't written well enough. I agree that
people who really want to learn the capabilities and the internals of
Netfilter should do that by writing scripts. My question was directed at
another scenario - time for an example. I am sysadmin for a couple of
Netfilter firewalls that run smoothly for many years now. Most setups
are fairly static or only changed by sysadmins who know what they are
doing. Some firewalls protect a NATed DMZ with development servers
running on a Xen host. The developers frequently start new servers with
new services (mostly HTTP and HTTPS) on a virtualised server with a
static IP. They need this server for a couple of weeks or months, then
they deactivated it. Maybe they wish to reactivate it after a period of
time just to run some additional tests.

Now the rule you need for this setup are NAT/NAPT translation rules and,
of course, filter rules. The Netfilter machine in question handles this
by virtue of a Bash script that contains a couple of functions. The
problem is that the developers wish to tell the firewall which IP and
port to translate and to allow access to by using a minimal set of
parameters. They don't care for NAT, NAPT, marking packets or policy
routing. They simply wish to switch on a service and switch it off
again. (IMHO this is not the "right" approach to firewalling, but this
is another story.)

So that's the reason I why I asked before writing yet another rule
language and yet another parser.

> This is not my job, and I am far from being an expert, but I should
> say, distibuted rules among multiple systems, is not that simple ; it
> depends on your needs. Can a script for a router be useful for a
> server ? It can be complicated to get a script working on both
> systems.

Yes, the distribution of rules was another use I had in mind, mainly as
a means to copy a working configuration to another firewall machine in
case of deceased hardware. I don't intend to magically "autoparse" rules
between machines that have completely different roles. ;)

Best regards,
Ren=E9.

--=20
  )\._.,--....,'``.      Let GNU/Linux work for you while you take a nap.
 /,   _.. \   _\  (`._ ,. R. Pfeiffer <lynx at luchs.at> + http://web.luchs=
=2Eat/
`._.-(,_..'--(,_..'`-.;.'  - System administration + Consulting + Teaching -
Got mail delivery problems?  http://web.luchs.at/information/blockedmail.php

--IR1Y5IvQhrKgS4e6
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD4DBQFF2iqmeMu5lRpXJ7kRApm7AJjl4E1iWbtFABMJPWBJgjZBEWvsAKCV1KQ2
cK/YhgUB+HC1MSPuCwhTOQ==
=9t3X
-----END PGP SIGNATURE-----

--IR1Y5IvQhrKgS4e6--


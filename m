From: Darren Kirby <bulliver@badcomputer.no-ip.com>
Subject: Re: MAC addresses
Date: Sat, 11 Sep 2004 17:26:47 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409111726.53499.bulliver@badcomputer.no-ip.com>
References: <200409111150.50506.bulliver@badcomputer.no-ip.com>
	<1094941410.3925.20.camel@wolfpack.ljm.dom>
Reply-To: bulliver@badcomputer.no-ip.com
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4494318.KqL2J27Ipq";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094941410.3925.20.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org

--nextPart4494318.KqL2J27Ipq
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

quoth the Jason Opperisano:
> > What I would like to know is
> > could I use this rule to allow ssh connections ONLY from my notebook no
> > matter what its current IP address happens to be, and drop all other
> > connection requests?
>
> yes--as long as "notebook" and "ssh server" are on the same network.

I guess that won't look for what I want then, perhaps I can explain better:=
 I=20
already have ssh access for the notebook from the private interface of the=
=20
server inside the LAN. The server accepts incoming www and smtp connections=
=20
on the public interface, everything else is dropped. What I would like is s=
sh=20
access from the public side, ie, the internet. This is so I could check my=
=20
mail and update my website if I was on the road, from say,  web cafe's or=20
somesuch where the IP address would change frequently.

> keep in mind--nothing prevents "badguy" from configuring his NIC to have
> the same MAC as your "notebook"

Good advice, and point taken.

> if you're worried about security of "ssh server"--disable
> PasswordAuthentication and only allow RSAAuthentication and/or
> PubkeyAuthentication.

I will look into this. I assume however that I would need to keep port 23 o=
pen=20
for everyone on the public side for this to work. I was hoping to drop the=
=20
packets from everyone except my notebook, hence the original question. Is=20
there no way to do this?

Thanks Jason and Frank for taking the time to answer my questions,
=2Dd
=2D-=20
Part of the problem since 1976
http://badcomputer.no-ip.com
Get my public key from=20
http://keyserver.linux.it/pks/lookup?op=3Dindex&search=3Dbulliver
"...the number of UNIX installations has grown to 10, with more expected..."
=2D Dennis Ritchie and Ken Thompson, June 1972=20

--nextPart4494318.KqL2J27Ipq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBQ5fNOrzWcOwL7mwRAvcPAJ9MQ+3NYHIR/bckBXmMmnrO54XLsQCdGlWE
QgQxB3BID+zr2nSecyHH0tg=
=tq+v
-----END PGP SIGNATURE-----

--nextPart4494318.KqL2J27Ipq--


From: Darren Kirby <bulliver@badcomputer.no-ip.com>
Subject: Re: MAC addresses
Date: Sat, 11 Sep 2004 18:14:44 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409111814.53213.bulliver@badcomputer.no-ip.com>
References: <200409111150.50506.bulliver@badcomputer.no-ip.com>
	<200409111726.53499.bulliver@badcomputer.no-ip.com>
	<1094950452.5506.4.camel@wolfpack.ljm.dom>
Reply-To: bulliver@badcomputer.no-ip.com
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1544961.1g3ZubAQMu";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094950452.5506.4.camel@wolfpack.ljm.dom>
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

--nextPart1544961.1g3ZubAQMu
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

quoth the Jason Opperisano:
> On Sat, 2004-09-11 at 20:26, Darren Kirby wrote:
> > I will look into this. I assume however that I would need to keep port =
23
> > open for everyone on the public side for this to work. I was hoping to
> > drop the packets from everyone except my notebook, hence the original
> > question. Is there no way to do this?
>
> if you're looking for a secure way to manage your firewall from the
> internet without allowing "-s 0/0 --dport 22" type access; you probably
> want to setup some sort of VPN access for yourself.
>
> openvpn ( http://openvpn.sourceforge.net/ ) is a very nice option for
> this.
>
> -j

Looks like just the ticket...thanks again,
=2Dd
=2D-=20
Part of the problem since 1976
http://badcomputer.no-ip.com
Get my public key from=20
http://keyserver.linux.it/pks/lookup?op=3Dindex&search=3Dbulliver
"...the number of UNIX installations has grown to 10, with more expected..."
=2D Dennis Ritchie and Ken Thompson, June 1972=20

--nextPart1544961.1g3ZubAQMu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBQ6MNOrzWcOwL7mwRAigGAJ9JnFJUnaDso2W3GWIIhW3Ji8HIPACgnVRo
BWSaFk1n7l22eYDGbn+2YfE=
=VqJT
-----END PGP SIGNATURE-----

--nextPart1544961.1g3ZubAQMu--


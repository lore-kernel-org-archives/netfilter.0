From: Darren Kirby <bulliver@badcomputer.no-ip.com>
Subject: Re: MAC addresses
Date: Sun, 12 Sep 2004 16:09:02 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409121609.08012.bulliver@badcomputer.no-ip.com>
References: <200409111150.50506.bulliver@badcomputer.no-ip.com>
	<1094950452.5506.4.camel@wolfpack.ljm.dom>
	<1094956251.3969.123.camel@grendel>
Reply-To: bulliver@badcomputer.no-ip.com
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2251704.OSaofkRXYW";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094956251.3969.123.camel@grendel>
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

--nextPart2251704.OSaofkRXYW
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

quoth the Chris Brenton:
>
> A VPN is probably overkill as SSH is already a VPN (strong built in
> authentication and encryption. Heck, I'll take Blowfish over 3DES or AES
> for privacy any day of the week :). Two other options come to mind:
>
> 1) Bind SSH to a non-standard port
> Yes someone doing a full port scan can still find it, blah, blah, blah.
> I've been running this for years and have yet to receive a single
> non-authorized connect to the port that has actually performed an SSH
> handshake.
>
> 2) Setup port knocking
> http://www.linuxjournal.com/article.php?sid=3D6811
> I know a few people that have set this up with great success. Sure its
> vulnerable to replay, but since we're talking SSH that's not really a
> problem. Great way to expose ports to only certain users.
>
> So with either option you still want to use public/private keys or
> strong passwords with SSH. They are designed to simply mask the service
> from all the SSH scanning that's running around the Internet.
>
> HTH,
> Chris

Port knocking is some serious black magic. This is very interesting, and se=
ems=20
to be ideal for me, because I only need this access for short periods (1-2=
=20
weeks) a couple times a year.

Thanks very much for the tip,
=2Dd

=2D-=20
Part of the problem since 1976
http://badcomputer.no-ip.com
Get my public key from=20
http://keyserver.linux.it/pks/lookup?op=3Dindex&search=3Dbulliver
"...the number of UNIX installations has grown to 10, with more expected..."
=2D Dennis Ritchie and Ken Thompson, June 1972=20

--nextPart2251704.OSaofkRXYW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBRNcTOrzWcOwL7mwRAiygAJ4grwOpyy9ZYftD6GZeEgBdyZVbqwCfc4bm
aqi8/X2flElr4Ov/kUuTZR8=
=B8Ut
-----END PGP SIGNATURE-----

--nextPart2251704.OSaofkRXYW--


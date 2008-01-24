From: Gustavo Narea <me@gustavonarea.net>
Subject: Re: Port redirection not working
Date: Thu, 24 Jan 2008 16:04:32 +0100
Message-ID: <200801241604.41073.me@gustavonarea.net>
References: <200801241243.43277.me@gustavonarea.net> <1201182594.25760.17.camel@khasse.inl.fr>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2330105.seBGts6CQR";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1201182594.25760.17.camel@khasse.inl.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Eric Leblond <eric@inl.fr>
Cc: netfilter@vger.kernel.org

--nextPart2330105.seBGts6CQR
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello, Eric.

On Thursday 24 January 2008 14:49:54 Eric Leblond wrote:
> > I'm using this line in the attached file:
> > -A PREROUTING -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080
>
> Miss "-t nat" in the line, you need to specify the table to use.

I've changed that line as you suggested, but now I get this error when runn=
ing=20
`iptables-restore < /etc/iptables.config':

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
iptables-restore v1.3.6: Line 7 seems to have a -t table option.

Error occurred at line: 7
Try `iptables-restore -h' or 'iptables-restore --help' for more information.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

It now reads:
=2DA PREROUTING -t nat -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080

Thanks!
=2D-=20
Gustavo Narea.
http://gustavonarea.net/

Get GNU/Linux! http://www.getgnulinux.org/

--nextPart2330105.seBGts6CQR
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHmKkJPPeetaRFqPERAtbFAJ9zNyBvDGkYXLMfnt7IvzE8G8moowCeOx15
wkbfpJIN4JOxk/4+HG9kKeo=
=fRHS
-----END PGP SIGNATURE-----

--nextPart2330105.seBGts6CQR--

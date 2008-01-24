From: Gustavo Narea <me@gustavonarea.net>
Subject: Re: Port redirection not working
Date: Thu, 24 Jan 2008 16:50:29 +0100
Message-ID: <200801241650.38884.me@gustavonarea.net>
References: <200801241243.43277.me@gustavonarea.net> <200801241604.41073.me@gustavonarea.net> <1201188765.25760.40.camel@khasse.inl.fr>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart9106649.Pvj6QCnHEN";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1201188765.25760.40.camel@khasse.inl.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--nextPart9106649.Pvj6QCnHEN
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Eric, thank you very much for your help! It's now working!

Cheers.

On Thursday 24 January 2008 16:32:45 Eric Leblond wrote:
> Hi,
>
> Le jeudi 24 janvier 2008 =C3=A0 16:04 +0100, Gustavo Narea a =C3=A9crit :
> > Hello, Eric.
> >
> > On Thursday 24 January 2008 14:49:54 Eric Leblond wrote:
> > > > I'm using this line in the attached file:
> > > > -A PREROUTING -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080
> > >
> > > Miss "-t nat" in the line, you need to specify the table to use.
> >
> > I've changed that line as you suggested, but now I get this error when
> > running `iptables-restore < /etc/iptables.config':
>
> Hmm sorry, I miss the iptables-restore way to add the rules.
>
> iptables-restore format is not done to be hand edited (although this is
> possible).
>
> In fact, best thing to do is to :
>       * restore a working file
>       * add the NAT rules : iptables -t nat A PREROUTING -p tcp -m tcp
>         --dport 80 -j REDIRECT --to-ports 8080
>       * iptables-save>/etc/iptables.config
>
> Your error was to add the REDIRECT rules in the filter table.
>
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > iptables-restore v1.3.6: Line 7 seems to have a -t table option.
> >
> > Error occurred at line: 7
> > Try `iptables-restore -h' or 'iptables-restore --help' for more
> > information. =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > It now reads:
> > -A PREROUTING -t nat -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 80=
80
> >
> > Thanks!



=2D-=20
Gustavo Narea.
http://gustavonarea.net/

Get GNU/Linux! http://www.getgnulinux.org/

--nextPart9106649.Pvj6QCnHEN
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHmLPOPPeetaRFqPERApBlAKCw2/GxOAG58WdLjLZa/H/uMYOqFACgv6Rk
fTzlGHNr734TFSlOnKL8sF0=
=sn3J
-----END PGP SIGNATURE-----

--nextPart9106649.Pvj6QCnHEN--

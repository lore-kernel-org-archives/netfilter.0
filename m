From: David T-G <davidtg-netfilter@justpickone.org>
Subject: Re: SOLVED : Re: where is libipt_match.so?
Date: Thu, 29 May 2003 06:51:14 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030529105114.GA65109@justpickone.org>
References: <20030529045612.GJ33081@justpickone.org> <09B04A55822EFF4DA48D2E0BB2941D4A0D6D48@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D48@wardrive.citadelcomputer.com.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: NetFilter Users' List <netfilter@lists.netfilter.org>
Cc: George Vieira <georgev@citadelcomputer.com.au>


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

George --

=2E..and then George Vieira said...
%=20
% no no no.. you've forgotten also the --state before mentioning the
% states your checking..

Ahhh...


%=20
%=20
% *george searches his scripts*
%=20
% See.... as below..
% $IPTABLES -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT

Well, this seems to work and not cause any errors, so it's good enough
for me :-)


%=20
% Thanks,


Thank *you*!

:-D
--=20
David T-G                      * There is too much animal courage in=20
(play) davidtg@justpickone.org * society and not sufficient moral courage.
(work) davidtgwork@justpickone.org  -- Mary Baker Eddy, "Science and Health"
http://justpickone.org/davidtg/      Shpx gur Pbzzhavpngvbaf Qrprapl Npg!


--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (FreeBSD)

iD8DBQE+1eYiGb7uCXufRwARAm0LAJ95A/sk6Bed+zpI+ZnC5ERizBz38wCglhlT
6FmuQGNE9b9PSLTAL3p7mX0=
=Mb8g
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--


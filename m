From: David T-G <davidtg-netfilter@justpickone.org>
Subject: Re: where is libipt_match.so?
Date: Thu, 29 May 2003 06:47:13 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030529104713.GL33081@justpickone.org>
References: <20030529034344.GF33081@justpickone.org> <09B04A55822EFF4DA48D2E0BB2941D4A0D6D40@wardrive.citadelcomputer.com.au> <20030529035602.GG33081@justpickone.org> <1054186276.13296.186.camel@raylinux.internal>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gw4vLALk08fVJy3V"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1054186276.13296.186.camel@raylinux.internal>
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
Cc: Ray Leach <raymondl@knowledgefactory.co.za>


--gw4vLALk08fVJy3V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ray, et al --

=2E..and then Ray Leach said...
%=20
% On Thu, 2003-05-29 at 05:56, David T-G wrote:
=2E..
% > What is it?  From where does (er, should) it come?
% >=20
% It's a netfilter module, and it comes from the iptables distribution

The module part I had guessed, but I couldn't find it.


% (also in the 2.4 kernel distro). You get it by compiling and installing
% the iptables distro, or selecting match support in the netfilter kernel
% config section and compiling the kernel.

Ahhh...  So it *was* there before, and I *didn't* botch the typing as I
was tweaking the script!  Very interesting.

1) I originally tried doing the firewall config for this machine via
SuSEfirewall2 before giving up and going directly to iptables.  After
getting things tested, we rebuilt the server from scratch to ensure that
my installation script would work -- and got to this problem.  Would fw2
have added the match module and possible kernel tweaks, or did my client
install a different kernel when he rebuilt this time?

2) What, if anything is the difference between

  iptables -t filter -A INPUT -i EXTT -m match NEW,RELATED,ESTABLISHED -j A=
CCEPT

(the original, which throws the error) and

  iptables -t filter -A INPUT -i EXTT -m state --state NEW,RELATED,ESTABLIS=
HED -j ACCEPT

(the current, which seems to work)?


TIA & HAND

:-D
--=20
David T-G                      * There is too much animal courage in=20
(play) davidtg@justpickone.org * society and not sufficient moral courage.
(work) davidtgwork@justpickone.org  -- Mary Baker Eddy, "Science and Health"
http://justpickone.org/davidtg/      Shpx gur Pbzzhavpngvbaf Qrprapl Npg!


--gw4vLALk08fVJy3V
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (FreeBSD)

iD8DBQE+1eUwGb7uCXufRwARAsiMAKCc7qWHDsZy3DUIw0Sn+nT5x7Rs3wCgtUZZ
qd2f/0BHKnOk0tJI0oWsWv4=
=aNIf
-----END PGP SIGNATURE-----

--gw4vLALk08fVJy3V--


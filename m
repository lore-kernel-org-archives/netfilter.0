From: David T-G <davidtg-netfilter@justpickone.org>
Subject: Re: SuSEfirewall2 and NAT help : i am so lost!
Date: Thu, 15 May 2003 17:18:05 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030515211805.GA53289@justpickone.org>
References: <20030515203925.GA48230@justpickone.org> <Pine.LNX.4.43.0305151347060.1090-100000@pilchuck.reedmedia.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.43.0305151347060.1090-100000@pilchuck.reedmedia.net>
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
Cc: "Jeremy C. Reed" <reed@reedmedia.net>


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Jeremy, et al --

=2E..and then Jeremy C. Reed said...
%=20
% On Thu, 15 May 2003, David T-G wrote:
%=20
% > I am doing some work for a client who has finally switched from SCO UNIX
% > to SCO's version of Linux, which includes SuSEfirewall2 which, AIUI, is=
 a
%=20
% I just read yesterday that SCO is officially not supporting Linux anymore.
% Search for the news via Google :)

Heh.  I'm not particularly worried; it was he who insisted on staying
with SCO, despite my clear illustration that it wasn't effective, and it
was only when his investors noted the cost of SCO licenses versus Linux
licenses and support and how that affected *their* bottom line that he
switched...  Personally I'm a SuSE man for production Linux (good service
contract support in a robust distro), though I like OpenBSD for secure
servers and I've heard good things about Debian but haven't tried it
again in the past few years (that free time thing).  But I'm obviously
just the dumb programmer ;-)


%=20
% > generally poked and prodded everywhere I can, I've come up with many "y=
ou
% > need to turn on NAT" but no pointers to how to do so!
%=20
% Go to the netfilter webpage. Click on Documentation.

OK.


%=20
% Then read the NAT HOWTO for your preferred language. A quick example is at
% http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-4.html

Oooh, perfect.  It actually sounds like I need

  Packet Filtering HOWTO: 'Mixing NAT and Packet Filtering'

but I'll find that -- unless some kind soul points me to it first :-)


%=20
%    Jeremy C. Reed
%    http://bsd.reedmedia.net/


Thanks & HAND

:-D
--=20
David T-G                      * There is too much animal courage in=20
(play) davidtg@justpickone.org * society and not sufficient moral courage.
(work) davidtgwork@justpickone.org  -- Mary Baker Eddy, "Science and Health"
http://justpickone.org/davidtg/      Shpx gur Pbzzhavpngvbaf Qrprapl Npg!


--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (FreeBSD)

iD8DBQE+xAQNGb7uCXufRwARAvNDAKDE4i9pe9NuGg44bTEpQ8luxci6IwCfXcJa
0tEO84xCj2SE0OnwI6Cp0lE=
=PQ2w
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--


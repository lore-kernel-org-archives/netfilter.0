From: David T-G <davidtg-netfilter@justpickone.org>
Subject: SuSEfirewall2 and NAT help : i am so lost!
Date: Thu, 15 May 2003 16:39:26 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030515203925.GA48230@justpickone.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, all --

=46rom reviewing the archives I *believe* I'm in a good place to ask, but I
could be wrong.  Please be gentle in your redirection :-)

I am doing some work for a client who has finally switched from SCO UNIX
to SCO's version of Linux, which includes SuSEfirewall2 which, AIUI, is a
front-end to iptables and/or netfilter (I know I don't know about what
I'm talking!)

In any given location he has a static external interface and a 10.x.y.z
internal interface and would like to do NATting for his internal Windows
machines.  I am trying to write a script to configure and enable
SuSEfirewall2 for this so that he can do a hands-off install on his
literally thousands of clients.

SCO UNIX used ipf and ipnat, and I got those simple rules worked out.
Now I need to do the same thing for iptables and SuSEfirewall2 and I'm
pretty lost.  Maybe I don't even need to worry about that package but to
instead just talk to iptables directly; if that's the case, not only do I
need to work up a different config file but also startup scripts, right?

Recalling that this has to be a hands-off install, I have whipped up a
little script to identify the internal and external interfaces, and then
apply

  cat /etc/sysconfig/SuSEfirewall2.bak.$$ | \
    sed \
      -e "s/FW_DEV_EXT=3D.*/FW_DEV_EXT=3D'$EXT'/" \
      -e "s/FW_DEV_INT=3D.*/FW_DEV_INT=3D'$INT'/" \
      -e "s/FW_QUICKMODE=3D.*/FW_QUICKMODE=3D'yes'/" \
      -e "s/FW_ROUTE=3D.*/FW_ROUTE=3D'yes'/" \
      -e "s/FW_MASQUERADE=3D.*/FW_MASQUERADE=3D'yes'/" \
      -e "s:FW_MASQ_NETS=3D.*:FW_MASQ_NETS=3D'10.0.0.0/8':" \
      -e "s/FW_SERVICES_QUICK_TCP=3D.*/FW_SERVICES_QUICK_TCP=3D'telnet ftp =
ssh www mysql'/" \
      -e "s:FW_TRUSTED_NETS=3D.*:FW_TRUSTED_NETS=3D'10.0.0.0/8':" > \
    /etc/sysconfig/SuSEfirewall2

to set the variables accordingly and then create the rc?.d start and stop
symlinks for the three scripts.

Unfortunately, a client machine on the inside properly pointing to the
internal address as its default gateway cannot get through.  Having read
the example file, asked google for help, read through list archives, and
generally poked and prodded everywhere I can, I've come up with many "you
need to turn on NAT" but no pointers to how to do so!


TIA & HAND

:-D
--=20
David T-G                      * There is too much animal courage in=20
(play) davidtg@justpickone.org * society and not sufficient moral courage.
(work) davidtgwork@justpickone.org  -- Mary Baker Eddy, "Science and Health"
http://justpickone.org/davidtg/      Shpx gur Pbzzhavpngvbaf Qrprapl Npg!


--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (FreeBSD)

iD8DBQE+w/r9Gb7uCXufRwARAmWkAKCS3+OJVpr77AQbJ7gsJeuepmhsxACg2Q7m
dbZwXzUjjWwKy1CY0pkqoNw=
=19Iv
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--


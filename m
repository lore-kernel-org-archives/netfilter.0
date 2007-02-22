From: Alan Ezust <alan.ezust@presinet.com>
Subject: Re: Iptables 1.3.7 and uClibc
Date: Thu, 22 Feb 2007 15:08:26 -0800
Message-ID: <200702221508.29669.alan.ezust@presinet.com>
References: <45DC6B39.8040907@cetrtapot.si>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart8218309.UiN4zJ7fAB";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45DC6B39.8040907@cetrtapot.si>
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

--nextPart8218309.UiN4zJ7fAB
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


I'd recommend uncommenting the

 NO_SHARED_LIBS =3D 1

at the top of the Makefile. That way they will all be built into one binary=
=20
and you won't have to worry about the executable finding things.



On Wednesday 21 February 2007 07:54, hinko.kocevar@cetrtapot.si wrote:
> Hello,
>
> I'm trying to build iptables 1.3.7 with uClibc 0,9,27 for cris
> architecture. I'm having some problems while loading shared ipt
> libraries (when invoking iptables). Build string:
>
> CC=3D"gcc_cris -mlinux -DLINUX -DLINUX_SYSTEM -D_REENTRANT
> -mno-mul-bug-workaround
> -muclibc=3D/home/hinkok/delo/fw/car2_R1-uclibc.gen/stage.uclibc" \
> CROSS=3D"cris-axis-linux-gnu-" \
> CFLAGS=3D"-O2 -pipe -Wall" \
> LDFLAGS=3D"-L/home/hinkok/delo/fw/car2_R1-uclibc.gen/stage.uclibc/lib
> -Wl,-rpath-link,/home/hinkok/delo/fw/car2_R1-uclibc.gen/stage.uclibc/lib"=
 \
> STATIC=3D"" \
> KERNEL_DIR=3D\"/home/hinkok/delo/fw/car2_R1-uclibc.gen/pkg/linux-R2/build=
/ucl
>ibc/\" \
> LIBDIR=3D"/lib" \
> make \
> all
>
>
> I've managed to build iptables with my cross-compile toolchain. On
> target system I can run the iptables binary:
> # iptables --version
> iptables v1.3.7
> # iptables -L
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
>
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
>
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>
> When trying to set som rules I get following error:
>
> # iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> iptables v1.3.7: Couldn't load target '/lib/iptables/libipt_MASQUERADE.so'
>
> Try `iptables -h' or 'iptables --help' for more information.
>
> I've hacked the iptables.c source to get full path displayed when error
> occurs. I can verify that the file /lib/iptables/libipt_MASQUERADE.so
> actually exists on the target rootfs.
>
> What am I missing here?!
>
> PS.: I've tried to statically compile iptables but with no avail -
> iptables failed with:
>
> # iptables
> getsockopt failed strangely: No such file or directory
>
>
> best regards,
> hinko

=2D-=20
Alan Ezust            www.presinet.com
Presinet, inc         alan.ezust@presinet.com
           Victoria, BC, Canada

--nextPart8218309.UiN4zJ7fAB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBF3iJtsJbtw6GURksRAkS0AJ9T591dHIixtr6LPJ4665bh0Tz8SwCfYONl
rAga48XYjHxJX2hEmI6aKvA=
=Ab/y
-----END PGP SIGNATURE-----

--nextPart8218309.UiN4zJ7fAB--


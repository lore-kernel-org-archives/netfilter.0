From: Saravanan Chanemouganandam <schane@osmozis.com>
Subject: Re: iptables - Couldn't load target error
Date: Thu, 20 Dec 2007 14:49:40 +0100
Message-ID: <200712201449.43555.schane@osmozis.com>
References: <200712191221.58597.schane@osmozis.com>
	<200712201003.26454.vda.linux@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <busybox-bounces@busybox.net>
In-Reply-To: <200712201003.26454.vda.linux@googlemail.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://busybox.net/cgi-bin/mailman/listinfo/busybox>,
	<mailto:busybox-request@busybox.net?subject=unsubscribe>
List-Archive: <http://busybox.net/lists/busybox>
List-Post: <mailto:busybox@busybox.net>
List-Help: <mailto:busybox-request@busybox.net?subject=help>
List-Subscribe: <http://busybox.net/cgi-bin/mailman/listinfo/busybox>,
	<mailto:busybox-request@busybox.net?subject=subscribe>
Sender: busybox-bounces@busybox.net
Errors-To: busybox-bounces@busybox.net
Content-Type: text/plain; charset="iso-8859-9"
To: Denys Vlasenko <vda.linux@googlemail.com>
Cc: busybox@busybox.net, netfilter@vger.kernel.org

Hi vda,

I accept your comment and others that it was not a busybox related issue. =


Well, here is my situation.I built a small rootfs for my arm pxa270 target =

board on the host x86 machine using the latest Buildroot. I then downloaded=
 & =

installed iptables(v1.3.8)  using =


make KERNEL_DIR=3D/home/sara/cm-x270/linux-2.6.16 =

CC=3D/home/sara/BuildRoot/buildroot/build_arm/staging_dir/usr/bin/arm-linux=
-gcc =

LD=3D/home/sara/BuildRoot/buildroot/build_arm/staging_dir/usr/bin/arm-linux=
-ld =

BINDIR=3D/home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root/sbin
LIBDIR=3D/home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root/lib

make BINDIR=3D/home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root/=
sbin
LIBDIR=3D/home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root/lib =

install

command install all iptables into the rootfs under =

"/home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root" with all =

iptables and extension supports are built into linux kernel =

"/home/sara/cm-x270/linux-2.6.16" image. =


I then boot my cm-x270 target board using setboot os "console=3DttySA0,3840=
0 =

root=3D/dev/nfs =

nfsroot=3D/home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root =

ip=3D::::cm-x270:eth0".

Now, when I perform MASQUERADE , it couldn't find libipt_MASQUERADE.so but =
it =

is installed in /lib/iptables.

sara:/$ ldconfig -v show /lib , /usr/lib. =

ldconfig: uClibc version
/lib:
        libc.so.0 =3D> libuClibc-0.9.29.so
        libnsl.so.0 =3D> libnsl-0.9.29.so
        libdl.so.0 =3D> libdl-0.9.29.so
        librt.so.0 =3D> librt-0.9.29.so
        libgcc_s.so.1 =3D> libgcc_s.so.1
        libncurses.so.5 =3D> libncurses.so.5.6
        libutil.so.0 =3D> libutil-0.9.29.so
        libcrypt.so.0 =3D> libcrypt-0.9.29.so
        ld-uClibc.so.0 =3D> ld-uClibc-0.9.29.so
        libpthread.so.0 =3D> libpthread-0.9.29.so
        libresolv.so.0 =3D> libresolv-0.9.29.so
        libm.so.0 =3D> libm-0.9.29.so
/usr/lib:
        libstdc++.so.6 =3D> libstdc++.so.6.0.8
        libz.so.1 =3D> libz.so.1.2.3

/lib/iptables is not visible in the system to load the library. =


thanks
Sara



Le Jeudi 20 D=E9cembre 2007 11:03, Denys Vlasenko a =E9crit=A0:
> On Wednesday 19 December 2007 11:21, Saravanan Chanemouganandam wrote:
> > Hi all,
> >
> > I have some problem with iptables (v1.3.8) and extension supports
> > libraries installed to the buildroot's root filesystem (/lib/iptables)
> > running on Xscale pxa270.
> >
> > iptables with MASQUERADE support throws Couldn't load target error. The
> > following strace shows that it tries to open libraries in the /lib and =
in
> > the /usr/lib instead of /lib/iptables.
>
> Last time I built iptables from source it was iptables-1.3.5.
> iptables are not using de-facto standard "configure+make"
> install process, they take make variables instead.
>
> Mine was built with:
>
> # Do NOT point it to non-pristine kernel tree!
> # (seen horrible miscompilation on 32:64 user:kernel x86_64)
> KERNEL_DIR=3D/usr/src/kernel/delay/linux-2.6.17.11.src
>
> make KERNEL_DIR=3D"$KERNEL_DIR" BINDIR=3D... LIBDIR=3D... MANDIR=3D...
>
> I guess you built your iptables with wrong/unset LIBDIR.
>
> People were right pointing out that this is not busybox related question.
> --
> vda

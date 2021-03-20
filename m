From: Frank Wunderlich <frank-w@public-files.de>
Subject: hw flow offload - nft crosscompile
Date: Sat, 20 Mar 2021 18:08:21 +0100
Message-ID: <trinity-69642984-5c45-4c9a-ab31-b7585e0351b9-1616260101092@3c-app-gmx-bs65>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1616260101;
        bh=gkVC3fnYwdFbDzBwi2hv0qsy2Js74RuNkuyVcNcaD8Y=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=E1lbLA/ovS7nPEfloKKOVsrISH7Mr4nktYds5/Tq0apXi1P7FUfr4RwiO/xR2xTQ7
         VL5ubEx16etv6/oZ5TzaP+RuOG25kAiwWtuFazy8j1yNGng99LdcaKtRmKlN6mRyR4
         Ooiw91WtVdOx5y1Hcom5zT295CWprEVJypMMpsHE=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

we want to try out hardware-offloading posted [1]
but we cannot apply offloading flag in nftables ruleset [2]
we found your patch for supporting flag in "normal chain" [3] but not for =
flowtable

as my nft in debian buster is only 0.9.0 i tried to compile newest version=
...

i tried natively and crosscompile, both ended in LD errors on building nft

  CCLD     nft
/usr/lib/gcc-cross/arm-linux-gnueabihf/9/../../../../arm-linux-gnueabihf/b=
in/ld: ./.libs/libnftables.so: undefined reference to `mnl_attr_nest_start=
'
/usr/lib/gcc-cross/arm-linux-gnueabihf/9/../../../../arm-linux-gnueabihf/b=
in/ld: ./.libs/libnftables.so: undefined
/usr/lib/gcc-cross/arm-linux-gnueabihf/9/../../../../arm-linux-gnueabihf/b=
in/ld: ./.libs/libnftables.so: undefined reference to `mnl_socket_close'
/usr/lib/gcc-cross/arm-linux-gnueabihf/9/../../../../arm-linux-gnueabihf/b=
in/ld: ./.libs/libnftables.so: undefined reference to `mnl_attr_type_valid=
'
....

these are my steps on crosscompile:

git clone https://git.netfilter.org/libmnl
git clone git://git.netfilter.org/libnftnl
git clone git://git.netfilter.org/nftables

#build libmnl for armhf
cd libmnl
sh autogen.sh
mkdir install
sh configure --host=3Darm-linux-gnueabihf --prefix=3D$(pwd)/install
make
make install

#build libnftnl
cd ../libnftnl/
sh autogen.sh
mkdir install
./configure --host=3Darm-linux-gnueabihf --prefix=3D$(pwd)/install LIBMNL_=
LIBS=3D../libmnl/install/lib LIBMNL_CFLAGS=3D../libmnl/include/
make
make install

#build nft
cd ../nftables/
sh autogen.sh
BASE=3D"$(pwd)/../"; sh configure --host=3Darm-linux-gnueabihf --prefix=3D=
$(pwd)/install PKG_CONFIG_PATH=3D"$BASE/libnftnl/install/lib/pkgconfig:$BA=
SE/libmnl/install/lib/pkgconfig" LIBMNL_LIBS=3D$BASE/libmnl/install/lib LI=
BMNL_CFLAGS=3D$BASE/libmnl/include/ --with-mini-gmp --without-cli LDFLAGS=
=3D"-L$BASE/libmnl/install/lib -L$BASE/libnftnl/install/lib" --enable-stat=
ic
make

tried to pass lib-dirs with LDFLAGS/LD_LIBRARY_PATH and --libdir but no lu=
ck

is nft usable without libreadline (--without-cli)?

regards Frank

[1] https://patchwork.ozlabs.org/project/netfilter-devel/list/?series=3D23=
3310&archive=3Dboth&state=3D*
[2] https://lwn.net/Articles/804384/
[3] http://git.netfilter.org/nftables/commit/?id=3Dd42bd56cff1a22301703d2b=
9d6d6fc937ea7cfbd


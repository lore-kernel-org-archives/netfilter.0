From: =?ISO-8859-1?Q?G=FCnter_Zimmermann?=
 <guenter@guenter-zimmermann.com>
Subject: Problems during Compilation
Date: Wed, 16 Jun 2004 19:46:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40D08774.5090100@guenter-zimmermann.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

hi all,

i am not able to compile iptables-1.2.10 because of the following error:

command:
make clean && make KERNEL_DIR=3D/usr/src/linux-2.6.5-gre-nomod=20
MANDIR=3D/usr/share/man LIBDIR=3D/usr/local/lib BINDIR=3D/usr/local/bin=20
NO_SHARED_LIBS=3D1


error:
gcc -O2 -Wall -Wunused -I/usr/src/linux-2.6.5-gre-nomod/include=20
-Iinclude/ -DIPTABLES_VERSION=3D\"1.2.10\" =20
-DIPT_LIB_DIR=3D\"/usr/local/lib/iptables\" -rdynamic -o iptables=20
iptables-standalone.c iptables.o libiptc/libiptc.a -ldl -lnsl
/bin/sh: -c: line 1: syntax error near unexpected token `;'
/bin/sh: -c: line 1: `if [ -n "" ]; then  for ext in ; do  echo ".SS=20
$ext (not supported, see Patch-O-Matic)" ; cat=20
extensions/libipt_$ext.man ; done ; fi >>extensions/libipt_matches.man'
make: *** [extensions/libipt_matches.man] Error 2
rm libiptc/libip6tc.o libiptc/libip4tc.o

thx for your help

best regards
G=FCnter Zimmermann





From: "Fabricio Veloso" <fabricio_veloso@yahoo.com.br>
Subject: Now, other error - ip_conntrack_egg
Date: Thu, 14 Nov 2002 11:07:24 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005a01c28be7$294b6b70$0207a8c0@FVeloso>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi list. I need your help...

In compilation (make modules):

gcc -D__KERNEL__ -I/usr/src/linux-2.4.19/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=3D3D2 -march=3D3Di686
-DMODULE -DMODVERSIONS -include
/usr/src/linux-2.4.19/include/linux/modversions.h  -nostdinc -I
/usr/lib/gcc-lib/i386-redhat-linux/2.96/include
-DKBUILD_BASENAME=3D3Dip_conntrack_egg  -c -o ip_conntrack_egg.o
ip_conntrack_egg.c
ip_conntrack_egg.c: In function `help':
ip_conntrack_egg.c:169: warning: passing arg 2 of
`ip_conntrack_expect_related_Rsmp_aed0cb12' from incompatible pointer
type
ip_conntrack_egg.c:169: too few arguments to function
`ip_conntrack_expect_related_Rsmp_aed0cb12'
ip_conntrack_egg.c: In function `init':
ip_conntrack_egg.c:203: structure has no member named `max_expected'
ip_conntrack_egg.c:204: structure has no member named `timeout'
ip_conntrack_egg.c:205: structure has no member named `flags'
ip_conntrack_egg.c:205: `IP_CT_HELPER_F_REUSE_EXPECT' undeclared (first
use in this function)
ip_conntrack_egg.c:205: (Each undeclared identifier is reported only
once
ip_conntrack_egg.c:205: for each function it appears in.)
ip_conntrack_egg.c:206: structure has no member named `me'
ip_conntrack_egg.c:214: structure has no member named `name'
make[2]: *** [ip_conntrack_egg.o] Error 1
make[2]: Leaving directory `/usr/src/linux-2.4.19/net/ipv4/netfilter'
make[1]: *** [_modsubdir_ipv4/netfilter] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.19/net'
make: *** [_mod_net] Error 2


Why occurred this error? What=3DB4s the dependences of ip_conntrack_egg ?

Thanks

Fabr=3DEDcio Veloso=3D20
S=3DE3o Paulo - Brazil

_______________________________________________________________________
Yahoo! GeoCities
Tudo para criar o seu site: ferramentas f=E1ceis de usar, espa=E7o de sobra=
 e acess=F3rios.
http://br.geocities.yahoo.com/


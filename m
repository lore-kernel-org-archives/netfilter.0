From: Patrick McHardy <kaber@trash.net>
Subject: Re: [netfilter-core] linux-2.6.19-ge6243863 build #160 failed
Date: Wed, 06 Dec 2006 09:34:47 +0100
Message-ID: <457680A7.4080803@trash.net>
References: <200612051617.24705.toralf.foerster@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------060901020606030305050002"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200612051617.24705.toralf.foerster@gmx.de>
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
To: =?ISO-8859-15?Q?Toralf_F=F6rster?= <toralf.foerster@gmx.de>
Cc: coreteam@netfilter.org, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------060901020606030305050002
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Toralf F=F6rster wrote:
> Hello,
>=20
> the build with the attached .config failed, make ends with:
> ...
> WARNING: "ip_route_output_key" [net/netfilter/nf_conntrack_h323.ko] und=
efined!
> make[1]: *** [__modpost] Error 1
> make: *** [modules] Error 2
>=20
> Here's the config:
>=20
> # CONFIG_INET is not set

> CONFIG_NF_CONNTRACK=3Dy

Interesting combination :) I assume you used make randconfig and don't
really have a reason for enabling conntrack without INET ..

The easiest fix seems to be to let everything under net/netfilter depend
on INET.


--------------060901020606030305050002
Content-Type: text/plain;
 name="x"
Content-Disposition: inline;
 filename="x"
Content-Transfer-Encoding: quoted-printable

[NETFILTER]: Fix INET=3Dn linking error

Building with INET=3Dn results in

WARNING: "ip_route_output_key" [net/netfilter/nf_conntrack_h323.ko] undef=
ined!

The entire code in net/netfilter is only used for IPv4/IPv6 currently, so
let it depend on INET.

Noticed by Toralf F=F6rster <toralf.foerster@gmx.de>.

Signed-off-by: Patrick McHardy <kaber@trash.net>

---
commit ce95407aa64e1add96db823d0020f68a5941eb9a
tree 44f0eb5164ee3b0029c6da1aa97fd9517bfb2291
parent fe1a4d3f910960f27afaa4e5d10050cf8d2460c6
author Patrick McHardy <kaber@trash.net> Wed, 06 Dec 2006 09:32:05 +0100
committer Patrick McHardy <kaber@trash.net> Wed, 06 Dec 2006 09:32:42 +01=
00

 net/netfilter/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/netfilter/Kconfig b/net/netfilter/Kconfig
index 3a66878..1b853c3 100644
--- a/net/netfilter/Kconfig
+++ b/net/netfilter/Kconfig
@@ -1,5 +1,5 @@
 menu "Core Netfilter Configuration"
-	depends on NET && NETFILTER
+	depends on NET && INET && NETFILTER
=20
 config NETFILTER_NETLINK
        tristate "Netfilter netlink interface"

--------------060901020606030305050002--


From: Kurt Tragant <k.tragant@firemail.de>
Subject: compiling iplimit
Date: Wed, 15 Jan 2003 12:19:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042629562027740@lycos-europe.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_NextPart_Lycos_0277401042629562_ID"
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
To: netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--=_NextPart_Lycos_0277401042629562_ID
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello list,

I tried to compile iplimit into my kernel and failed: I took a 2.4.20 kernel and
selected iplimit in patch-o-matic 20030107. Patch applied correctly. Then I
selected "IP Limit" (make menuconfig) into the kernel (not a module) and
recompiled the kernel. The compilation of kernel stopped with an error.
Compilation as a module ended with the same error:

gcc -D__KERNEL__ -I/usr/src/linux-2.4.20/include -Wall -Wstrict-prototypes
-Wno-trigraphs -O2   -fno-strict-aliasing -fno-common -fomit-frame-pointer -pipe
-mpreferred-stack-boundary=3D2 -march=3Di686 -nostdinc -iwithprefix include
-DKBUILD_BASENAME=3Dipt_iplimit -c -o ipt_iplimit.o ipt_iplimit.c
In file included from ipt_iplimit.c:15:
/usr/src/linux-2.4.20/include/linux/netfilter_ipv4/ip_conntrack_core.h: In
function `ip_conntrack_confirm':
/usr/src/linux-2.4.20/include/linux/netfilter_ipv4/ip_conntrack_core.h:44:
`NF_ACCEPT' undeclared (first use in this function)
/usr/src/linux-2.4.20/include/linux/netfilter_ipv4/ip_conntrack_core.h:44: (Each
undeclared identifier is reported only once
/usr/src/linux-2.4.20/include/linux/netfilter_ipv4/ip_conntrack_core.h:44: for
each function it appears in.)
/usr/src/linux-2.4.20/include/linux/netfilter_ipv4/ip_conntrack_core.h:45:
warning: control reaches end of non-void function
make[3]: *** [ipt_iplimit.o] Fehler 1
make[3]: Verlassen des Verzeichnisses Verzeichnis
=BB/usr/src/linux-2.4.20/net/ipv4/netfilter=AB
make[2]: *** [first_rule] Fehler 2
make[2]: Verlassen des Verzeichnisses Verzeichnis
=BB/usr/src/linux-2.4.20/net/ipv4/netfilter=AB
make[1]: *** [_subdir_ipv4/netfilter] Fehler 2
make[1]: Verlassen des Verzeichnisses Verzeichnis =BB/usr/src/linux-2.4.20/net=AB
make: *** [_dir_net] Fehler 2

For any hints I would be very thankful...

Regards
Kurt Tragant

__________________________________________________________________
Arcor-DSL Flatrate - jetzt kostenlos einsteigen und bis zu 76,18 Euro sparen!
Arcor-DSL gibt es jetzt auch mit bis zu 1500 Mbit/s Downstream! http://www.angebot.arcor.net/cgi-bin/angebot.cgi?key=3Db13e92247022


--=_NextPart_Lycos_0277401042629562_ID--



From: Kurt Tragant <k.tragant@firemail.de>
Subject: compiling iplimit
Date: Mon, 13 Jan 2003 15:42:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042468959022729@lycos-europe.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_NextPart_Lycos_0227291042468959_ID"
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

--=_NextPart_Lycos_0227291042468959_ID
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello list,<BR><BR>I tried to compile iplimit into my kernel and failed: I =
took a 2.4.20 kernel and<BR>selected iplimit in patch-o-matic 20030107. Pat=
ch applied correctly. Then I<BR>selected "IP Limit" (make menuconfig) into =
the kernel (not a module) and<BR>recompiled the kernel. The compilation of =
kernel stopped with an error:<BR><BR>gcc -D__KERNEL__ -I/usr/src/linux-2.4.=
20/include -Wall -Wstrict-prototypes<BR>-Wno-trigraphs -O2 -fno-strict-alia=
sing -fno-common -fomit-frame-pointer -pipe<BR>-mpreferred-stack-boundary=
=3D2 -march=3Di686   -nostdinc -iwithprefix include<BR>-DKBUILD_BASENAME=3D=
ipt_iplimit  -c -o ipt_iplimit.o ipt_iplimit.c<BR>In file included from ipt=
_iplimit.c:15:<BR>/usr/src/linux-2.4.20/include/linux/netfilter_ipv4/ip_con=
ntrack_core.h: In<BR>function `ip_conntrack_confirm':<BR>/usr/src/linux-2.4=
.20/include/linux/netfilter_ipv4/ip_conntrack_core.h:44:<BR>`NF_ACCEPT' und=
eclared (first use in this function)<BR>/usr/src/linux-2.4.20/include/linux=
/netfilter_ipv4/ip_conn
=20
 track_core.h:44: (Each<BR>undeclared identifier is reported only once<BR>/=
usr/src/linux-2.4.20/include/linux/netfilter_ipv4/ip_conntrack_core.h:44: f=
or<BR>each function it appears in.)<BR>/usr/src/linux-2.4.20/include/linux/=
netfilter_ipv4/ip_conntrack_core.h:45:<BR>warning: control reaches end of n=
on-void function<BR>make[3]: *** [ipt_iplimit.o] Fehler 1<BR>make[3]: Verla=
ssen des Verzeichnisses Verzeichnis<BR>=BB/usr/src/linux-2.4.20/net/ipv4/ne=
tfilter=AB<BR>make[2]: *** [first_rule] Fehler 2<BR>make[2]: Verlassen des =
Verzeichnisses Verzeichnis<BR>=BB/usr/src/linux-2.4.20/net/ipv4/netfilter=
=AB<BR>make[1]: *** [_subdir_ipv4/netfilter] Fehler 2<BR>make[1]: Verlassen=
 des Verzeichnisses Verzeichnis =BB/usr/src/linux-2.4.20/net=AB<BR>make: **=
* [_dir_net] Fehler 2<BR><BR>For any hints I would be very thankful...<BR><=
BR>Regards<BR>Kurt Tragant<P>______________________________________________=
________________<br>Arcor-DSL Flatrate - jetzt kostenlos einsteigen und bis=
 zu &euro; 76,18 sparen!
Arcor-DSL gibt es jetzt auch mit bis zu 1500 Mbit/s Downstream! <a href=3D"=
http://www.angebot.arcor.net/cgi-bin/angebot.cgi?key=3Db13e92247022">HIER A=
NSCHAUEN!</a>


--=_NextPart_Lycos_0227291042468959_ID--



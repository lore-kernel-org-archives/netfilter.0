From: vlad <faktroot@mail.ru>
Subject: Problem with connbyte modul
Date: Fri, 15 Oct 2004 08:59:00 +0600
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1349076958.20041015085900@mail.ru>
Reply-To: vlad <faktroot@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="koi8-r"
To: netfilter <netfilter@lists.netfilter.org>

Hello netfilter,

  I have kernel 2.4.27, pom-ng-20041013, iptables-1.3.0-20041013,
  patch-owl for kernel 2.4.27. But when compile modules after
  compilation kernel, I have this litle problem:

gcc -D__KERNEL__ -I/usr/src/linux-2.4.27/include -Wall -Wstrict-prototype=
s -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointe=
r -pipe -mpreferred-stack-boundary=3D2 -march=3Di686 -DMODULE  -nostdinc =
-iwithprefix include -DKBUILD_BASENAME=3Dipt_connbytes  -c -o ipt_connbyt=
es.o ipt_connbytes.c
ipt_connbytes.c: In function `match':
ipt_connbytes.c:28: error: structure has no member named `bytes'
ipt_connbytes.c:28: error: structure has no member named `bytes'
ipt_connbytes.c:30: error: structure has no member named `bytes'
ipt_connbytes.c:30: error: structure has no member named `bytes'
make[2]: *** [ipt_connbytes.o] Error 1
make[2]: Leaving directory `/usr/src/linux-2.4.27/net/ipv4/netfilter'
make[1]: *** [_modsubdir_ipv4/netfilter] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.27/net'
make: *** [_mod_net] Error 2
root@fakt /usr/src/linux# mc

Thanks in advance.

PS. Sorry for my very bed english. :)



--=20
With best wishes,
 vlad                          mailto:faktroot@mail.ru

System/Network Administrator
TV/Video Engineer
ICQ 163227020
----------------------------------------------
=F7=D3=C5 =DA=C1=C2=C1=D7=CE=CF, =D0=CF=CB=C1 =DC=D4=CF =D3=CC=D5=DE=C1=C5=
=D4=D3=D1 =D3 =CB=C5=CD - =D4=CF =C4=D2=D5=C7=C9=CD.=20



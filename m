From: "ying ge" <ying.ge@crc.ca>
Subject: iptable could not compile on linux-2.6.5-1.358???
Date: Fri, 18 Jun 2004 11:33:43 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <011401c45549$a34f18e0$4c225c8e@anik2>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="----=_NextPart_000_0111_01C45528.1C233A20"
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

This is a multi-part message in MIME format...

------=_NextPart_000_0111_01C45528.1C233A20
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dear Mailing list,

I'm trying to install "ip6tables-1.2.10" in my Fedora linux-2.6.5-1.358 com=
puter. However, when I do "make KERNEL_DIR=3D/usr/src/linux-2.6.5-1.358", t=
he following error happens:

[root@mobilenode1 iptables-1.2.10]# make KERNEL_DIR=3D/usr/src/linux-2.6.5-=
1.358
Extensions found: IPv4:recent IPv6:ah IPv6:esp IPv6:frag IPv6:ipv6header IP=
v6:hbh IPv6:dst IPv6:rt

cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.5-1.358/include -Iinclude/ -DIPT=
ABLES_VERSION=3D\"1.2.10\" -fPIC -o extensions/libipt_ah_sh.o -c extensions=
/libipt_ah.c

In file included from /usr/src/linux-2.6.5-1.358/include/linux/netfilter_ip=
v4.h:8,

from /usr/src/linux-2.6.5-1.358/include/linux/netfilter_ipv4/ip_tables.h:25,

from include/libiptc/libiptc.h:6,

from include/iptables.h:5,

from extensions/libipt_ah.c:8:

/usr/src/linux-2.6.5-1.358/include/linux/config.h:6:2: #error including ker=
nel header in userspace; use the glibc headers instead!

make: *** [extensions/libipt_ah_sh.o] Error 1

Is there anyway to solve this problem? Thanks a lot your reply!

Ying Ge
Communications Research Centre Canada | Centre de recherches sur les commun=
ications Canada
3701 Carling Ave. | 3701, avenue Carling
PO Box 11490, Station H | CP 11490, succursale H
Ottawa ON K2H 8S2 | Ottawa (Ontario) K2H 8S2
(613) 998-2819 | ying.ge@crc.ca |=20
Web site / Site web : www.crc.ca
Government of Canada | Gouvernement du Canada
------=_NextPart_000_0111_01C45528.1C233A20--


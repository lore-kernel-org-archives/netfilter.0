From: "Pham Dinh Hieu" <pdhieu@saigontel.com>
Subject: Help Me
Date: Tue, 10 Jun 2003 13:31:28 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008401c32f19$ecaf1190$9b2fa8c0@saigontel.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0081_01C32F54.98E552F0"
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
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_0081_01C32F54.98E552F0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear All,
I want to install iptables-1.2.7a but I have a trouble as compile it.
The system displays the following message=20

[root@fw iptables-1.2.7a]# make KERNEL_DIR=3D/home/test/linux-2.4.17
Making dependencies: please wait...
Extensions found:
cc -O2 -Wall -Wunused -I/home/user/linux-2.4.17/include -Iinclude/ =
-DIPTABLES_VERSION=3D\"1.2.7a\"  -fPIC -o\
extensions/libipt_ah_sh.o -c extensions/libipt_ah.c
ld -shared -o extensions/libipt_ah.so extensions/libipt_ah_sh.o
cc -O2 -Wall -Wunused -I/home/user/linux-2.4.17/include -Iinclude/ =
-DIPTABLES_VERSION=3D\"1.2.7a\"  -fPIC -o\
extensions/libipt_conntrack_sh.o -c extensions/libipt_conntrack.c
In file included from extensions/libipt_conntrack.c:15:
include/linux/netfilter_ipv4/ipt_conntrack.h:28: `IP_CT_DIR_MAX' =
undeclared here (not in a function)
include/linux/netfilter_ipv4/ipt_conntrack.h:29: `IP_CT_DIR_MAX' =
undeclared here (not in a function)
include/linux/netfilter_ipv4/ipt_conntrack.h:29: `IP_CT_DIR_MAX' =
undeclared here (not in a function)
extensions/libipt_conntrack.c: In function `parse_status':
extensions/libipt_conntrack.c:103: `IPS_EXPECTED' undeclared (first use =
in this function)
extensions/libipt_conntrack.c:103: (Each undeclared identifier is =
reported only once
extensions/libipt_conntrack.c:103: for each function it appears in.)
extensions/libipt_conntrack.c:105: `IPS_SEEN_REPLY' undeclared (first =
use in this function)
extensions/libipt_conntrack.c:107: `IPS_ASSURED' undeclared (first use =
in this function)
extensions/libipt_conntrack.c: In function `parse':
extensions/libipt_conntrack.c:202: `IP_CT_DIR_ORIGINAL' undeclared =
(first use in this function)
extensions/libipt_conntrack.c:259: `IP_CT_DIR_REPLY' undeclared (first =
use in this function)
extensions/libipt_conntrack.c: In function `print_status':
extensions/libipt_conntrack.c:364: `IPS_EXPECTED' undeclared (first use =
in this function)
extensions/libipt_conntrack.c:368: `IPS_SEEN_REPLY' undeclared (first =
use in this function)
extensions/libipt_conntrack.c:372: `IPS_ASSURED' undeclared (first use =
in this function)
extensions/libipt_conntrack.c: In function `matchinfo_print':
extensions/libipt_conntrack.c:420: `IP_CT_DIR_ORIGINAL' undeclared =
(first use in this function)
extensions/libipt_conntrack.c:440: `IP_CT_DIR_REPLY' undeclared (first =
use in this function)
make: *** [extensions/libipt_conntrack_sh.o] Error 1


Please help me to install iptables on Redhat Linux 7.3 or 8.0=20
Thanks.

Best Regards

DunHill

------=_NextPart_000_0081_01C32F54.98E552F0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Dear All,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>I want to install iptables-1.2.7a but I =
have a=20
trouble as compile it.</FONT></DIV>
<DIV><FONT color=3D#ff0000>The system displays the following =
message</FONT> </DIV>
<DIV>&nbsp;</DIV>
<DIV>[<A href=3D"mailto:root@fw">root@fw</A> iptables-1.2.7a]# make=20
KERNEL_DIR=3D/home/test/linux-2.4.17<BR>Making dependencies: please=20
wait...<BR>Extensions found:<BR>cc -O2 -Wall -Wunused=20
-I/home/user/linux-2.4.17/include -Iinclude/ =
-DIPTABLES_VERSION=3D\"1.2.7a\"&nbsp;=20
-fPIC -o\<BR>extensions/libipt_ah_sh.o -c extensions/libipt_ah.c<BR>ld =
-shared=20
-o extensions/libipt_ah.so extensions/libipt_ah_sh.o<BR>cc -O2 -Wall =
-Wunused=20
-I/home/user/linux-2.4.17/include -Iinclude/ =
-DIPTABLES_VERSION=3D\"1.2.7a\"&nbsp;=20
-fPIC -o\<BR>extensions/libipt_conntrack_sh.o -c=20
extensions/libipt_conntrack.c<BR>In file included from=20
extensions/libipt_conntrack.c:15:<BR>include/linux/netfilter_ipv4/ipt_con=
ntrack.h:28:=20
`IP_CT_DIR_MAX' undeclared here (not in a=20
function)<BR>include/linux/netfilter_ipv4/ipt_conntrack.h:29: =
`IP_CT_DIR_MAX'=20
undeclared here (not in a=20
function)<BR>include/linux/netfilter_ipv4/ipt_conntrack.h:29: =
`IP_CT_DIR_MAX'=20
undeclared here (not in a function)<BR>extensions/libipt_conntrack.c: In =

function `parse_status':<BR>extensions/libipt_conntrack.c:103: =
`IPS_EXPECTED'=20
undeclared (first use in this =
function)<BR>extensions/libipt_conntrack.c:103:=20
(Each undeclared identifier is reported only=20
once<BR>extensions/libipt_conntrack.c:103: for each function it appears=20
in.)<BR>extensions/libipt_conntrack.c:105: `IPS_SEEN_REPLY' undeclared =
(first=20
use in this function)<BR>extensions/libipt_conntrack.c:107: =
`IPS_ASSURED'=20
undeclared (first use in this =
function)<BR>extensions/libipt_conntrack.c: In=20
function `parse':<BR>extensions/libipt_conntrack.c:202: =
`IP_CT_DIR_ORIGINAL'=20
undeclared (first use in this =
function)<BR>extensions/libipt_conntrack.c:259:=20
`IP_CT_DIR_REPLY' undeclared (first use in this=20
function)<BR>extensions/libipt_conntrack.c: In function=20
`print_status':<BR>extensions/libipt_conntrack.c:364: `IPS_EXPECTED' =
undeclared=20
(first use in this function)<BR>extensions/libipt_conntrack.c:368:=20
`IPS_SEEN_REPLY' undeclared (first use in this=20
function)<BR>extensions/libipt_conntrack.c:372: `IPS_ASSURED' undeclared =
(first=20
use in this function)<BR>extensions/libipt_conntrack.c: In function=20
`matchinfo_print':<BR>extensions/libipt_conntrack.c:420: =
`IP_CT_DIR_ORIGINAL'=20
undeclared (first use in this =
function)<BR>extensions/libipt_conntrack.c:440:=20
`IP_CT_DIR_REPLY' undeclared (first use in this function)<BR>make: ***=20
[extensions/libipt_conntrack_sh.o] Error 1<BR></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Please help me to install iptables on =
Redhat Linux=20
7.3 or 8.0 </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Thanks.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>Best Regards</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial =
size=3D2>DunHill</FONT></DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_0081_01C32F54.98E552F0--




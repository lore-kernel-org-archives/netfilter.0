From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Help Me
Date: Wed, 11 Jun 2003 08:20:15 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6E1D@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C32F9E.77DE5F8A"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Pham Dinh Hieu <pdhieu@saigontel.com>, netfilter@lists.samba.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C32F9E.77DE5F8A
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

My advice:
=20
1. Download a new kernel source (don't use RedHat's source)
2. Place it in /usr/src/linux-2.4.xx  and then use    ln -s =
/usr/src/linux.2.4.xx /usr/src/linux
3. Compile iptables against the new kernel (make clean && make)
=20
It's easier when you have fresh source code and easier when it's time to =
patch other stuff in..

Thanks,

=20
____________________________________________
George Vieira
Citadel Computer Systems Pty Ltd Systems Manager georgev AT =
citadelcomputer DOT com DOT au=20
Citadel Computer Systems Pty Ltd
Phone : +61 2 9955 2644 HelpDesk: +61 2 9955 2698  =
<http://www.citadelcomputer.com.au/> http://www.citadelcomputer.com.au
=20
=20
-----Original Message-----
From: Pham Dinh Hieu [mailto:pdhieu@saigontel.com]
Sent: Tuesday, June 10, 2003 4:31 PM
To: netfilter@lists.samba.org
Subject: Help Me


Dear All,
I want to install iptables-1.2.7a but I have a trouble as compile it.
The system displays the following message=20
=20
[ root@fw iptables-1.2.7a]# make KERNEL_DIR=3D/home/test/linux-2.4.17
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

=20
Please help me to install iptables on Redhat Linux 7.3 or 8.0=20
Thanks.
=20
Best Regards
=20
DunHill

------_=_NextPart_001_01C32F9E.77DE5F8A
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><SPAN class=3D409101822-10062003><FONT face=3DArial color=3D#0000ff =
size=3D2>My=20
advice:</FONT></SPAN></DIV>
<DIV><SPAN class=3D409101822-10062003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D409101822-10062003><FONT face=3DArial color=3D#0000ff =
size=3D2>1.=20
Download a new kernel source (don't use RedHat's =
source)</FONT></SPAN></DIV>
<DIV><SPAN class=3D409101822-10062003><FONT face=3DArial color=3D#0000ff =
size=3D2>2.=20
Place it in /usr/src/linux-2.4.xx&nbsp; and then use&nbsp;&nbsp;&nbsp; =
ln -s=20
/usr/src/linux.2.4.xx /usr/src/linux</FONT></SPAN></DIV>
<DIV><SPAN class=3D409101822-10062003><FONT face=3DArial color=3D#0000ff =
size=3D2>3.=20
Compile iptables against the new kernel (make clean &amp;&amp;=20
make)</FONT></SPAN></DIV>
<DIV><SPAN class=3D409101822-10062003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D409101822-10062003><FONT face=3DArial color=3D#0000ff =
size=3D2>It's=20
easier when you have fresh source code and easier when it's time to =
patch other=20
stuff in..</FONT></SPAN></DIV>
<DIV>
<P><FONT face=3DArial size=3D2><SPAN=20
class=3D674251008-03092002>Thanks,</SPAN></FONT></P></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D674251008-03092002></SPAN></FONT>&nbsp;</DIV>
<DIV style=3D"WIDTH: 305px; HEIGHT: 232px">
<MARQUEE id=3DMarquee1 style=3D"WIDTH: 220px; HEIGHT: 57px" trueSpeed =
scrollAmount=3D1=20
scrollDelay=3D20 direction=3Ddown behavior=3Dslide loop=3D1 =
border=3D"2"><FONT=20
size=3D1>____________________________________________</FONT></MARQUEE><BR=
><B><FONT=20
color=3D#000066 size=3D2></FONT><FONT face=3DVerdana color=3D#000066 =
size=3D2>George=20
Vieira<BR></FONT></B>
<MARQUEE id=3DMarquee2 style=3D"WIDTH: 240px; HEIGHT: 17px" trueSpeed =
scrollAmount=3D1=20
scrollDelay=3D3 behavior=3Dslide loop=3D1 border=3D"0"><FONT=20
face=3D"Verdana, Verdana, Helvetica, sans-serif" color=3Dblack =
size=3D1><B>Citadel=20
Computer Systems Pty Ltd</B></FONT></MARQUEE>
<MARQUEE id=3DMarquee2 style=3D"WIDTH: 240px; HEIGHT: 17px" trueSpeed =
scrollAmount=3D1=20
scrollDelay=3D3 behavior=3Dslide loop=3D1 border=3D"0"><FONT=20
face=3D"Verdana, Verdana, Helvetica, sans-serif" color=3Dblack =
size=3D1><B>Systems=20
Manager</B></FONT></MARQUEE><FONT face=3DVerdana>
<MARQUEE id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 255px; HEIGHT: =
17px"=20
trueSpeed scrollAmount=3D2 scrollDelay=3D5 direction=3Dright =
behavior=3Dslide loop=3D1=20
width=3D300 height=3D16 border=3D"0"><FONT=20
face=3D"Verdana, Verdana, Helvetica, sans-serif" color=3D#000099 =
size=3D1>georgev AT=20
citadelcomputer DOT com DOT au</FONT></MARQUEE>
<MARQUEE id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 220px; HEIGHT: =
17px"=20
trueSpeed scrollAmount=3D1 scrollDelay=3D3 behavior=3Dslide loop=3D1=20
border=3D"0"></MARQUEE></FONT>
<DIV><FONT face=3D"Verdana, Verdana, Helvetica, sans-serif" =
color=3Dblack=20
size=3D1>Citadel Computer Systems Pty Ltd</FONT><FONT =
face=3DVerdana></DIV>
<MARQUEE id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 220px; HEIGHT: =
17px"=20
trueSpeed scrollAmount=3D1 scrollDelay=3D3 direction=3Dright =
behavior=3Dslide loop=3D1=20
border=3D"0"><FONT color=3Dblack size=3D1>Phone : +61 2 9955=20
2644</FONT></MARQUEE></FONT><FONT face=3DVerdana>
<MARQUEE id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 220px; HEIGHT: =
17px"=20
trueSpeed scrollAmount=3D1 scrollDelay=3D3 direction=3Dright =
behavior=3Dslide loop=3D1=20
border=3D"0"><FONT color=3Dblack size=3D1>HelpDesk: +61 2 9955=20
2698</FONT></MARQUEE></FONT>
<MARQUEE id=3DMarquee3 style=3D"FONT-SIZE: 10pt; WIDTH: 220px; HEIGHT: =
17px"=20
trueSpeed scrollAmount=3D4 scrollDelay=3D5 direction=3Dright =
behavior=3Dslide loop=3D1=20
border=3D"0"><A href=3D"http://www.citadelcomputer.com.au/"><FONT=20
face=3D"Verdana, Verdana, Helvetica, sans-serif" color=3D#000099 =
size=3D1><A=20
href=3D"http://www.citadelcomputer.com.au/">http://www.citadelcomputer.co=
m.au</FONT></A></MARQUEE></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
size=3D2>-----Original Message-----<BR><B>From:</B> Pham Dinh Hieu=20
[mailto:pdhieu@saigontel.com]<BR><B>Sent:</B> Tuesday, June 10, 2003 =
4:31=20
PM<BR><B>To:</B> netfilter@lists.samba.org<BR><B>Subject:</B> Help=20
Me<BR><BR></FONT></DIV>
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

------_=_NextPart_001_01C32F9E.77DE5F8A--


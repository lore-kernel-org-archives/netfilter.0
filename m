From: "Thomas Hanson" <klon@nybro.dk>
Subject: is it posible to change the log output of iptables?
Date: Fri, 24 Oct 2003 14:58:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000101c39a2e$948cbb90$31de26c0@r58>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0002_01C39A3F.58158B90"
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

This is a multi-part message in MIME format.

------=_NextPart_000_0002_01C39A3F.58158B90
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,
 
I am logging what our firewall is dropping (with the -j LOG  option), and
the log file is enormous (2+ Gb a day). I was wondering if it is posible to
define what goes into the log.
currently it gives this :
Oct 24 14:46:52 MEGALOMANIA kernel: IN=br0 OUT=br0 PHYSIN=eth1 PHYSOUT=eth0
SRC=192.38.223.82 DST=192.38.103.193 LEN=92 TOS=0x00 PREC=0x00 TTL=128
ID=27977 PROTO=ICMP TYPE=8 CODE=0 ID=512 SEQ=60760
 
But all I am interested in is the time, src, dst and len variables,
everything else is not needed for our logging. Can you adjust this? if so,
how?
 
 
Thanks,
Thomas Hanson

------=_NextPart_000_0002_01C39A3F.58158B90
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2800.1264" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D387445312-24102003>Hi,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D387445312-24102003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D387445312-24102003>I am =
logging what=20
our firewall is dropping (with the -j LOG&nbsp; option), and the log =
file is=20
enormous (2+ Gb&nbsp;a day). I was wondering if it is posible to define =
what=20
goes into the log.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D387445312-24102003>currently it gives=20
this :</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D387445312-24102003>Oct 24 =
14:46:52=20
MEGALOMANIA kernel: IN=3Dbr0 OUT=3Dbr0 PHYSIN=3Deth1 PHYSOUT=3Deth0 =
SRC=3D192.38.223.82=20
DST=3D192.38.103.193 LEN=3D92 TOS=3D0x00 PREC=3D0x00 TTL=3D128 =
ID=3D27977 PROTO=3DICMP TYPE=3D8=20
CODE=3D0 ID=3D512 SEQ=3D60760</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D387445312-24102003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D387445312-24102003>But =
all I am=20
interested in is the time, src, dst and len variables, everything else =
is not=20
needed for our logging. Can you adjust this? if so, =
how?</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D387445312-24102003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D387445312-24102003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D387445312-24102003>Thanks,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D387445312-24102003>Thomas =

Hanson</SPAN></FONT></DIV></BODY></HTML>

------=_NextPart_000_0002_01C39A3F.58158B90--



From: "Enrico Demarin" <enricod@videotron.ca>
Subject: Conntrack PPTP broken in 2.4.22 ?
Date: Mon, 8 Sep 2003 13:24:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c375fb$d3264e90$f901010a@SC2003002>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01C3760C.96B0A530"
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

------=_NextPart_000_0001_01C3760C.96B0A530
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi, 
 
I have tried to use the pptp_conntrack patch from the last patch-o-matic
on Linux kernel 2.4.22 , but with that patch applied, apps using
 
getsockopt SO_ORIGINAL_DST stop working  :
 
the perror i get is : 
 
getsockopt(SO_ORIGINAL_DST): No such file or directory
 
 
I am using iptables 1.2.8.
 
 
Any idea why ?
 
Please CC my email as im not subscribed to the list yet.
 
thanks in advance
Enrico
 
 
 

------=_NextPart_000_0001_01C3760C.96B0A530
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2800.1226" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D343072011-08092003>Hi,=20
</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D343072011-08092003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D343072011-08092003>I have =
tried to use=20
the pptp_conntrack patch from the last patch-o-matic on Linux kernel =
2.4.22 ,=20
but with that patch applied, apps using</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D343072011-08092003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D343072011-08092003>getsockopt=20
SO_ORIGINAL_DST stop&nbsp;working &nbsp;:</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D343072011-08092003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D343072011-08092003>the =
perror i get is=20
: </SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D343072011-08092003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D343072011-08092003>getsockopt(SO_ORIGINAL_DST): No such file or=20
directory</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D343072011-08092003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D343072011-08092003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D343072011-08092003>I am =
using iptables=20
1.2.8.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D343072011-08092003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D343072011-08092003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D343072011-08092003>Any =
idea why=20
?</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D343072011-08092003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D343072011-08092003>Please =
CC my email=20
as im not subscribed to the list yet.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D343072011-08092003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D343072011-08092003>thanks =
in=20
advance</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D343072011-08092003>Enrico</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D343072011-08092003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D343072011-08092003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D343072011-08092003></SPAN></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0001_01C3760C.96B0A530--



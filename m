From: "Jin Gu, Kim" <lilia21@postech.ac.kr>
Subject: execute iptables via web browsers?
Date: Fri, 24 Oct 2003 16:25:55 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310240725.h9O7PuE23633@smtp.postech.ac.kr>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0000_01C39A4B.80D95FA0"
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

------=_NextPart_000_0000_01C39A4B.80D95FA0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all.
 
I made this file to view "nat" rules, but nothing was there. How can I see
the results via web?
 
(SSI setting was done in httpd.conf. Other environmental variables were
shown)
 
----------------------------------------------------------------------------
-------------------------------------
<html>
<head><title> cgi test</title></head>
 
<body>
 
<h1> Server Side Includes TEST </h1>
 
<hr>
<p>
iptables' rule ("nat" table)<p>
<!--#exec cmd="/sbin/iptables -t nat -L"-->
 

</body>
 
</html>
 

 

------=_NextPart_000_0000_01C39A4B.80D95FA0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2800.1264" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D914281907-24102003><FONT size=3D2>Hi =
all.</FONT></SPAN></DIV>
<DIV><SPAN class=3D914281907-24102003><FONT =
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D914281907-24102003><FONT size=3D2>I made this file to =
view "nat"=20
rules, but nothing was there. How can I see the results via=20
web?</FONT></SPAN></DIV>
<DIV><SPAN class=3D914281907-24102003><FONT =
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D914281907-24102003><FONT size=3D2>(SSI setting was =
done in=20
httpd.conf. Other environmental variables were =
shown)</FONT></SPAN></DIV>
<DIV><SPAN class=3D914281907-24102003><FONT =
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D914281907-24102003><FONT=20
size=3D2>----------------------------------------------------------------=
-------------------------------------------------</FONT></SPAN></DIV>
<DIV><SPAN class=3D914281907-24102003><FONT face=3D&#44404;&#47548;=20
size=3D2>&lt;html&gt;<BR>&lt;head&gt;&lt;title&gt; cgi=20
test&lt;/title&gt;&lt;/head&gt;</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D914281907-24102003><FONT face=3D&#44404;&#47548;=20
size=3D2>&lt;body&gt;</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D914281907-24102003><FONT face=3D&#44404;&#47548; =
size=3D2>&lt;h1&gt; Server Side=20
Includes TEST &lt;/h1&gt;</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D914281907-24102003><FONT face=3D&#44404;&#47548;=20
size=3D2>&lt;hr&gt;<BR>&lt;p&gt;<BR>iptables' rule ("nat"=20
table)&lt;p&gt;<BR>&lt;!--#exec cmd=3D"/sbin/iptables -t nat=20
-L"--&gt;</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV><SPAN class=3D914281907-24102003><FONT =
face=3D&#44404;&#47548; size=3D2>
<DIV><BR>&lt;/body&gt;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&lt;/html&gt;</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR></FONT></SPAN>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0000_01C39A4B.80D95FA0--



From: "Nikolai Dahlem" <listuser@epygi.de>
Subject: limit HTTP-GET requests per IP
Date: Fri, 30 Jan 2004 14:00:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DAELKAPIKOFAFFKELNHOGECFCAAA.listuser@epygi.de>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0004_01C3E739.75F357E0"
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

------=_NextPart_000_0004_01C3E739.75F357E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi,

I got a problem. Various people are stupidly trying to mirror my webserver
(wget and the like), which puts heavy load on it, due to the dynamic
generation of pages. Is there a way to specify a limit on requests per
second on an ip basis ?
This is a public server, so a limit rule for each ip would be a bit too much
[2^32 too much ;-)]
One other idea is parsing the http-log an inserting rules dynamically.
Any suggestions on how to solve this ?

regards

Nikolai

------=_NextPart_000_0004_01C3E739.75F357E0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1276" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D056465712-30012004>Hi,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D056465712-30012004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D056465712-30012004>I got =
a problem.=20
Various people are stupidly trying to mirror my webserver (wget and the =
like),=20
which puts heavy load on it, due to the dynamic generation of pages. Is =
there a=20
way to specify a limit on requests per second on an ip basis=20
?</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D056465712-30012004>This =
is a public=20
server, so a limit rule for each ip would be a bit too much [2^32 too =
much=20
;-)]</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D056465712-30012004>One =
other idea is=20
parsing the http-log an inserting rules dynamically.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D056465712-30012004>Any =
suggestions on=20
how to solve this ?</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D056465712-30012004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D056465712-30012004>regards</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D056465712-30012004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D056465712-30012004>Nikolai</SPAN></FONT></DIV></BODY></HTML>

------=_NextPart_000_0004_01C3E739.75F357E0--



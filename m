From: "Paul Harlow" <pharlow@skld.com>
Subject: Allowing FTP and internal but nothing else
Date: Wed, 3 Mar 2004 09:55:04 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4A8849EC2E153F41B6CECD20C81BC63BD11E66@wolfcreek.skld.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C40140.468BF33D"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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

------_=_NextPart_001_01C40140.468BF33D
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am new to IPTables and moderately experienced in Linux in general so
please forgive me if this is a noob question.
=20
I have an FTP server that I would like to filter out all external
traffic except ftp and ftp-data. This same server has an internal
interface that I would like to allow everything on the inside to have
access to. Given what I've read I have come up with this general idea of
what to put into a filter table for now. Please let me know what your
gurus of netfilter think. Thanks!
=20
iptables -I INPUT -i eth0 -j ACCEPT
iptables -I INPUT -i eth1 -d port 21 -j ACCEPT
iptables -I INPUT -i eth1 -d port 20 -j ACCEPT
iptables -I INPUT -i eth1 -j deny
=20
I am assuming this is similar to Cisco access lists in that it will read
along the filter list until a hit is made then take action. Please
correct me if I am wrong.
=20
TIA

------_=_NextPart_001_01C40140.468BF33D
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D365334516-03032004><FONT face=3DArial size=3D2>I am =
new to IPTables=20
and moderately experienced in Linux in general so please forgive me if =
this is a=20
noob question.</FONT></SPAN></DIV>
<DIV><SPAN class=3D365334516-03032004><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D365334516-03032004><FONT face=3DArial size=3D2>I have =
an FTP server=20
that I would like to filter out all external traffic except ftp and =
ftp-data.=20
This same server has an internal interface that I would like to allow =
everything=20
on the inside to have access to. Given what I've read I have come up =
with this=20
general idea of what to put into a filter table for now. Please let me =
know what=20
your gurus of netfilter think. Thanks!</FONT></SPAN></DIV>
<DIV><SPAN class=3D365334516-03032004><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D365334516-03032004><FONT face=3DArial =
size=3D2></FONT></SPAN><FONT=20
face=3DArial size=3D2>iptables -I INPUT -i eth0 -j ACCEPT<BR>iptables -I =
INPUT -i=20
eth1 -d port 21 -j ACCEPT<BR>iptables -I INPUT -i eth1 -d port 20 -j=20
ACCEPT<BR>iptables -I INPUT -i eth1 -j deny</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D365334516-03032004><FONT face=3DArial size=3D2>I am =
assuming this=20
is similar to Cisco access lists in that it will read along the filter =
list=20
until a hit is made then take action. Please correct me if I am=20
wrong.</FONT></SPAN></DIV>
<DIV><SPAN class=3D365334516-03032004><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D365334516-03032004><FONT face=3DArial=20
size=3D2>TIA</FONT></SPAN></DIV></BODY></HTML>

------_=_NextPart_001_01C40140.468BF33D--


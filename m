From: "Jon Pol" <john@pinoylinux.sytes.net>
Subject: patch: ipt_string
Date: Sat, 23 Aug 2003 14:08:05 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <011101c3693c$ec370990$61000a0a@expi>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_010E_01C3697F.F97CBAD0"
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

------=_NextPart_000_010E_01C3697F.F97CBAD0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi List,

I have patched my kernel2.4.20 with patch-o-matic and tried getting =
"string" to work but no success.

- iptables-1.2.8
- patch-o-matic-20030107

patch-o-matic said "ipt-string" is already patched but can't find it in =
module directory (/lib/modules/2.4.20/kernel/net/ipv4/netfilter).

question is, what is the command so I manually patch my kernel with =
string support. I have the files.

-rw-r--r--    1 5500     5100         6560 Mar 19  2002 string.patch
-rw-r--r--    1 5500     5100          214 Oct 11  2000 =
string.patch.config.in
-rw-r--r--    1 5500     5100          296 Oct  4  2000 =
string.patch.configure.help
-rw-r--r--    1 5500     5100          232 Oct 21  2001 =
string.patch.help
-rw-r--r--    1 5500     5100          100 Jan 14  2001 =
string.patch.makefile

Thanks in advance.

--
JP.

------=_NextPart_000_010E_01C3697F.F97CBAD0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2726.2500" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#d6f4fe>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Hi List,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have patched my kernel2.4.20 with =
patch-o-matic=20
and tried getting "string" to work but no success.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>- iptables-1.2.8</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>- patch-o-matic-20030107</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>patch-o-matic said "ipt-string" is =
already patched=20
but can't find it in module directory=20
(/lib/modules/2.4.20/kernel/net/ipv4/netfilter).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>question is, what is the command so I =
manually=20
patch my kernel with string support. I have the files.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>-rw-r--r--&nbsp;&nbsp;&nbsp; 1=20
5500&nbsp;&nbsp;&nbsp;&nbsp;=20
5100&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6560 Mar 19&nbsp; =
2002=20
string.patch<BR>-rw-r--r--&nbsp;&nbsp;&nbsp; 1 =
5500&nbsp;&nbsp;&nbsp;&nbsp;=20
5100&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 214 Oct =
11&nbsp; 2000=20
string.patch.config.in<BR>-rw-r--r--&nbsp;&nbsp;&nbsp; 1=20
5500&nbsp;&nbsp;&nbsp;&nbsp;=20
5100&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 296 Oct&nbsp; =
4&nbsp;=20
2000 string.patch.configure.help<BR>-rw-r--r--&nbsp;&nbsp;&nbsp; 1=20
5500&nbsp;&nbsp;&nbsp;&nbsp;=20
5100&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 232 Oct =
21&nbsp; 2001=20
string.patch.help<BR>-rw-r--r--&nbsp;&nbsp;&nbsp; 1 =
5500&nbsp;&nbsp;&nbsp;&nbsp;=20
5100&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 100 Jan =
14&nbsp; 2001=20
string.patch.makefile<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Thanks in advance.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>JP.</DIV></FONT></BODY></HTML>

------=_NextPart_000_010E_01C3697F.F97CBAD0--



From: "Eric McAfee" <emcafee@ev1.net>
Subject: simple config question
Date: Sat, 27 Mar 2004 20:58:52 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000a01c41470$9dbe3ec0$8a361645@Earthlink.net>
Reply-To: "Eric McAfee" <emcafee@earthlink.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0007_01C4143E.4F1DD6E0"
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

------=_NextPart_000_0007_01C4143E.4F1DD6E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I need to know the iptables command that would restrict all access to my =
server except for my computer's Dreamweaver program and ccbill's access =
to my password file. I know it would be some variation of:
iptables -A INPUT -i ppp0 -p tcp --syn -j DROP
------=_NextPart_000_0007_01C4143E.4F1DD6E0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I need to know the iptables command =
that would=20
restrict all access to my server except for my computer's Dreamweaver =
program=20
and ccbill's access to my password file. I know it would be some =
variation=20
of:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A INPUT -i ppp0 -p tcp --syn =
-j=20
DROP</FONT></DIV></BODY></HTML>

------=_NextPart_000_0007_01C4143E.4F1DD6E0--



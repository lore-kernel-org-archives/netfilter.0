From: "sean" <sean@ms.dnss.org>
Subject: time modules problem
Date: Thu, 16 Oct 2003 14:56:08 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003d01c393b2$9484d1a0$710aa8c0@N>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_003A_01C393F5.A19E1BB0"
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

------=_NextPart_000_003A_01C393F5.A19E1BB0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

i get some problem that cannt del law like
adding success=20
iptables -A FORWARD -p tcp -m time --timestart 08:00 --timestop 16:00 =
--days Mon -j ACCEPT

 delete fail
iptables -D FORWARD -p tcp -m time --timestart 08:00 --timestop 16:00 =
--days Mon -j ACCEPT
iptables: Bad rule (does a matching rule exist in that chain?)

------=_NextPart_000_003A_01C393F5.A19E1BB0
Content-Type: text/html;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dbig5">
<META content=3D"MSHTML 6.00.2800.1264" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT size=3D2>i get some problem that cannt del law =
like</FONT></DIV>
<DIV><FONT size=3D2>adding success </FONT></DIV>
<DIV>iptables -A FORWARD -p tcp -m time --timestart 08:00 --timestop =
16:00=20
--days Mon -j ACCEPT</DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>&nbsp;delete fail</FONT></DIV>
<DIV>
<DIV>iptables -D FORWARD -p tcp -m time --timestart 08:00 --timestop =
16:00=20
--days Mon -j ACCEPT</DIV>
<DIV><FONT size=3D2>iptables: Bad rule (does a matching rule exist in =
that=20
chain?)<BR></FONT></DIV></DIV></BODY></HTML>

------=_NextPart_000_003A_01C393F5.A19E1BB0--




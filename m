From: "Pavel V. Chjen" <pavel@urbannet.ru>
Subject: Re:Question about -m tos option
Date: Mon, 13 Oct 2003 16:14:50 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c39183$9a3fed90$2d0410d4@urbannet6ku735>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0005_01C391A5.21239FC0"
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

------=_NextPart_000_0005_01C391A5.21239FC0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

0x60 is out of valid range in dscp matching (:
[root@root linux]# iptables -A FORWARD -m dscp --dscp 0x60
iptables v1.2.9rc1: DSCP `96` out of range


------=_NextPart_000_0005_01C391A5.21239FC0
Content-Type: text/html;
	charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dkoi8-r">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>0x60 is out of valid range in dscp =
matching=20
(:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>[root@root linux]# iptables -A FORWARD =
-m dscp=20
--dscp 0x60<BR>iptables v1.2.9rc1: DSCP `96` out of=20
range<BR></FONT></DIV></BODY></HTML>

------=_NextPart_000_0005_01C391A5.21239FC0--



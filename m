From: "Syed Faisal Gillani" <faisal@clickonlinenetworks.com>
Subject: deleting specific rule ...
Date: Sat, 12 Jun 2004 01:13:26 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001001c44ff0$8ec113a0$0300000a@serverxx>
References: <20040611160047.73593.qmail@web50210.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000D_01C4501A.76D50420"
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

------=_NextPart_000_000D_01C4501A.76D50420
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

here is the list of rule in my iptables=20

-------------------------------------------------------------------------=
-------

Chain INPUT (policy ACCEPT)
target     prot opt source               destination
DROP       all  --  anywhere             anywhere           MAC =
00:A0:C9:A0:B8:A5
DROP       all  --  anywhere             anywhere           MAC =
00:10:A4:9F:B5:27
DROP       all  --  anywhere             anywhere           MAC =
00:C0:26:78:04:D2

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination



-------------------------------------------------------------------------=
-------

now i want to delete this rule ..

DROP       all  --  anywhere             anywhere           MAC =
00:A0:C9:A0:B8:A5

wat will be the command in doing so ?

thanks
Faisal

------=_NextPart_000_000D_01C4501A.76D50420
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.3790.118" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>here is the list of rule in my iptables =

</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>
<HR>
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Chain INPUT (policy=20
ACCEPT)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination<BR>DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; =
--&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAC =

00:A0:C9:A0:B8:A5<BR>DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; =
--&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAC =

00:10:A4:9F:B5:27<BR>DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; =
--&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAC =

00:C0:26:78:04:D2</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Chain FORWARD (policy=20
ACCEPT)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Chain OUTPUT (policy=20
ACCEPT)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV><FONT face=3DArial =
size=3D2>
<DIV>
<HR>
</DIV>
<DIV>now i want to delete this rule ..</DIV>
<DIV>&nbsp;</DIV>
<DIV>DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAC =

00:A0:C9:A0:B8:A5<BR></DIV>
<DIV>wat will be the command in doing so ?</DIV>
<DIV>&nbsp;</DIV>
<DIV>thanks</DIV>
<DIV>Faisal</DIV></FONT>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_000D_01C4501A.76D50420--



From: "Juliano Dapper" <juliano@dualcon.com.br>
Subject: Failed to patch tcp-window-tracking.patch...
Date: Wed, 16 Oct 2002 19:04:24 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000a01c2755f$fd1749e0$2200a8c0@dualcon.com.br>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0007_01C27546.D79F5860"
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

------=_NextPart_000_0007_01C27546.D79F5860
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I trying apply tcp-window-tracking in kernel 2.4.19......

[root@test]# ls -al /usr/src/linux
lrwxrwxrwx    1 root     root           13 Out  4 11:03 /usr/src/linux =
-> linux-2.4.19/

Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] y
Testing patch extra/tcp-window-tracking.patch...
   Placed new Makefile line
Failed to patch copy of /usr/src/linux
TEST FAILED: patch NOT applied.

I testing with patch-o-matic-20020825 and patch-o-matic-20021015.


------=_NextPart_000_0007_01C27546.D79F5860
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
<DIV><FONT face=3DArial size=3D2>Hello,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I trying apply tcp-window-tracking in =
kernel=20
2.4.19......</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>[root@test]# ls -al=20
/usr/src/linux<BR>lrwxrwxrwx&nbsp;&nbsp;&nbsp; 1 =
root&nbsp;&nbsp;&nbsp;&nbsp;=20
root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13 =
Out&nbsp; 4=20
11:03 /usr/src/linux -&gt; linux-2.4.19/</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Do you want to apply this patch=20
[N/y/t/f/a/r/b/w/v/q/?] y<BR>Testing patch=20
extra/tcp-window-tracking.patch...<BR>&nbsp;&nbsp; Placed new Makefile=20
line<BR>Failed to patch copy of /usr/src/linux<BR>TEST FAILED: patch NOT =

applied.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I testing with patch-o-matic-20020825 =
and=20
patch-o-matic-20021015.</DIV>
<DIV><BR></DIV></FONT></BODY></HTML>

------=_NextPart_000_0007_01C27546.D79F5860--



From: "Jeroen Wortelboer" <jeroen@carotechnology.com>
Subject: problems filtering ppp devices
Date: Mon, 9 Sep 2002 11:40:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004d01c257e4$eceb7890$0401a8c0@titanium>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_004A_01C257F5.B061F910"
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

------=_NextPart_000_004A_01C257F5.B061F910
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi there,

I am encountering some weird stuff while filtering a ppp device.
It seems like traffic from the ppp device does not enter the INPUT or =
OUTPUT table.  Only when the destination of the traffic is another =
interface on the same machne does the INPUT or OUTPUT table see the =
traffic (i am logging all traffic through the ppp device. . .).=20
Filtering this fraffic on the forward of nat tables works fine, but =
leaves me with an unhappy feeling...

I did some google-ing for this problem and came up empty. I hope I am =
doing something wrong here because otherwise this could be a serious =
problem.=20
Perhaps someone on this list can help me out why the ppp-traffic seems =
to skip these tables....

For the record, i am running kernel 2.4.9-34 (RedHat) with pptpd-1.1.2-2 =
and ppp-mppe-2.4.1-6. The ppp devices are started bij the pptpd process.

Any suggestions are welcome.

Thanks,
Jeroen.

------=_NextPart_000_004A_01C257F5.B061F910
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4807.2300" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi there,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am encountering some weird stuff =
while filtering=20
a ppp device.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>It seems like traffic from the&nbsp;ppp =
device does=20
not enter the INPUT or OUTPUT table. &nbsp;Only when the destination of =
the=20
traffic is another interface on the same machne does the INPUT or OUTPUT =
table=20
see the traffic (i am logging all traffic through the ppp device. . .).=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Filtering this fraffic on the forward =
of nat tables=20
works fine, but leaves me with an unhappy feeling...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I did some google-ing for this problem =
and came up=20
empty. I hope I am doing something wrong here because otherwise this =
could be a=20
serious problem. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Perhaps someone on this list can help =
me out why=20
the ppp-traffic seems to skip these tables....</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>For the record, i am running kernel =
2.4.9-34=20
(RedHat) with pptpd-1.1.2-2 and ppp-mppe-2.4.1-6. The ppp devices are =
started=20
bij the pptpd process.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Any suggestions are =
welcome.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Jeroen.</FONT></DIV></BODY></HTML>

------=_NextPart_000_004A_01C257F5.B061F910--



From: "Kotatsu" <naughtydog@virgilio.it>
Subject: Resend TCP segment modified to the sender
Date: Tue, 1 Jun 2004 20:39:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001c01c44807$cf56a6f0$5790b450@bebop>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0019_01C44818.922CA1B0"
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

------=_NextPart_000_0019_01C44818.922CA1B0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi guys,
    I have a problem. I have a client (192.168.9.2) that send TCP =
segment to a server (192.168.11.2). Between this PC there is a Linux =
router that captures all the segment and do forwarding. I want that it =
takes a client packet (the 10th TCP data packet sended, for example), =
modify it as i want, and then resend it to the client with =
ipq_set_verdict.
Is this operation possible? Or netfilter can only send the modified =
packet at the server? If it's possible, which field must i modify to do =
this (i've tried to modify some flag but it doesn't work)?

Thanks for your help
Best regards


------=_NextPart_000_0019_01C44818.922CA1B0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi guys,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; I have a problem. I =
have a=20
client&nbsp;(192.168.9.2) that send TCP segment to a server =
(192.168.11.2).=20
Between this PC&nbsp;there is&nbsp;a Linux router that captures all the =
segment=20
and do forwarding. I want that it takes a client packet (the 10th TCP =
data=20
packet sended, for example), modify it as i want, and then resend it to =
the=20
client with ipq_set_verdict.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Is this operation possible? Or =
netfilter=20
can&nbsp;only send the modified packet at the server? If it's possible, =
which=20
field must i modify to do this (i've tried to modify some flag but it =
doesn't=20
work)?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks for your help</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Best regards</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0019_01C44818.922CA1B0--



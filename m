From: "david" <david@suarapembaruan.co.id>
Subject: block port 137
Date: Tue, 3 Aug 2004 12:07:46 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002401c47917$d0a6fd70$858310ac@suarapembaruan.com>
References: <267354A234DF4D46AA6AE56E1240BEF004A3BF@tv.wcslnet.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0021_01C47952.7CC59820"
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

------=_NextPart_000_0021_01C47952.7CC59820
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear all,
How to block outgoing traffic over network that using port 137 udp, because=
 my isp tell me that my network broadcast virus using port 137 udp, i want =
to make all traffic (port 137) do go outside my network, so i plan to block=
ing that traffic from my gateway.

I already try to do this rules, but not working :
#iptables -A FORWARD -p udp -s 0/0 --dport 137 -j DROP




Regards,
David Kandou

------=_NextPart_000_0021_01C47952.7CC59820
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Diso-8859-1"=
>
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE>@font-face {
	font-family: Tahoma;
}
@page Section1 {size: 612.0pt 792.0pt; margin: 72.0pt 90.0pt 72.0pt 90.0pt;=
 }
P.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt; FONT-FAMILY: "Times New Roman"
}
LI.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt; FONT-FAMILY: "Times New Roman"
}
DIV.MsoNormal {
	FONT-SIZE: 12pt; MARGIN: 0cm 0cm 0pt; FONT-FAMILY: "Times New Roman"
}
A:link {
	COLOR: blue; TEXT-DECORATION: underline
}
SPAN.MsoHyperlink {
	COLOR: blue; TEXT-DECORATION: underline
}
A:visited {
	COLOR: purple; TEXT-DECORATION: underline
}
SPAN.MsoHyperlinkFollowed {
	COLOR: purple; TEXT-DECORATION: underline
}
SPAN.EmailStyle17 {
	COLOR: navy; FONT-FAMILY: Arial
}
DIV.Section1 {
	page: Section1
}
</STYLE>
</HEAD>
<BODY lang=3DEN-US vLink=3Dpurple link=3Dblue bgColor=3Dwhite>
<DIV><FONT face=3DArial size=3D2>Dear all,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>How to block outgoing&nbsp;traffic over ne=
twork 
that using port 137 udp, because my isp tell me that my network broadcast v=
irus 
using port 137 udp, i want to make all traffic (port 137) do go outside my 
network, so i plan to blocking that traffic from my gateway.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I already try to do this rules, but not 
working&nbsp;:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>#iptables -A FORWARD -p udp -s 0/0 --dport=
 137 -j 
DROP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Regards,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>David Kandou</FONT></DIV></BODY></HTML>


------=_NextPart_000_0021_01C47952.7CC59820--



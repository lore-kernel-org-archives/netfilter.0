From: "John Paul" <john@pinoylinux.sytes.net>
Subject: FTP Redirect IP:Port
Date: Thu, 8 Jan 2004 15:05:19 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01a101c3d5b5$d35fe5a0$63000a0a@pooh>
Reply-To: "John Paul" <john@pinoylinux.sytes.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_019E_01C3D5F8.D4E48E60"
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

------=_NextPart_000_019E_01C3D5F8.D4E48E60
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello Folks,

I want to redirect FTP access from my BOX to other machine. How can i =
make this possible?

external IP ---> 202.x.x.x port 21 (redirect) ---> 192.168.0.10 port21

I have tried:

iptables -A PREROUTING -p tcp -d 202.x.x.x --dport 21 -j DNAT --to =
192.168.0.10:21

this seems to be not working. what could it be?

Thanks
JP.

------=_NextPart_000_019E_01C3D5F8.D4E48E60
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2733.1800" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Hello Folks,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I want to redirect FTP access from my =
BOX to other=20
machine. How can i make this possible?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>external IP ---&gt;&nbsp;202.x.x.x =
port&nbsp;21=20
(redirect) ---&gt;&nbsp;192.168.0.10 port21</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have tried:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A PREROUTING -p=20
tcp&nbsp;-d&nbsp;202.x.x.x --dport 21 -j DNAT --to =
192.168.0.10:21</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>this seems to be not working. what =
could it=20
be?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT><FONT face=3DArial =
size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>JP.</FONT></DIV></BODY></HTML>

------=_NextPart_000_019E_01C3D5F8.D4E48E60--



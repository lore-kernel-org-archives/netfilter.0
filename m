From: "Michael Menges" <snipah9@hotmail.com>
Subject: iptables ipforwarding issue
Date: Sat, 15 Nov 2003 22:31:04 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Sea2-DAV65Vqr7NoUDr0000227d@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0005_01C3ABC8.27E2F4E0"
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

------=_NextPart_000_0005_01C3ABC8.27E2F4E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Just upgraded to 2.4.22 kernel from 2.2.x and now must learn iptables =
just when I got ipchains down. ;)
Anyhow, i need some help getting my firewall box to forward traffic for =
certain services, formost https.

Here's what I have thus far:
iptables -P FORWARD DROP
iptables -A FORWARD -j ACCEPT -m state --state ESTABLISHED,RELATED
iptables -A FORWARD -j ACCEPT -p tcp -i eth0 -o eth1 -d 12.249.0.0/16 =
--dport 443

12.249.0.0/16 is eth0 and is my inet connection.  192.168.0.0/24 is eth1 =
and is my localnet interface.
Where do I go from here to bridge the gap allowing access to my https =
server inside my localnet?

Thanks for any help you might spare me. ;)

Mike

 
------=_NextPart_000_0005_01C3ABC8.27E2F4E0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1264" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2>Just upgraded to 2.4.22 =
kernel from=20
2.2.x and now must learn iptables just when I got ipchains down. =
;)</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2>Anyhow, i need some =
help getting my=20
firewall box to forward traffic for certain services, formost=20
https.</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2>Here's what I have thus =

far:</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2>iptables -P FORWARD =
DROP</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2>iptables -A FORWARD -j =
ACCEPT -m=20
state --state ESTABLISHED,RELATED</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2>iptables -A FORWARD -j =
ACCEPT -p tcp=20
-i eth0 -o eth1 -d&nbsp;12.249.0.0/16 --dport 443</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2>12.249.0.0/16 is eth0 =
and is my inet=20
connection.&nbsp; 192.168.0.0/24 is eth1 and is my localnet=20
interface.</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2>Where do I go from =
here&nbsp;to=20
bridge the gap allowing access to my https server inside my=20
localnet?</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2>Thanks for any help you =
might spare=20
me. ;)</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2>Mike</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0005_01C3ABC8.27E2F4E0--


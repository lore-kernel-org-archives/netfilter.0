From: "Stuart Lamble" <stu@gateway10.homeip.net>
Subject: DNAT not working
Date: Thu, 18 Mar 2004 22:26:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000101c40d27$5ce6ed20$0464a8c0@stu>
Reply-To: <stu@gateway10.homeip.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0002_01C40D38.206FBD20"
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

------=_NextPart_000_0002_01C40D38.206FBD20
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit

Hello netfilter lists
 
Can any one help me here. I have the following rule...
 
iptables -t nat -A PREROUTING -i ppp0 -p tcp -d $FW-EXT-IP --dport 22 -j
DNAT --to 192.168.100.6:22
 
Simply put I want to allow ssh from the internet to a server on my LAN,
192.168.100.6
My FORWARD rule is default accept.
 
I understand that a packet comes into the firewall on an interface and
then gets PREROUTED as above the gets passed to FORWARD = accept then to
the destination???
 
Why is it not working? Do i need to do any special kernel, modprobe
things?
Thanks
Stu

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.631 / Virus Database: 404 - Release Date: 3/17/2004
 

------=_NextPart_000_0002_01C40D38.206FBD20
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DWindows-1252">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D040242220-18032004>Hello =
netfilter=20
lists</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D040242220-18032004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D040242220-18032004>Can =
any one help me=20
here. I have the following rule...</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D040242220-18032004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D040242220-18032004>iptables -t nat -A=20
PREROUTING -i ppp0 -p tcp -d $FW-EXT-IP --dport 22 -j DNAT --to=20
192.168.100.6:22</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D040242220-18032004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D040242220-18032004>Simply =
put I want to=20
allow ssh from the internet to a server on my LAN,=20
192.168.100.6</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D040242220-18032004>My =
FORWARD rule is=20
default accept.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D040242220-18032004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D040242220-18032004>I =
understand that a=20
packet comes into the firewall on an interface and then gets PREROUTED =
as above=20
the gets passed to FORWARD =3D accept then to the=20
destination???</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D040242220-18032004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D040242220-18032004>Why is =
it not=20
working? Do i need to do any special kernel, modprobe=20
things?</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D040242220-18032004>Thanks</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D040242220-18032004>Stu</SPAN></FONT></DIV></BODY></HTML>
<BR>

<P><FONT SIZE=3D2>---<BR>
Outgoing mail is certified Virus Free.<BR>
Checked by AVG anti-virus system (http://www.grisoft.com).<BR>
Version: 6.0.631 / Virus Database: 404 - Release Date: 3/17/2004<BR>
</FONT> </P>

------=_NextPart_000_0002_01C40D38.206FBD20--



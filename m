From: "Alexis" <alexis@tpys.com.ar>
Subject: Re: newbie question
Date: Thu, 8 Apr 2004 13:26:54 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003501c41d86$4efcf3c0$51a2fea9@heretic>
References: <004601c41d60$9bf1af70$aa47aacb@hacker>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0032_01C41D6D.28EA9700"
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
To: netfilter <netfilter@lists.netfilter.org>, "M. Ahmad Ijaz" <ahmad@netlogicbroadband.com>

This is a multi-part message in MIME format.

------=_NextPart_000_0032_01C41D6D.28EA9700
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

you must specify the table.

with -t modif
  ----- Original Message -----=20
  From: M. Ahmad Ijaz=20
  To: netfilter@lists.netfilter.org=20
  Sent: Thursday, April 08, 2004 8:57 AM
  Subject: newbie question


  hi,

  I just wanna know few things , i have installed red hat 9, iptable is =
installed.

  Now the thing is, i didnt know at first that i have to load the =
modules, i was getting the message

  iptables: No chain/target/match by that name

  so after couple of searches i did find some help and i manage to apply =
few commands i.e.

  modprobe ip_tables
  modprobe ip_conntrack
  modprobe iptable_nat
  modprobe ip_conntrack_ftp
  modprobe ip_nat_ftp

  iptables -P INPUT ACCEPT
  iptables -P OUTPUT ACCEPT
  iptables -P FORWARD DROP
  iptables -A INPUT -p icmp --icmp-type 8 -j DROP=20


  all the above commands are accepted at command prompt, but when i try =
to use this command

  iptables -A PREROUTING -s xxx.xxx.xxx.xxx/yyy.yyy.yyy.yyy -p tcp -m =
tcp --dport 80 -j REDIRECT --to-ports 8080 where xxx is any IP and yyy =
is the subnet mask, it returns me the same message i.e.=20
  iptables: No chain/target/match by that name

  So it also give the same message with POSTROUTING.


  also i dont wana load the modules and the commands each time the =
system starts, so when i type the commands i used iptables-save command =
to save tat, also is there ne possibility where i can store the command =
and execute when system startsup
------=_NextPart_000_0032_01C41D6D.28EA9700
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
<DIV><FONT face=3DArial size=3D2>you must specify the =
table.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>with -t modif</FONT></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dahmad@netlogicbroadband.com=20
  href=3D"mailto:ahmad@netlogicbroadband.com">M. Ahmad Ijaz</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Thursday, April 08, 2004 =
8:57=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> newbie question</DIV>
  <DIV><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>hi,</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV>I just wanna know few things , i have installed red hat 9, =
iptable is=20
  installed.</DIV>
  <DIV>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Now the thing is, i didnt know at =
first that i=20
  have to load the modules, i was getting the message</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT size=3D+0>iptables: No chain/target/match by that =
name</FONT></DIV>
  <DIV>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>so after couple of searches i did =
find some help=20
  and i manage to apply few commands i.e.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV>modprobe ip_tables<BR>modprobe ip_conntrack<BR>modprobe=20
  iptable_nat<BR>modprobe ip_conntrack_ftp<BR>modprobe=20
  ip_nat_ftp<BR><BR>iptables -P INPUT ACCEPT<BR>iptables -P OUTPUT=20
  ACCEPT<BR>iptables -P FORWARD DROP<BR>iptables -A INPUT -p icmp =
--icmp-type 8=20
  -j DROP <BR></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV>all the above commands are accepted at command prompt, but when i =
try to=20
  use this command<BR><BR>iptables -A PREROUTING -s=20
  xxx.xxx.xxx.xxx/yyy.yyy.yyy.yyy -p tcp -m tcp --dport 80 -j REDIRECT=20
  --to-ports 8080 where xxx is any IP and yyy is the subnet mask, it =
returns me=20
  the same message i.e. <BR>iptables: No chain/target/match by that=20
  name<BR><BR>So it also give the same message with =
POSTROUTING.<BR><BR><BR>also=20
  i dont wana load the modules and the commands each time the system =
starts, so=20
  when i type the commands i used iptables-save command to save tat, =
also is=20
  there ne possibility where i can store the command and execute when =
system=20
  startsup</DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0032_01C41D6D.28EA9700--



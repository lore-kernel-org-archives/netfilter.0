From: "Daemen Martin" <daemen.martin@bergersysteme.com>
Subject: Iptables eth1:1
Date: Mon, 3 Feb 2003 20:17:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <C9885B6D78D52D4985CF91C9D09A9273081BC8@w2kserver1.bergersysteme.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2CBB8.DF0451E0"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

------_=_NextPart_001_01C2CBB8.DF0451E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi list,

I want to establish a active ftp connection from the internet to my =
FTPSERVER1 od FTPSERVER2.

Here is my config

	=09
                                           Internet
			            |=09
eth1(195.xx.xx.100) / eth1:1(195.xx.xx.101) / eth1:2(195.xx.xx.102)
			     Linux Box
	                       eth0(192.168.100.1)
			            |
                      		         LAN=09
  FTP SERVER 1(192.168.100.2)  FTPSERVER2(192.168.100.3)

# FTP for the FTPSERVER1
iptables -t nat -A PREROUTING -s 0.0.0.0/0 -d 195.xx.xx.101 -i eth1 -p =
tcp --dport 21 -m state --state NEW,ESTABLISHED -j DNAT --to =
92.168.100.2 iptables -A FORWARD -s 0.0.0.0/0 -d 192.168.100.0/24 -p tcp =
--sport 1024:65535 --dport 21 -m state --state NEW,ESTABLISHED -j ACCEPT =
iptables -A FORWARD -s 192.168.100.0/24 -d 0.0.0.0/0 -p tcp --sport 21 =
--dport 1024:65535 -m state --state ESTABLISHED -j ACCEPT

# FTP Active back to client
iptables -t nat -A POSTROUTING -s 192.168.100.0/24 -d 0.0.0.0/0 -p tcp =
--sport 20 --dport 1024:65535 -m state --state NEW,ESTABLISHED,RELATED =
-j MASQUERADE iptables -A FORWARD -s 0.0.0.0/0 -d 192.168.100.0/24 -p =
tcp --sport 1024:65535 --dport 20 -m state --state ESTABLISHED -j ACCEPT
iptables -A FORWARD -s 192.168.101.0/24 -d 0.0.0.0/0 -p tcp --sport 20 =
--dport 1024:65535 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

And this ruleset for the seconf ftpserver too.

If try to connect from the internet to ip 195.xx.xx.101. the ftpserver1 =
will prompt me to log in. So the connection to port 21 seems to be =
working, but if i try to make a dir or ls, i=B4ve got no response. It =
seems to me, that the postrouting rule turns the sender ip adress not to =
the adress of eth1:1, from where the connection is started, but to the =
ip adress of eth1. an so the ftp client could not establish a data =
connection, because he don`t send a request to the adress of eth1.

Can anyone tell me what i have to do, so that iptables don=B4t touch to =
the ip adress to eth1 but to eth1:1

Best regards


Mit freundlichen Gr=FC=DFen

Berger-EDV Systemberatungs GmbH | Martin Daemen
D=F6nhoffstr. 25                  | System-Engineer
42655 Solingen                  | =
<mailto:daemen.martin@bergersysteme.com>
http://www.bergersysteme.com    | Tel.: 0212/2681100  Fax: 0212/2681101


------_=_NextPart_001_01C2CBB8.DF0451E0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.5762.3">
<TITLE>Iptables eth1:1</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Franklin Gothic Book">Hi list,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Franklin Gothic Book">I want to establish a =
active ftp connection from the internet to my FTPSERVER1 od =
FTPSERVER2.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Franklin Gothic Book">Here is my config</FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20

<BR><FONT SIZE=3D2 FACE=3D"Franklin Gothic =
Book">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Internet</FONT>

<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Franklin Gothic =
Book">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp; </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Franklin Gothic Book">eth1(195.xx.xx.100) / =
eth1:1(195.xx.xx.101) / eth1:2(195.xx.xx.102)</FONT>

<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Franklin Gothic Book">&nbsp;&nbsp;&nbsp;&nbsp; Linux Box</FONT>

<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Franklin Gothic =
Book">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
eth0(192.168.100.1)</FONT>

<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Franklin Gothic =
Book">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Franklin Gothic =
Book">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LAN&nbsp;&nbsp;&nbsp; =
</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Franklin Gothic Book">&nbsp; FTP SERVER =
1(192.168.100.2)&nbsp; FTPSERVER2(192.168.100.3)</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Franklin Gothic Book"># FTP for the =
FTPSERVER1</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Franklin Gothic Book">iptables -t nat -A =
PREROUTING -s 0.0.0.0/0 -d 195.xx.xx.101 -i eth1 -p tcp --dport 21 -m =
state --state NEW,ESTABLISHED -j DNAT --to 92.168.100.2 iptables -A =
FORWARD -s 0.0.0.0/0 -d 192.168.100.0/24 -p tcp --sport 1024:65535 =
--dport 21 -m state --state NEW,ESTABLISHED -j ACCEPT iptables -A =
FORWARD -s 192.168.100.0/24 -d 0.0.0.0/0 -p tcp --sport 21 --dport =
1024:65535 -m state --state ESTABLISHED -j ACCEPT</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Franklin Gothic Book"># FTP Active back to =
client</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Franklin Gothic Book">iptables -t nat -A =
POSTROUTING -s 192.168.100.0/24 -d 0.0.0.0/0 -p tcp --sport 20 --dport =
1024:65535 -m state --state NEW,ESTABLISHED,RELATED -j MASQUERADE =
iptables -A FORWARD -s 0.0.0.0/0 -d 192.168.100.0/24 -p tcp --sport =
1024:65535 --dport 20 -m state --state ESTABLISHED -j ACCEPT</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Franklin Gothic Book">iptables -A FORWARD -s =
192.168.101.0/24 -d 0.0.0.0/0 -p tcp --sport 20 --dport 1024:65535 -m =
state --state NEW,ESTABLISHED,RELATED -j ACCEPT</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Franklin Gothic Book">And this ruleset for the =
seconf ftpserver too.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Franklin Gothic Book">If try to connect from =
the internet to ip 195.xx.xx.101. the ftpserver1 will prompt me to log =
in. So the connection to port 21 seems to be working, but if i try to =
make a dir or ls, i=B4ve got no response. It seems to me, that the =
postrouting rule turns the sender ip adress not to the adress of eth1:1, =
from where the connection is started, but to the ip adress of eth1. an =
so the ftp client could not establish a data connection, because he =
don`t send a request to the adress of eth1.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Franklin Gothic Book">Can anyone tell me what =
i have to do, so that iptables don=B4t touch to the ip adress to eth1 =
but to eth1:1</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Franklin Gothic Book">Best regards</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Mit freundlichen =
Gr=FC=DFen</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Berger-EDV Systemberatungs GmbH | =
Martin Daemen</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">D=F6nhoffstr. =
25&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | System-Engineer</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">42655 =
Solingen&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &lt;</FONT><A =
HREF=3D"mailto:daemen.martin@bergersysteme.com"><U><FONT =
COLOR=3D"#0000FF" SIZE=3D2 FACE=3D"Courier =
New">mailto:daemen.martin@bergersysteme.com</FONT></U></A><FONT SIZE=3D2 =
FACE=3D"Courier New">&gt;</FONT>

<BR><A HREF=3D"http://www.bergersysteme.com"><U><FONT COLOR=3D"#0000FF" =
SIZE=3D2 FACE=3D"Courier =
New">http://www.bergersysteme.com</FONT></U></A><FONT SIZE=3D2 =
FACE=3D"Courier New">&nbsp;&nbsp;&nbsp; | Tel.: 0212/2681100&nbsp; Fax: =
0212/2681101</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2CBB8.DF0451E0--


From: =?iso-8859-1?Q?CPD_-_David_Carde=F1osa_Rubio?=
	 <dcardenosa@cac.retecal.es>
Subject: RE: iptables and samba
Date: Wed, 26 May 2004 10:29:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7528A97D83FBD411BEF40003471B905B05D8FF1B@ZAR1>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C442FB.A0464200"
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C442FB.A0464200
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi

This seems to be related to inverse name resolution.
You can try put the client computer name in /etc/hosts and try the =
conection
again.
In some cases samba try to resolv the client computer name, make a DNS
query, until the DNS query finish the conection not be establised =
correctly.

Gratings=20

David Carde=F1osa

-----Mensaje original-----
De: azeem ahmad [mailto:azeem484@hotmail.com]
Enviado el: domingo, 23 de mayo de 2004 11:21
Para: netfilter@lists.netfilter.org
Asunto: iptables and samba


hi
i m using the script below
------------------------------------------------------------------------=
----
---------------------------------------------------------
iptables -F
iptables -t nat -F
iptables -P INPUT DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 22   -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 53   -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 53   -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 137  -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 138  -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 139  -j ACCEPT

iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port =
8080
#iptables -t nat -A PREROUTING -p udp --dport 80 -j REDIRECT --to-port =
8080

iptables -P FORWARD DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 21        -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 443       -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 5000      -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 5001      -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 5005      -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 5050      -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 6660:6670 -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 7000      -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 28805     -j ACCEPT
iptables -A FORWARD -i eth0 -p tcp --dport 51215     -j ACCEPT

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
------------------------------------------------------------------------=
----
---------------------------------------------------------

i have two shares on samba server "Soft and linux" in these shares =
there are

many folders. whenever i run the above script and then i open the share =
it=20
takes atleast 4  minutes to open the share. but it doesnt take time =
while=20
browsing inside share.
mean there is a folder on soft share like soft/adobe/acrobat/acrobat6
when i double click on soft it takes atleast 4 minutes but after that =
when i

click on adobe then acrobat then acrobat6 it takes now time it just =
brose=20
them normally. same problem is with the other share named linux.
but if i dont run this script then all shares work fine with no delay

i dont know what is the udp port 80 for but i just saw its traffic on =
my=20
network in iptraf so i included it in my script

Regards
Azeem

_________________________________________________________________
Add photos to your e-mail with MSN 8. Get 2 months FREE*.=20
http://join.msn.com/?page=3Dfeatures/featuredemail


------_=_NextPart_001_01C442FB.A0464200
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>RE: iptables and samba</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Hi</FONT>
</P>

<P><FONT SIZE=3D2>This seems to be related to inverse name =
resolution.</FONT>
<BR><FONT SIZE=3D2>You can try put the client computer name in =
/etc/hosts and try the conection again.</FONT>
<BR><FONT SIZE=3D2>In some cases samba try to resolv the client =
computer name, make a DNS query, until the DNS query finish the =
conection not be establised correctly.</FONT></P>

<P><FONT SIZE=3D2>Gratings </FONT>
</P>

<P><FONT SIZE=3D2>David Carde=F1osa</FONT>
</P>

<P><FONT SIZE=3D2>-----Mensaje original-----</FONT>
<BR><FONT SIZE=3D2>De: azeem ahmad [<A =
HREF=3D"mailto:azeem484@hotmail.com">mailto:azeem484@hotmail.com</A>]</F=
ONT>
<BR><FONT SIZE=3D2>Enviado el: domingo, 23 de mayo de 2004 11:21</FONT>
<BR><FONT SIZE=3D2>Para: netfilter@lists.netfilter.org</FONT>
<BR><FONT SIZE=3D2>Asunto: iptables and samba</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>hi</FONT>
<BR><FONT SIZE=3D2>i m using the script below</FONT>
<BR><FONT =
SIZE=3D2>---------------------------------------------------------------=
----------------------------------------------------------------------</=
FONT></P>

<P><FONT SIZE=3D2>iptables -F</FONT>
<BR><FONT SIZE=3D2>iptables -t nat -F</FONT>
<BR><FONT SIZE=3D2>iptables -P INPUT DROP</FONT>
<BR><FONT SIZE=3D2>iptables -A INPUT -m state --state =
ESTABLISHED,RELATED -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -A INPUT -i eth0 -p tcp --dport 8080 -j =
ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -A INPUT -i eth0 -p tcp --dport =
22&nbsp;&nbsp; -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -A INPUT -i eth0 -p tcp --dport =
53&nbsp;&nbsp; -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -A INPUT -i eth0 -p udp --dport =
53&nbsp;&nbsp; -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -A INPUT -i eth0 -p udp --dport 137&nbsp; =
-j ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -A INPUT -i eth0 -p udp --dport 138&nbsp; =
-j ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -A INPUT -i eth0 -p tcp --dport 139&nbsp; =
-j ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2>iptables -t nat -A PREROUTING -p tcp --dport 80 -j =
REDIRECT --to-port 8080</FONT>
<BR><FONT SIZE=3D2>#iptables -t nat -A PREROUTING -p udp --dport 80 -j =
REDIRECT --to-port 8080</FONT>
</P>

<P><FONT SIZE=3D2>iptables -P FORWARD DROP</FONT>
<BR><FONT SIZE=3D2>iptables -A FORWARD -m state --state =
ESTABLISHED,RELATED -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -A FORWARD -i eth0 -p tcp --dport =
21&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -A FORWARD -i eth0 -p tcp --dport =
443&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -A FORWARD -i eth0 -p tcp --dport =
5000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -A FORWARD -i eth0 -p tcp --dport =
5001&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -A FORWARD -i eth0 -p tcp --dport =
5005&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -A FORWARD -i eth0 -p tcp --dport =
5050&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -A FORWARD -i eth0 -p tcp --dport 6660:6670 =
-j ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -A FORWARD -i eth0 -p tcp --dport =
7000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -A FORWARD -i eth0 -p tcp --dport =
28805&nbsp;&nbsp;&nbsp;&nbsp; -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -A FORWARD -i eth0 -p tcp --dport =
51215&nbsp;&nbsp;&nbsp;&nbsp; -j ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2>iptables -t nat -A POSTROUTING -o ppp0 -j =
MASQUERADE</FONT>
<BR><FONT =
SIZE=3D2>---------------------------------------------------------------=
----------------------------------------------------------------------</=
FONT></P>

<P><FONT SIZE=3D2>i have two shares on samba server &quot;Soft and =
linux&quot; in these shares there are </FONT>
<BR><FONT SIZE=3D2>many folders. whenever i run the above script and =
then i open the share it </FONT>
<BR><FONT SIZE=3D2>takes atleast 4&nbsp; minutes to open the share. but =
it doesnt take time while </FONT>
<BR><FONT SIZE=3D2>browsing inside share.</FONT>
<BR><FONT SIZE=3D2>mean there is a folder on soft share like =
soft/adobe/acrobat/acrobat6</FONT>
<BR><FONT SIZE=3D2>when i double click on soft it takes atleast 4 =
minutes but after that when i </FONT>
<BR><FONT SIZE=3D2>click on adobe then acrobat then acrobat6 it takes =
now time it just brose </FONT>
<BR><FONT SIZE=3D2>them normally. same problem is with the other share =
named linux.</FONT>
<BR><FONT SIZE=3D2>but if i dont run this script then all shares work =
fine with no delay</FONT>
</P>

<P><FONT SIZE=3D2>i dont know what is the udp port 80 for but i just =
saw its traffic on my </FONT>
<BR><FONT SIZE=3D2>network in iptraf so i included it in my =
script</FONT>
</P>

<P><FONT SIZE=3D2>Regards</FONT>
<BR><FONT SIZE=3D2>Azeem</FONT>
</P>

<P><FONT =
SIZE=3D2>_______________________________________________________________=
__</FONT>
<BR><FONT SIZE=3D2>Add photos to your e-mail with MSN 8. Get 2 months =
FREE*. </FONT>
<BR><FONT SIZE=3D2><A =
HREF=3D"http://join.msn.com/?page=3Dfeatures/featuredemail" =
TARGET=3D"_blank">http://join.msn.com/?page=3Dfeatures/featuredemail</A>=
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C442FB.A0464200--


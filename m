From: "Danny Patel" <dipte@hotmail.com>
Subject: Fw: IPTables dynamic routing for school
Date: Tue, 1 Apr 2003 16:31:55 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OE31nHM3SOlbpH71yEX0000100b@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0014_01C2F86C.350F3260"
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

------=_NextPart_000_0014_01C2F86C.350F3260
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
  Thanks for the awesome packet filtering tool. It has really come in =
handy for our school setup. I have on issue that I am hoping you can =
help me with. After thoroughly researching this issue I can't seem to =
find any solution to the following situation in my school setup:

The server is Gateway/Firewall
IPTables ver: 1.2.6
Kernel: 2.4.18 (Red Hat)
Cable Modem (with DHCP for external address)
Internal network: 192.168.1.0/24
Internal interface: eth0
External interface: eth1
Internally we use DHCP service to allocate ips to the student PCs. =
(192.168.1.0/24)

Goal of what I am trying to do: When the firewall first starts we would =
like to redirect all HTTP traffic headed to the internet from the =
student PCs to our internal webserver (192.168.1.1) where the students =
are first required to pick an assignment. Once a student picks an =
assignment then we would like to allow only that student's ip to access =
the internet, hence allow his HTTP traffic out to the internet. This way =
we can restrict the students from wasting time and allow us to keep =
records of each student accepting assignments before having access to =
the internet to do the research for the assignment.

The key here is to only allow those student PCs that have selected an =
assignment access to the internet and redirect all other students to our =
local webserver till they pick an assignment.

From my current understanding of IPTables it appears that you can only =
do redirection/dnat in the -t nat PREROUTING chain but then this ends up =
applying to all IPs instead of select few.

Any help is greatly appreciated.

Thanks in advance
------=_NextPart_000_0014_01C2F86C.350F3260
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1141" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2>Hi,<BR>&nbsp; Thanks for the awesome =
packet=20
filtering tool. It has really come in handy for our school setup. I have =
on=20
issue that I am hoping you can help me with. After thoroughly =
researching this=20
issue I can't seem to find any solution to the following situation in my =
school=20
setup:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The server is =
Gateway/Firewall<BR>IPTables ver:=20
1.2.6<BR>Kernel: 2.4.18 (Red Hat)<BR>Cable Modem (with DHCP for external =

address)<BR>Internal network: 192.168.1.0/24<BR>Internal interface:=20
eth0<BR>External interface: eth1<BR>Internally we use DHCP service to =
allocate=20
ips to the student PCs. (192.168.1.0/24)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Goal of what I am trying to do: When =
the firewall=20
first starts we would like to redirect all HTTP traffic headed to the =
internet=20
from the student PCs to our internal webserver (192.168.1.1) where the =
students=20
are first required to pick an assignment. Once a student picks an =
assignment=20
then we would like to allow only that student's ip to access the =
internet, hence=20
allow his HTTP traffic out to the internet. This way we can restrict the =

students from wasting time and allow us to keep records of each student=20
accepting assignments before having access to the internet to do the =
research=20
for the assignment.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The key here is to only allow those =
student PCs=20
that have selected an assignment access to the internet and redirect all =
other=20
students to our local webserver till they pick an =
assignment.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>From my current understanding of =
IPTables it=20
appears that you can only do redirection/dnat in the -t nat PREROUTING =
chain but=20
then this ends up applying to all IPs instead of select =
few.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Any help is greatly =
appreciated.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks in=20
advance</FONT></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_0014_01C2F86C.350F3260--


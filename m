From: "Nazghul" <nazghul@lostland.de>
Subject: Routing depending on source address or destination port
Date: Sat, 8 Jun 2002 11:08:01 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <002b01c20ecb$fdf161c0$0200a8c0@dvteam.de>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002C_01C20EDC.C17A31C0"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_002C_01C20EDC.C17A31C0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

 
 
I had a careful look in the list archives, bu did not find anything
appropriate. In case I have overseen something, redirects are welcome.
 
On our network there are two routers maintaining different internet
connections. The first uses a DSL connection, the second a satellite
link (with incredible high bandwith, but the latency is a
pain-in-the-a**).
 
The goal is to use the DSL connection for all interactive tasks like ssh
etc., and also for all outbound connections from the administrators
workstation. All other traffic should use the (high latency) satellite
link.
 
Let's say the internal network would use 192.168.0.0/24. The default
router is 192.168.0.254. This is a linux box with 2.4 kernel. The .254
address is bound to eth2. eth0 is connected with the DSL modem (so it
has no IP address, the DSL connection uses ppp0). eth1 gets it's address
by DHCP from the satellite modem. The administrator's box has the
address 192.168.0.2
 
Of course the system has to use some kind of NAT for the connections
between the local network and the internet.
 
Someone told me that iptables/netfilter should be able to perform the
job. Unfortunately I have no clue how. 
 
Any kind of help will be greatly appreciated.
 
rm

------=_NextPart_000_002C_01C20EDC.C17A31C0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Nachricht</TITLE>

<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV align=3Dleft><STRONG><SPAN class=3D468165708-08062002><FONT =
color=3D#000080>I had=20
a careful look in the list archives, bu did not find anything =
appropriate. In=20
case I have overseen something, redirects are=20
welcome.</FONT></SPAN></STRONG></DIV>
<DIV align=3Dleft><STRONG><SPAN class=3D468165708-08062002><FONT=20
color=3D#000080></FONT></SPAN></STRONG>&nbsp;</DIV>
<DIV align=3Dleft><STRONG><SPAN class=3D468165708-08062002><FONT =
color=3D#000080>On=20
our network there are two routers maintaining different internet =
connections.=20
The first uses a DSL connection, the second a satellite link (with =
incredible=20
high bandwith, but the latency is a=20
pain-in-the-a**).</FONT></SPAN></STRONG></DIV>
<DIV align=3Dleft><STRONG><SPAN class=3D468165708-08062002><FONT=20
color=3D#000080></FONT></SPAN></STRONG>&nbsp;</DIV>
<DIV align=3Dleft><STRONG><SPAN class=3D468165708-08062002><FONT =
color=3D#000080>The=20
goal is to use the&nbsp;DSL connection for all interactive tasks like =
ssh etc.,=20
and also for all outbound connections from the administrators =
workstation. All=20
other traffic should use the (high latency) satellite=20
link.</FONT></SPAN></STRONG></DIV>
<DIV align=3Dleft><STRONG><SPAN class=3D468165708-08062002><FONT=20
color=3D#000080></FONT></SPAN></STRONG>&nbsp;</DIV>
<DIV align=3Dleft><STRONG><SPAN class=3D468165708-08062002><FONT =
color=3D#000080>Let's=20
say the internal network would use 192.168.0.0/24. The default router is =

192.168.0.254. This is a linux box with 2.4 kernel. The .254 address is =
bound to=20
eth2. eth0 is connected with the DSL modem (so it has no IP address, the =
DSL=20
connection uses ppp0). eth1 gets it's address by DHCP from the satellite =
modem.=20
The administrator's box has the address =
192.168.0.2</FONT></SPAN></STRONG></DIV>
<DIV align=3Dleft><STRONG><SPAN class=3D468165708-08062002><FONT=20
color=3D#000080></FONT></SPAN></STRONG>&nbsp;</DIV>
<DIV align=3Dleft><STRONG><SPAN class=3D468165708-08062002><FONT =
color=3D#000080>Of=20
course the system has to use some kind of NAT for the connections =
between the=20
local network and the internet.</FONT></SPAN></STRONG></DIV>
<DIV align=3Dleft><STRONG><SPAN class=3D468165708-08062002><FONT=20
color=3D#000080></FONT></SPAN></STRONG>&nbsp;</DIV>
<DIV align=3Dleft><STRONG><SPAN class=3D468165708-08062002><FONT=20
color=3D#000080>Someone told me that iptables/netfilter should be able =
to perform=20
the job. Unfortunately I have no clue how. </FONT></SPAN></STRONG></DIV>
<DIV align=3Dleft><STRONG><SPAN class=3D468165708-08062002><FONT=20
color=3D#000080></FONT></SPAN></STRONG>&nbsp;</DIV>
<DIV align=3Dleft><STRONG><SPAN class=3D468165708-08062002><FONT =
color=3D#000080>Any=20
kind of help will be greatly appreciated.</FONT></SPAN></STRONG></DIV>
<DIV align=3Dleft><STRONG><SPAN class=3D468165708-08062002><FONT=20
color=3D#000080></FONT></SPAN></STRONG>&nbsp;</DIV>
<DIV align=3Dleft><STRONG><SPAN class=3D468165708-08062002><FONT=20
color=3D#000080>rm</FONT></SPAN></STRONG></DIV></BODY></HTML>

------=_NextPart_000_002C_01C20EDC.C17A31C0--



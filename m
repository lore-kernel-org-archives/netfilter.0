From: "Monkey" <Monkey@allthingsbyte.com>
Subject: Forward UDP Broadcasts?
Date: Sun, 1 Dec 2002 20:21:03 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c299a9$76e7ca20$6400000a@hnic>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01C29977.2C4D5A20"
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

------=_NextPart_000_0001_01C29977.2C4D5A20
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi, I'm looking to figure out how to forward UDP Broadcasts from PPP#
interfaces to ETH# interfaces and vice versa. I have searched the net
with not much luck, I don't understand the man pages much but I do
understand some basics about IPTables, just not enough to figure this
out.
 
My Setup is as follows:
 
Red Hat Linux 8
IPV4 Forwarding Enabled
One NIC (ETH0)
PoPToP VPN Server (PPP0, PPP1, etc)  using only TCP/IP (No IPX, etc)
 
IPTables have no rules set currently:
 
Chain INPUT (policy ACCEPT 4039K packets, 1573M bytes)
 pkts bytes target     prot opt in     out     source
destination         
 
Chain FORWARD (policy ACCEPT 89199 packets, 3128K bytes)
 pkts bytes target     prot opt in     out     source
destination         
 
Chain OUTPUT (policy ACCEPT 3827K packets, 4349M bytes)
 pkts bytes target     prot opt in     out     source
destination 

------=_NextPart_000_0001_01C29977.2C4D5A20
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2800.1126" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D483010902-02122002><FONT face=3DVerdana size=3D2>Hi, =
I'm looking to=20
figure out how to forward UDP Broadcasts from PPP# interfaces to ETH# =
interfaces=20
and vice versa. I have searched the net with not much luck, I don't =
understand=20
the man pages much&nbsp;but I do&nbsp;understand some basics about=20
IPTables,&nbsp;just not enough to figure this out.</FONT></SPAN></DIV>
<DIV><SPAN class=3D483010902-02122002><FONT face=3DVerdana=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D483010902-02122002><FONT face=3DVerdana size=3D2>My =
Setup is as=20
follows:</FONT></SPAN></DIV>
<DIV><SPAN class=3D483010902-02122002><FONT face=3DVerdana=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D483010902-02122002><FONT face=3DVerdana size=3D2>Red =
Hat Linux=20
8</FONT></SPAN></DIV>
<DIV><SPAN class=3D483010902-02122002><FONT face=3DVerdana size=3D2>IPV4 =
Forwarding=20
Enabled</FONT></SPAN></DIV>
<DIV><SPAN class=3D483010902-02122002><FONT face=3DVerdana size=3D2>One =
NIC=20
(ETH0)</FONT></SPAN></DIV>
<DIV><SPAN class=3D483010902-02122002><FONT face=3DVerdana =
size=3D2>PoPToP VPN Server=20
(PPP0, PPP1, etc)&nbsp; using only TCP/IP (No IPX, =
etc)</FONT></SPAN></DIV>
<DIV><SPAN class=3D483010902-02122002><FONT face=3DVerdana=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D483010902-02122002><FONT face=3DVerdana =
size=3D2>IPTables have no=20
rules set currently:</FONT></SPAN></DIV>
<DIV><SPAN class=3D483010902-02122002><FONT face=3DVerdana=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D483010902-02122002><FONT face=3DVerdana =
size=3D2>Chain INPUT=20
(policy ACCEPT 4039K packets, 1573M bytes)<BR>&nbsp;pkts bytes=20
target&nbsp;&nbsp;&nbsp;&nbsp; prot opt in&nbsp;&nbsp;&nbsp;&nbsp;=20
out&nbsp;&nbsp;&nbsp;&nbsp;=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</FONT></SPAN></DIV>
<DIV><FONT face=3DVerdana size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D483010902-02122002><FONT face=3DVerdana =
size=3D2>Chain FORWARD=20
(policy ACCEPT 89199 packets, 3128K bytes)<BR>&nbsp;pkts bytes=20
target&nbsp;&nbsp;&nbsp;&nbsp; prot opt in&nbsp;&nbsp;&nbsp;&nbsp;=20
out&nbsp;&nbsp;&nbsp;&nbsp;=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</FONT></SPAN></DIV>
<DIV><FONT face=3DVerdana size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D483010902-02122002><FONT face=3DVerdana =
size=3D2>Chain OUTPUT=20
(policy ACCEPT 3827K packets, 4349M bytes)<BR>&nbsp;pkts bytes=20
target&nbsp;&nbsp;&nbsp;&nbsp; prot opt in&nbsp;&nbsp;&nbsp;&nbsp;=20
out&nbsp;&nbsp;&nbsp;&nbsp;=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination </FONT></SPAN></DIV></BODY></HTML>

------=_NextPart_000_0001_01C29977.2C4D5A20--



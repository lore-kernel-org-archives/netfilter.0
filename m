From: "Adam" <adam@techcommune.org>
Subject: Looking for fair bandwidth management advice.
Date: Sun, 2 Mar 2003 10:49:57 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001601c2e0d3$61e6eb80$0b00a8c0@Mustang>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0013_01C2E0A9.7721E4C0"
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

------=_NextPart_000_0013_01C2E0A9.7721E4C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello, this is my first post to the netfilter list. Here is my issue:=20

My internet connection is 28.8 from my home (painfull, but I won't get =
into why it has to be this way). I run a linux iptables NAT/firewall to =
allow net access to machines on my network. However, whenever one =
machine uses the full link speed (downloading a file), it pretty much =
cuts the rest of the machines off. Latency goes over 1 second and packet =
loss is pretty severe for the other machines. I notice on faster links, =
filling the upload and download streams does not send other connections =
off into timeout land, but it does add latency to them though.

I did read the bandwidth management section of the Linux Advanced =
Routing & Traffic HOWTO. Stochastic Fairness Queueing seams to fit what =
I'm looking for. However, I'm no TCP/IP expert, so I am looking for =
advice on how you would go about working with this setup. Thanks --Adam.

------=_NextPart_000_0013_01C2E0A9.7721E4C0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2719.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello, this is my first post to the =
netfilter list.=20
Here is my issue: </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>My internet connection is 28.8 from my =
home=20
(painfull, but I won't get into why it has to be this way). I run a=20
linux&nbsp;iptables&nbsp;NAT/firewall to allow net access to machines on =
my=20
network. However, whenever one machine uses the full link speed =
(downloading a=20
file), it pretty much cuts the rest of the machines off. Latency goes =
over 1=20
second and packet loss is&nbsp;pretty severe&nbsp;for the other =
machines. I=20
notice on faster links, filling the upload and download streams does not =
send=20
other connections off into timeout land, but&nbsp;it does =
add&nbsp;latency to=20
them though.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I did read the bandwidth management =
section of the=20
Linux Advanced Routing &amp; Traffic HOWTO. Stochastic Fairness Queueing =
seams=20
to fit what I'm looking for. However, I'm no TCP/IP expert, so I am =
looking for=20
advice on how you would go about working with this setup. Thanks =
--Adam.<!--StartFragment --></FONT></DIV></BODY></HTML>

------=_NextPart_000_0013_01C2E0A9.7721E4C0--



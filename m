From: "Albert Wan" <albert.wan@infohk.com>
Subject: To protect random ftp port
Date: Fri, 20 Jun 2003 13:11:34 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008e01c336ea$6b9af370$0c01a8c0@albert>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_008B_01C3372D.796712C0"
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
To: netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_008B_01C3372D.796712C0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

Dear Sir,

I would like to post this message to the list to see if any suggestion =
to my problem.

I have install a Linux web server with https service putting to Internet =
with external address.  The traffic coming from our web application to =
the web server through web page which is access from outside. The other =
way of traffic coming from our internet LAN network using ftp upload and =
downlad files to the web server. Our web application is designed with =
ramdom port for ftp access. That is no fix port number defined. The port =
80 and 443 are always open when start up the web server.

My question is do I have to open all ports using the following commands =
in order to tailor for my ftp ramdom port access? Is there any =
alternative way to set up?
$ iptables -A INPUT -p tcp -i eth0 -s 0/0 -d 0/0 --dport 0:65535 -j =
ACCEPT
$ iptables -A INPUT -p udp -i eth0 -s 0/0 -d 0/0 --dport 0:65535 -j =
ACCEPT

When I set up these commands in the web server, it seems block all the =
traffic from outside browser. What is your suggestion?

Looking for your kind replay.

Albert


------=_NextPart_000_008B_01C3372D.796712C0
Content-Type: text/html;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Dbig5" http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2920.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#d8d8d8>
<DIV><FONT size=3D2>Dear Sir,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>I would like to post this message to the list to see =
if any=20
suggestion to my problem.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>
<DIV><FONT size=3D2>I have&nbsp;install a Linux web server with https =
service=20
putting to Internet with external address.&nbsp; The traffic coming from =
our web=20
application to the web server through web page which is access from =
outside. The=20
other way of traffic coming from our internet LAN network using ftp =
upload and=20
downlad files to the web server. Our web application is designed with =
ramdom=20
port for ftp access. That is no fix port number defined. The port 80 and =
443 are=20
always open when start up the web server.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>My question is do I have to open all ports using the =
following=20
commands in order to tailor for my ftp ramdom port access? Is there any=20
alternative way to set up?</FONT></DIV>
<DIV><FONT size=3D2>$&nbsp;iptables -A INPUT -p tcp -i eth0 -s 0/0 -d =
0/0 --dport=20
0:65535 -j ACCEPT<BR>$&nbsp;iptables -A INPUT -p udp -i eth0 -s 0/0 -d =
0/0=20
--dport 0:65535 -j ACCEPT<BR></FONT></DIV>
<DIV><FONT size=3D2>When I set&nbsp;up these commands in the web server, =
it seems=20
block all the traffic from outside browser. What is your=20
suggestion?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>Looking for your kind replay.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2>Albert</FONT></DIV></FONT></DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_008B_01C3372D.796712C0--



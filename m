From: Naleendra@dms.lanka.net
Subject: problems with ftp
Date: Tue, 17 Sep 2002 20:17:54 +0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6029A399F5BFD6118BB200104B0DF37302764E@mailgate.dms.lanka.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C25E55.03954320"
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

------_=_NextPart_001_01C25E55.03954320
Content-Type: text/plain;
	charset="iso-8859-1"

Hi,

	First & foremost thanks anthony, telnet works smoothly. 

	You see I am checking the services that I'll be needing one by one
before by plug in the IPTABLES box in to a running network. Next on line is
FTP. Now I've heard that FTP tends to be a bit bothersome . Listed below is
my FTP ruleset. My connections are refused both ways. Your help is greatly
appreciated.

   #Allow FTP outbound.
iptables -A INPUT -i $PPPIF -p tcp --sport 21 -m state --state ESTABLISHED
-j ACCEPT
iptables -A OUTPUT -o $PPPIF -p tcp --dport 21 -m state --state
NEW,ESTABLISHED -j ACCEPT   
iptables -A INPUT -i $PPPIF -p tcp --sport 20 --dport $UP_PORTS  -m state
--state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o $PPPIF -p tcp --sport $UP_PORTS --dport 20  -m state
--state ESTABLISHED -j ACCEPT
 iptables -A INPUT -i $PPPIF -p tcp --sport $UP_PORTS --dport $UP_PORTS  -m
state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o $PPPIF -p tcp --sport $UP_PORTS --dport $UP_PORTS  -m
state --state ESTABLISHED,RELATED -j ACCEPT 

-nal

------_=_NextPart_001_01C25E55.03954320
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
<TITLE>problems with ftp</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi,</FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">First &amp; foremost thanks anthony, telnet works =
smoothly. </FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">You see I am checking the services that I'll be needing =
one by one before by plug in the IPTABLES box in to a running network. =
Next on line is FTP. Now I've heard that FTP tends to be a bit =
bothersome . Listed below is my FTP ruleset. My connections are refused =
both ways. Your help is greatly appreciated.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp; #Allow FTP =
outbound.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">iptables -A INPUT -i $PPPIF -p tcp =
--sport 21 -m state --state ESTABLISHED -j ACCEPT</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">iptables -A OUTPUT -o $PPPIF -p tcp =
--dport 21 -m state --state NEW,ESTABLISHED -j ACCEPT&nbsp;&nbsp; =
</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">iptables -A INPUT -i $PPPIF -p tcp =
--sport 20 --dport $UP_PORTS&nbsp; -m state --state ESTABLISHED,RELATED =
-j ACCEPT</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">iptables -A OUTPUT -o $PPPIF -p tcp =
--sport $UP_PORTS --dport 20&nbsp; -m state --state ESTABLISHED -j =
ACCEPT</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;iptables -A INPUT -i $PPPIF -p =
tcp --sport $UP_PORTS --dport $UP_PORTS&nbsp; -m state --state =
ESTABLISHED -j ACCEPT</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">iptables -A OUTPUT -o $PPPIF -p tcp =
--sport $UP_PORTS --dport $UP_PORTS&nbsp; -m state --state =
ESTABLISHED,RELATED -j ACCEPT </FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">-nal</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C25E55.03954320--


From: Eugene Joubert <eugenej@centratel.co.za>
Subject: RE: Port Forwarding and opening ports.
Date: Wed, 5 Mar 2003 08:47:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B848917C9D07D71199C5005004D778B8017BB5@TELECOMS04>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2E2E3.11E74D20"
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
To: "'ImpulseFG@netscape.net'" <ImpulseFG@netscape.net>, netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2E2E3.11E74D20
Content-Type: text/plain

On point 1 do the following rule.

 iptables -A INPUT -i local -j ACCEPT
 iptables -A OUTPUT -i local -j ACCEPT

The second rule only applies if you have your OUTPUT policy set to default
DROP.

On point 2 do the following.

I assume you want to ssh into the linux system itself. This would not need
to be natted and you say if you disable nat it works, why then still persue
natting? Any connection destined for the linux system would be "guarded" by
your input chain, as any natting is only used for connections not destined
for the local system i.e packets going through the linux box.

On point 3. 

Are you looking to ssh again. Look at your rule. Remember when making a
network TCP connection your packet contains a source and destination port.
Your source port is assigned by your operating system. It will use whatever
is not being used at that time. Your destination is the important thing to
look at. Your rule in point three refers to a source port. So if I
understand your question correctly you can simply making your --sport to
--dport in other words specify the destination port and not the source port.

I am by no means a guru but understand main principals pretty good.

Hope this helps 




-----Original Message-----
From: ImpulseFG@netscape.net [mailto:ImpulseFG@netscape.net
<mailto:ImpulseFG@netscape.net> ] 
Sent: 04 03 2003 22:56 PM
To: netfilter@lists.netfilter.org
Subject: Port Forwarding and opening ports.


I have iptables setup to port forward ftp , web, and a game server to
another server on the local network. It works great. I have also set it up
so it only accepts incoming and outgoing connections on port 22. I'm having
2 problems and a couple of questions.

1. I can ssh into the machine which is 192.168.1.1 from any computer on the
local network. But I can't run X programs without allowing all incoming and
outgoing connections on this machine. I've tried: $iptables -A INPUT -i eth1
-j ACCEPT
            $iptables -A OUTPUT -o eth1 -j ACCEPT

This wouldn't fix the problem. So I tried.
            $iptables -A INPUT -s 192.168.1.2-192.168.1.255 -j ACCEPT
            $iptables -A OUTPUT -d 192.168.1.2-192.68.1.255 -j ACCEPT

This didn't work either. Only only accepting all incomeing and outgoing
connections would.

2. I'm having problems with the nat features.
    I want to be able to ssh into the routing machine from of the local
network but I can't. I have it set to accept local connections on port 22
for udp and tcp. 
    But nat is nating the packets before it can accept them.
    The only way I am able to get them to accept them is to disable nat.
    I tried natting all the ports around 22. See the attache script but for
some reason that wouln't work either.

Does anyone have any idea how to do this?


3. Does anyone know why? iptables -A mytable -p all --sport 22 -j ACCEPT
won't work? It seems that the all keywork doesn't work at all.

I am using iptables v.1.2.5 with RH7.3 most updated kernel.

Sorry for the lenght of this post I'm just looking for some solutions.
Thanks for any help. I changed my IP in the firewall script. to 128.x.x.x
hope this doesn't confuse anyone.

                                    -Impulse



__________________________________________________________________
The NEW Netscape 7.0 browser is now available. Upgrade now!
http://channels.netscape.com/ns/browsers/download.jsp
<http://channels.netscape.com/ns/browsers/download.jsp>  

Get your own FREE, personal Netscape Mail account today at
http://webmail.netscape.com/ <http://webmail.netscape.com/>  << File:
rc.firewall-2.4.mailing >> 

------_=_NextPart_001_01C2E2E3.11E74D20
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>RE: Port Forwarding and opening ports.</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2 FACE=3D"Arial">On point 1 do the following =
rule.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;iptables -A INPUT -i local -j =
ACCEPT</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;iptables -A OUTPUT =
-</FONT><FONT SIZE=3D2 FACE=3D"Arial">i local -j ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">The second rule only applies if you =
have your OUTPUT policy set to default DROP.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">On point 2 do the following.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I assume you want to ssh into the =
linux system itself. This would not need to be natted and you say if =
you disable nat it works, why then still persue natting? Any connection =
destined for the linux system would be &quot;guarded&quot; by your =
input chain, as any natting is only used for connections not destined =
for the local system i.e packets going through the linux =
box.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">On point 3. </FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Are you looking to ssh again. Look at =
your rule. Remember when making a network TCP connection your packet =
contains a source and destination port. Your source port is assigned by =
your operating system. It will use whatever is not being used at that =
time. Your destination is the important thing to look at. Your rule in =
point three refers to a source port. So if I understand your question =
correctly you can simply making your --sport to --dport in other words =
specify the destination port and not the source port.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I am by no means a guru but understand =
main principals pretty good.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Hope this helps</FONT>=20
</P>
<BR>
<BR>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">-----Original Message-----</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">From: ImpulseFG@netscape.net =
[</FONT><A HREF=3D"mailto:ImpulseFG@netscape.net"><U><FONT =
COLOR=3D"#0000FF" SIZE=3D2 =
FACE=3D"Arial">mailto:ImpulseFG@netscape.net</FONT></U></A><FONT =
SIZE=3D2 FACE=3D"Arial">] </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Sent: 04 03 2003 22:56 PM</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">To: =
netfilter@lists.netfilter.org</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Subject: Port Forwarding and opening =
ports.</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">I have iptables setup to port forward =
ftp , web, and a game server to another server on the local network. It =
works great. I have also set it up so it only accepts incoming and =
outgoing connections on port 22. I'm having 2 problems and a couple of =
questions.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">1. I can ssh into the machine which is =
192.168.1.1 from any computer on the local network. But I can't run X =
programs without allowing all incoming and outgoing connections on this =
machine. I've tried: $iptables -A INPUT -i eth1 -j ACCEPT</FONT></P>

<P><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; $iptables -A OUTPUT -o eth1 -j ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">This wouldn't fix the problem. So I =
tried.</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; $iptables -A INPUT -s 192.168.1.2-192.168.1.255 -j =
ACCEPT</FONT>
<BR><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; $iptables -A OUTPUT -d 192.168.1.2-192.68.1.255 -j =
ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">This didn't work either. Only only =
accepting all incomeing and outgoing connections would.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">2. I'm having problems with the nat =
features.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; I want to be able =
to ssh into the routing machine from of the local network but I can't. =
I have it set to accept local connections on port 22 for udp and tcp. =
</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; But nat is nating =
the packets before it can accept them.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; The only way I am =
able to get them to accept them is to disable nat.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; I tried natting =
all the ports around 22. See the attache script but for some reason =
that wouln't work either.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Does anyone have any idea how to do =
this?</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">3. Does anyone know why? iptables -A =
mytable -p all --sport 22 -j ACCEPT won't work? It seems that the all =
keywork doesn't work at all.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I am using iptables v.1.2.5 with RH7.3 =
most updated kernel.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Sorry for the lenght of this post I'm =
just looking for some solutions. Thanks for any help. I changed my IP =
in the firewall script. to 128.x.x.x hope this doesn't confuse =
anyone.</FONT></P>

<P><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; -Impulse</FONT>
</P>
<BR>
<BR>

<P><FONT SIZE=3D2 =
FACE=3D"Arial">_________________________________________________________=
_________</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">The NEW Netscape 7.0 browser is now =
available. Upgrade now! </FONT><A =
HREF=3D"http://channels.netscape.com/ns/browsers/download.jsp"><U><FONT =
COLOR=3D"#0000FF" SIZE=3D2 =
FACE=3D"Arial">http://channels.netscape.com/ns/browsers/download.jsp</FO=
NT></U></A><FONT SIZE=3D2 FACE=3D"Arial"> </FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Get your own FREE, personal Netscape =
Mail account today at </FONT><A =
HREF=3D"http://webmail.netscape.com/"><U><FONT COLOR=3D"#0000FF" =
SIZE=3D2 =
FACE=3D"Arial">http://webmail.netscape.com/</FONT></U></A><FONT =
SIZE=3D2 FACE=3D"Arial"> &lt;&lt; File: rc.firewall-2.4.mailing =
&gt;&gt; </FONT></P>

</BODY>
</HTML>
------_=_NextPart_001_01C2E2E3.11E74D20--


From: Eugene Joubert <eugenej@centratel.co.za>
Subject: RE: Newbie: need help with table rules
Date: Fri, 14 Feb 2003 09:02:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B848917C9D07D71199C5005004D778B8017B4F@TELECOMS04>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2D3F7.15727280"
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
To: 'Jean-Christian Imbeault' <jc@mega-bucks.co.jp>, netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2D3F7.15727280
Content-Type: text/plain

Jean-Christian,

First of all you're connection SSH doesn't work  because you have got your
OUTPUT policy as DROP. Now surely if you want the linux box to return your
request you need to allow it to do so:-)
So my advice is that you should change your default OUTPUT policy to ACCEPT
and keep your INPUT as DROP. If something can't get in, it can't get out.
Hope this makes sense.

AS for you logging, I am afraid that I have not played around with my
firewall all that much in the last six months as I have someone else doing
it for me.

Hope this helps

-----Original Message-----
From: Jean-Christian Imbeault [mailto:jc@mega-bucks.co.jp] 
Sent: 14 02 2003 08:50 AM
To: netfilter@lists.netfilter.org
Subject: Newbie: need help with table rules


I've written my first set of iptable rules but they're still buggy =) I 
keep locking myself out. So I'm trying to enable logging to see why I 
can't SSH to my box but I can't seem to get logging to work.

I have set the default policy to DROP and added only ACCEPT rules, so 
nothing gets DROPPED or REJECTED before making to the last (logging) 
rule. The last rule should LOG anything that didn't match ... but I 
can't find any iptables entries in /var/log/messages ...

Two questions:

#1 why isn't logging working
#2 What is wrong with my rules :)


My network setup is like this:


LAN ---- FIREWALL ---- WAN
  |          |
  |          |
JC        LINUX

I don't control the Firewall. But it's settings are fine I think since I 
can connect from JC <-> LINUX just fine. But if I try my iptable rules I 
lock myself out.

The services I'd like to allow access to are:

HTTP, HTTPS, SMTP, DNS from anywhere and
SSH from JC --> LINUX

My rules are:

IPT="/usr/local/sbin/iptables"
LINUX="x.x.x.x"
JC="x.x.x.x"

for i in filter
do
   $IPT -t $i -F
   $IPT -t $i -X
done

$IPT --policy INPUT   DROP
$IPT --policy OUTPUT  DROP
$IPT --policy FORWARD DROP

# Loopback accepts everything
$IPT -A INPUT  -i lo   -j ACCEPT
$IPT -A OUTPUT -o lo   -j ACCEPT

# Allow all other icmp
$IPT -A INPUT  -p icmp -j ACCEPT

# Allow previously established connections
$IPT -A OUTPUT -m state --state ESTABLISHED,RELATED        -j ACCEPT

# HTTP, HTTPS
$IPT -A INPUT  -p TCP -s 0/0 -i eth0 -d $LINUX --dport 80  -j ACCEPT $IPT -A
INPUT  -p TCP -s 0/0 -i eth0 -d $LINUX --dport 443 -j ACCEPT

# SSH FROM JC --> LINUX
$IPT -A INPUT  -p TCP -s $JC -i eth0 -d $LINUX --dport 22  -j ACCEPT

# SMTP
$IPT -A INPUT  -p tcp --dport 25 --syn -m limit --limit 1/s 
--limit-burst 10 -j ACCEPT
$IPT -A INPUT  -p tcp --dport 25 -j ACCEPT

# DNS
$IPT -A INPUT  -p tcp --dport 53 -j ACCEPT
$IPT -A INPUT  -p udp --dport 53 -j ACCEPT

# LOG anything that didn't get accepted ...
$IPT -A INPUT  -p tcp --syn -m limit --limit 5/minute -j LOG --log-level 
debug --log-prefix "Firewalled packet:"

My /etc/syslog.conf has this entry to send all debug messages to 
/var/log/firewall:

kern.debug /var/log/firewall

Yet even when I telnet to my machine I don't see any iptables related 
messages ...

What did I miss to get logging enabled? (and if anyone can spot why I 
can't SSH to my box from my PC (JC) please let me know ;)

Thanks,

Jc


------_=_NextPart_001_01C2D3F7.15727280
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>RE: Newbie: need help with table rules</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Jean-Christian,</FONT>
</P>

<P><FONT SIZE=3D2>First of all you're connection SSH doesn't work&nbsp; =
because you have got your OUTPUT policy as DROP. Now surely if you want =
the linux box to return your request you need to allow it to do =
so:-)</FONT></P>

<P><FONT SIZE=3D2>So my advice is that you should change your default =
OUTPUT policy to ACCEPT and keep your INPUT as DROP. If something can't =
get in, it can't get out. Hope this makes sense.</FONT></P>

<P><FONT SIZE=3D2>AS for you logging, I am afraid that I have not =
played around with my firewall all that much in the last six months as =
I have someone else doing it for me.</FONT></P>

<P><FONT SIZE=3D2>Hope this helps</FONT>
</P>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: Jean-Christian Imbeault [<A =
HREF=3D"mailto:jc@mega-bucks.co.jp">mailto:jc@mega-bucks.co.jp</A>] =
</FONT>
<BR><FONT SIZE=3D2>Sent: 14 02 2003 08:50 AM</FONT>
<BR><FONT SIZE=3D2>To: netfilter@lists.netfilter.org</FONT>
<BR><FONT SIZE=3D2>Subject: Newbie: need help with table rules</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>I've written my first set of iptable rules but =
they're still buggy =3D) I </FONT>
<BR><FONT SIZE=3D2>keep locking myself out. So I'm trying to enable =
logging to see why I </FONT>
<BR><FONT SIZE=3D2>can't SSH to my box but I can't seem to get logging =
to work.</FONT>
</P>

<P><FONT SIZE=3D2>I have set the default policy to DROP and added only =
ACCEPT rules, so </FONT>
<BR><FONT SIZE=3D2>nothing gets DROPPED or REJECTED before making to =
the last (logging) </FONT>
<BR><FONT SIZE=3D2>rule. The last rule should LOG anything that didn't =
match ... but I </FONT>
<BR><FONT SIZE=3D2>can't find any iptables entries in /var/log/messages =
...</FONT>
</P>

<P><FONT SIZE=3D2>Two questions:</FONT>
</P>

<P><FONT SIZE=3D2>#1 why isn't logging working</FONT>
<BR><FONT SIZE=3D2>#2 What is wrong with my rules :)</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>My network setup is like this:</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>LAN ---- FIREWALL ---- WAN</FONT>
<BR><FONT SIZE=3D2>&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |</FONT>
<BR><FONT SIZE=3D2>&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |</FONT>
<BR><FONT SIZE=3D2>JC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
LINUX</FONT>
</P>

<P><FONT SIZE=3D2>I don't control the Firewall. But it's settings are =
fine I think since I </FONT>
<BR><FONT SIZE=3D2>can connect from JC &lt;-&gt; LINUX just fine. But =
if I try my iptable rules I </FONT>
<BR><FONT SIZE=3D2>lock myself out.</FONT>
</P>

<P><FONT SIZE=3D2>The services I'd like to allow access to are:</FONT>
</P>

<P><FONT SIZE=3D2>HTTP, HTTPS, SMTP, DNS from anywhere and</FONT>
<BR><FONT SIZE=3D2>SSH from JC --&gt; LINUX</FONT>
</P>

<P><FONT SIZE=3D2>My rules are:</FONT>
</P>

<P><FONT SIZE=3D2>IPT=3D&quot;/usr/local/sbin/iptables&quot;</FONT>
<BR><FONT SIZE=3D2>LINUX=3D&quot;x.x.x.x&quot;</FONT>
<BR><FONT SIZE=3D2>JC=3D&quot;x.x.x.x&quot;</FONT>
</P>

<P><FONT SIZE=3D2>for i in filter</FONT>
<BR><FONT SIZE=3D2>do</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp; $IPT -t $i -F</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp; $IPT -t $i -X</FONT>
<BR><FONT SIZE=3D2>done</FONT>
</P>

<P><FONT SIZE=3D2>$IPT --policy INPUT&nbsp;&nbsp; DROP</FONT>
<BR><FONT SIZE=3D2>$IPT --policy OUTPUT&nbsp; DROP</FONT>
<BR><FONT SIZE=3D2>$IPT --policy FORWARD DROP</FONT>
</P>

<P><FONT SIZE=3D2># Loopback accepts everything</FONT>
<BR><FONT SIZE=3D2>$IPT -A INPUT&nbsp; -i lo&nbsp;&nbsp; -j =
ACCEPT</FONT>
<BR><FONT SIZE=3D2>$IPT -A OUTPUT -o lo&nbsp;&nbsp; -j ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2># Allow all other icmp</FONT>
<BR><FONT SIZE=3D2>$IPT -A INPUT&nbsp; -p icmp -j ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2># Allow previously established connections</FONT>
<BR><FONT SIZE=3D2>$IPT -A OUTPUT -m state --state =
ESTABLISHED,RELATED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -j =
ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2># HTTP, HTTPS</FONT>
<BR><FONT SIZE=3D2>$IPT -A INPUT&nbsp; -p TCP -s 0/0 -i eth0 -d $LINUX =
--dport 80&nbsp; -j ACCEPT $IPT -A INPUT&nbsp; -p TCP -s 0/0 -i eth0 -d =
$LINUX --dport 443 -j ACCEPT</FONT></P>

<P><FONT SIZE=3D2># SSH FROM JC --&gt; LINUX</FONT>
<BR><FONT SIZE=3D2>$IPT -A INPUT&nbsp; -p TCP -s $JC -i eth0 -d $LINUX =
--dport 22&nbsp; -j ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2># SMTP</FONT>
<BR><FONT SIZE=3D2>$IPT -A INPUT&nbsp; -p tcp --dport 25 --syn -m limit =
--limit 1/s </FONT>
<BR><FONT SIZE=3D2>--limit-burst 10 -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>$IPT -A INPUT&nbsp; -p tcp --dport 25 -j =
ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2># DNS</FONT>
<BR><FONT SIZE=3D2>$IPT -A INPUT&nbsp; -p tcp --dport 53 -j =
ACCEPT</FONT>
<BR><FONT SIZE=3D2>$IPT -A INPUT&nbsp; -p udp --dport 53 -j =
ACCEPT</FONT>
</P>

<P><FONT SIZE=3D2># LOG anything that didn't get accepted ...</FONT>
<BR><FONT SIZE=3D2>$IPT -A INPUT&nbsp; -p tcp --syn -m limit --limit =
5/minute -j LOG --log-level </FONT>
<BR><FONT SIZE=3D2>debug --log-prefix &quot;Firewalled =
packet:&quot;</FONT>
</P>

<P><FONT SIZE=3D2>My /etc/syslog.conf has this entry to send all debug =
messages to </FONT>
<BR><FONT SIZE=3D2>/var/log/firewall:</FONT>
</P>

<P><FONT SIZE=3D2>kern.debug /var/log/firewall</FONT>
</P>

<P><FONT SIZE=3D2>Yet even when I telnet to my machine I don't see any =
iptables related </FONT>
<BR><FONT SIZE=3D2>messages ...</FONT>
</P>

<P><FONT SIZE=3D2>What did I miss to get logging enabled? (and if =
anyone can spot why I </FONT>
<BR><FONT SIZE=3D2>can't SSH to my box from my PC (JC) please let me =
know ;)</FONT>
</P>

<P><FONT SIZE=3D2>Thanks,</FONT>
</P>

<P><FONT SIZE=3D2>Jc</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2D3F7.15727280--


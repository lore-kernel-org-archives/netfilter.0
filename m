From: Rob Sterenborg <r.sterenborg@hsl-brabantzuid.nl>
Subject: RE: iptables accounting problem
Date: Wed, 18 Dec 2002 15:00:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B32154A93A@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2A69D.D6FCC040"
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2A69D.D6FCC040
Content-Type: text/plain

>       I'm sorry for asking this question, I red all the documentation
>       and still got no clue how to make ip accounting work.
>       I got a pc with 2 ethernet cards all traffics goes through it.
>       i created a rule like
>       iptables -N xxx.xxx.xxx.xxx
>       iptables -A input -d xxx.xxx.xxx.xxx -j xxx.xxx.xxx.xxx
>       when i type
>       iptables -L xxx.xxx.xxx.xxx -n -v
>       i get 0 traffic information. How could be? Or whereis my
>       mistake?

What if you did it like this :
iptables -A INPUT -d xxx.xxx.xxx.xxx
Then iptables -L INPUT -nv should tell you how much traffic has passed by.

You could also create your own rule of course, but I think it's overkill.
iptables -N testrule
iptables -A testrule -d xxx.xxx.xxx.xxx
iptables -A INPUT -j testrule
Then to check the traffic that passed by : iptables -L testrule -nv


Rob

------_=_NextPart_001_01C2A69D.D6FCC040
Content-Type: text/html

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=us-ascii">
<META NAME="Generator" CONTENT="MS Exchange Server version 5.5.2653.12">
<TITLE>RE: iptables accounting problem</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=2>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I'm sorry for asking this question, I red all the documentation</FONT>
<BR><FONT SIZE=2>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and still got no clue how to make ip accounting work.</FONT>
<BR><FONT SIZE=2>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I got a pc with 2 ethernet cards all traffics goes through it.</FONT>
<BR><FONT SIZE=2>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i created a rule like</FONT>
<BR><FONT SIZE=2>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables -N xxx.xxx.xxx.xxx</FONT>
<BR><FONT SIZE=2>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables -A input -d xxx.xxx.xxx.xxx -j xxx.xxx.xxx.xxx</FONT>
<BR><FONT SIZE=2>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; when i type</FONT>
<BR><FONT SIZE=2>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables -L xxx.xxx.xxx.xxx -n -v</FONT>
<BR><FONT SIZE=2>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i get 0 traffic information. How could be? Or whereis my</FONT>
<BR><FONT SIZE=2>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mistake?</FONT>
</P>

<P><FONT SIZE=2>What if you did it like this :</FONT>
<BR><FONT SIZE=2>iptables -A INPUT -d xxx.xxx.xxx.xxx</FONT>
<BR><FONT SIZE=2>Then iptables -L INPUT -nv should tell you how much traffic has passed by.</FONT>
</P>

<P><FONT SIZE=2>You could also create your own rule of course, but I think it's overkill.</FONT>
<BR><FONT SIZE=2>iptables -N testrule</FONT>
<BR><FONT SIZE=2>iptables -A testrule -d xxx.xxx.xxx.xxx</FONT>
<BR><FONT SIZE=2>iptables -A INPUT -j testrule</FONT>
<BR><FONT SIZE=2>Then to check the traffic that passed by : iptables -L testrule -nv</FONT>
</P>
<BR>

<P><FONT SIZE=2>Rob</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2A69D.D6FCC040--


From: Doug Watson <doug@1stbooks.com>
Subject: RE: intermittent and unreliable behaviour with iptables scripts
Date: Wed, 13 Nov 2002 09:34:08 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <91F7518FF779D41181A700010266356D015555DE@mail.springbound.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C28B21.B9E83620"
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
To: 'alex' <alex@bennee.com>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C28B21.B9E83620
Content-Type: text/plain;
	charset="iso-8859-1"

Thank you for your prompt response.

If there really is a bug in ip_conntrack
that makes me unfortunately skiddish about 
continuing on with netfilter/iptables as a 
viable solution for my company. Yet it seems 
like many people have implemented this and have
not seen these types of problems.

I have run the script that you sent me several times.
Attached is a sample output from it. I don't believe that
I am seeing anything too strange, but I do have 1 question.
in the following line which you will see in the attached file
what does the (policy ACCEPT 4 packets, 284 bytes) mean?
Chain OUTPUT (policy ACCEPT 4 packets, 284 bytes)

Is that the total number of packets to traverse the OUTPUT 
chain or it he number of packets ACCEPTED by the policy for the 
OUTPUT chain? Or something else?

Thank you,
Doug Watson

-----Original Message-----
From: alex [mailto:alex@bennee.com]
Sent: Monday, November 11, 2002 6:19 PM
To: Doug Watson
Cc: 'netfilter@lists.netfilter.org'
Subject: Re: intermittent and unreliable behaviour with iptables scripts


On Mon, 2002-11-11 at 17:25, Doug Watson wrote:
>  However, I along with my test group of 5 "lucky" users began to see
> some
> intermittent and unreliable behavior when accessing the internet
> through
> this new firewall most notably when browsing the web. 
> 
> When browsing the web, web pages that normally would load very quickly
> seem 
> to hang for an inconsistent amount of time, anywhere between 1 second
> to 30 seconds or more
> before they would even begin to load or would at times never load at
> all as
> if the connection to the web was lost.

This sound familiar to my own woes with port forwarded connections. I
suspect a bug in ip_conntrack that somehow causes FORWARDED packets to
end up in the output chains. I've been trying to find out exactly when
this occurs and why (and certainly why my older script worked without
problems).

You could try a using a variation of this script to monitor your
connections "live" and see which rule starts dropping when you
experience your problems. Try using it with something like watch:

    iptables -Z -t nat
    iptables -Z
    watch -n 5 -d ./dumpview

#!/bin/bash
#
# dumpview - try and see where the packets get dropped.
#
echo "DNAT Stuff"
iptables -nvL -t nat
echo "Dropped packets of normal chains"
iptables -nvL | egrep "Chain|DROP"
echo "Connections"
cat /proc/net/ip_conntrack | wc -l
echo "Web Connections"
cat /proc/net/ip_conntrack | grep "port=80" 

-- 
alex <alex@bennee.com>
My own hacking haven

------_=_NextPart_001_01C28B21.B9E83620
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
<META NAME="Generator" CONTENT="MS Exchange Server version 5.5.2654.45">
<TITLE>RE: intermittent and unreliable behaviour with iptables scripts</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=2>Thank you for your prompt response.</FONT>
</P>

<P><FONT SIZE=2>If there really is a bug in ip_conntrack</FONT>
<BR><FONT SIZE=2>that makes me unfortunately skiddish about </FONT>
<BR><FONT SIZE=2>continuing on with netfilter/iptables as a </FONT>
<BR><FONT SIZE=2>viable solution for my company. Yet it seems </FONT>
<BR><FONT SIZE=2>like many people have implemented this and have</FONT>
<BR><FONT SIZE=2>not seen these types of problems.</FONT>
</P>

<P><FONT SIZE=2>I have run the script that you sent me several times.</FONT>
<BR><FONT SIZE=2>Attached is a sample output from it. I don't believe that</FONT>
<BR><FONT SIZE=2>I am seeing anything too strange, but I do have 1 question.</FONT>
<BR><FONT SIZE=2>in the following line which you will see in the attached file</FONT>
<BR><FONT SIZE=2>what does the (policy ACCEPT 4 packets, 284 bytes) mean?</FONT>
<BR><FONT SIZE=2>Chain OUTPUT (policy ACCEPT 4 packets, 284 bytes)</FONT>
</P>

<P><FONT SIZE=2>Is that the total number of packets to traverse the OUTPUT </FONT>
<BR><FONT SIZE=2>chain or it he number of packets ACCEPTED by the policy for the </FONT>
<BR><FONT SIZE=2>OUTPUT chain? Or something else?</FONT>
</P>

<P><FONT SIZE=2>Thank you,</FONT>
<BR><FONT SIZE=2>Doug Watson</FONT>
</P>

<P><FONT SIZE=2>-----Original Message-----</FONT>
<BR><FONT SIZE=2>From: alex [<A HREF="mailto:alex@bennee.com">mailto:alex@bennee.com</A>]</FONT>
<BR><FONT SIZE=2>Sent: Monday, November 11, 2002 6:19 PM</FONT>
<BR><FONT SIZE=2>To: Doug Watson</FONT>
<BR><FONT SIZE=2>Cc: 'netfilter@lists.netfilter.org'</FONT>
<BR><FONT SIZE=2>Subject: Re: intermittent and unreliable behaviour with iptables scripts</FONT>
</P>
<BR>

<P><FONT SIZE=2>On Mon, 2002-11-11 at 17:25, Doug Watson wrote:</FONT>
<BR><FONT SIZE=2>&gt;&nbsp; However, I along with my test group of 5 &quot;lucky&quot; users began to see</FONT>
<BR><FONT SIZE=2>&gt; some</FONT>
<BR><FONT SIZE=2>&gt; intermittent and unreliable behavior when accessing the internet</FONT>
<BR><FONT SIZE=2>&gt; through</FONT>
<BR><FONT SIZE=2>&gt; this new firewall most notably when browsing the web. </FONT>
<BR><FONT SIZE=2>&gt; </FONT>
<BR><FONT SIZE=2>&gt; When browsing the web, web pages that normally would load very quickly</FONT>
<BR><FONT SIZE=2>&gt; seem </FONT>
<BR><FONT SIZE=2>&gt; to hang for an inconsistent amount of time, anywhere between 1 second</FONT>
<BR><FONT SIZE=2>&gt; to 30 seconds or more</FONT>
<BR><FONT SIZE=2>&gt; before they would even begin to load or would at times never load at</FONT>
<BR><FONT SIZE=2>&gt; all as</FONT>
<BR><FONT SIZE=2>&gt; if the connection to the web was lost.</FONT>
</P>

<P><FONT SIZE=2>This sound familiar to my own woes with port forwarded connections. I</FONT>
<BR><FONT SIZE=2>suspect a bug in ip_conntrack that somehow causes FORWARDED packets to</FONT>
<BR><FONT SIZE=2>end up in the output chains. I've been trying to find out exactly when</FONT>
<BR><FONT SIZE=2>this occurs and why (and certainly why my older script worked without</FONT>
<BR><FONT SIZE=2>problems).</FONT>
</P>

<P><FONT SIZE=2>You could try a using a variation of this script to monitor your</FONT>
<BR><FONT SIZE=2>connections &quot;live&quot; and see which rule starts dropping when you</FONT>
<BR><FONT SIZE=2>experience your problems. Try using it with something like watch:</FONT>
</P>

<P><FONT SIZE=2>&nbsp;&nbsp;&nbsp; iptables -Z -t nat</FONT>
<BR><FONT SIZE=2>&nbsp;&nbsp;&nbsp; iptables -Z</FONT>
<BR><FONT SIZE=2>&nbsp;&nbsp;&nbsp; watch -n 5 -d ./dumpview</FONT>
</P>

<P><FONT SIZE=2>#!/bin/bash</FONT>
<BR><FONT SIZE=2>#</FONT>
<BR><FONT SIZE=2># dumpview - try and see where the packets get dropped.</FONT>
<BR><FONT SIZE=2>#</FONT>
<BR><FONT SIZE=2>echo &quot;DNAT Stuff&quot;</FONT>
<BR><FONT SIZE=2>iptables -nvL -t nat</FONT>
<BR><FONT SIZE=2>echo &quot;Dropped packets of normal chains&quot;</FONT>
<BR><FONT SIZE=2>iptables -nvL | egrep &quot;Chain|DROP&quot;</FONT>
<BR><FONT SIZE=2>echo &quot;Connections&quot;</FONT>
<BR><FONT SIZE=2>cat /proc/net/ip_conntrack | wc -l</FONT>
<BR><FONT SIZE=2>echo &quot;Web Connections&quot;</FONT>
<BR><FONT SIZE=2>cat /proc/net/ip_conntrack | grep &quot;port=80&quot; </FONT>
</P>

<P><FONT SIZE=2>-- </FONT>
<BR><FONT SIZE=2>alex &lt;alex@bennee.com&gt;</FONT>
<BR><FONT SIZE=2>My own hacking haven</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C28B21.B9E83620--


From: Doug Watson <doug@1stbooks.com>
Subject: RE: intermittent and unreliable behaviour with iptables scripts
Date: Wed, 13 Nov 2002 10:01:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <91F7518FF779D41181A700010266356D015555E1@mail.springbound.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C28B25.7DC6DA30"
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
To: "'netfilter@newkirk.us'" <netfilter@newkirk.us>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C28B25.7DC6DA30
Content-Type: text/plain;
	charset="iso-8859-1"

Thanks for your input.

I unfortunately have had litte chance the last day or two to 
actually put to use the advise given by you and the others who
have sent me feedback due to MEETINGS! 

2 Things you seem to ofer several suggestions regarding reconfiguring
my iptables script that I will attempt to implement and evaluate. I 
may have some questions in a day or so when I attempt to do this.

Also you asked me if I had checked /proc/net/ip_conntrack. What should I be
looking for in ip_conntrack? One thing I did notice in ip_conntrack is
packets
with a destination of xxx.xxx.xxx.255. I believe this to be broadcast
traffic from
some of our workstations. We are working to track this down and stop it. 
What do you see as a possible impact of this broadcast traffic. I have yet
to see that
ip_conntrack has filled up.

Thank you,
Doug Watson
-----Original Message-----
From: Joel Newkirk [mailto:netfilter@newkirk.us]
Sent: Tuesday, November 12, 2002 1:31 AM
To: Doug Watson; 'netfilter@lists.netfilter.org'
Subject: Re: intermittent and unreliable behaviour with iptables scripts


On Monday 11 November 2002 12:25 pm, Doug Watson wrote:
> Fellow list users,
>
> I have been attempting to set up a new firewall for my company with the
> two goals of 1. implementing statefull packet filtering and 2.
> creating a DMZ for servers that need to be accessed by the
> outside world, such as HTTP, SMTP, DNS and FTP.
>
> There seems to be a lot to describe here so please stick with me.

OK, but I'm going to snip liberally... :^)

> When browsing the web, web pages that normally would load very quickly
seem
> to hang for an inconsistent amount of time, anywhere between 1 second to
30

> I will note that when the firewall is in the state that no web pages will
> load, pings to its LAN interface which usually return in about 1ms will
> time timeout, but I have not been able to link this to any specific
network

So the problem is probably occurring in PREROUTING or routing, since it hits

both forward and input packets. Try inserting in nat prerouting and filter 
forward and input:

$IPTABLES -t filter -I FORWARD 1 -i $LAN_IFACE -p ICMP -j LOG --log-level 
debug --log-prefix "IPT:SlowPingFront: "
$IPTABLES -t filter -I FORWARD 1 -o $LAN_IFACE -p ICMP -j LOG --log-level 
debug --log-prefix "IPT:SlowPingBack: "

Reproduce your problem and slow ping (-i 10 perhaps, -w 10000 from windows) 
from the lan to the firewall and beyond, and see what picture the log
paints.  
If the ping is just dying somewhere you can (hopefully) see it's trail.  If 
it's really slow (several seconds) you've hopefully narrowed it down to
WHERE 
it's slowing.

Check /proc/net/ip_conntrack, general memory issues, and top.

> Also overall speed of our connection seems to be noticeably slower when
> running through this firewall. One example be it a good one or not is
> when running the high speed bandwidth test at
http://www.bandwidthplace.com
> through the current firewall the average speed returned is between 1.0 and

> same test through the new iptables based firewall the average speed
> returned usually in the range of 600 to 800 Kbps.

This is quite possibly the same thing as above, just in a less intrusive
part 
of the cycle...  However, I had a few suggestions on your forward and 
bad_tcp_packets chains.

- disclaimer -
below is largely feng shui firewalling.  After a dozen readings of your 
firewall (cigarette breaks outside :^) it just didn't 'feel' right, and the 
changes below 'improve the flow' and 'feel right' often without any firm 
justification.  (along with some clarity and simplicity)  However, you DID 
ask for thoughts in general...
- /disclaimer -

Move the spoof tests from bad_tcp_packets to their own chain, or just move
the 
state tests directly to the start of forward and input.  (Do you need them 
for output?  You certainly don't need to test for -i $INET_IFACE in 
output...)  Call the spoof tests next, to catch both $LAN and $DMZ bound 
spoofs.

You currently accept EST/REL from $INET back to $DMZ, then have tests for
new 
connections on that route, then blanket EST/REL.  Make your unrestricted 
EST/REL rule next instead, followed by your $LAN accept rule, unless you
want 
to block otherwise valid EST/REL involving the DMZ, in which case the 
following two rules have to come before the EST/REL.  -i $LAN -o $DMZ ACCEPT

is redundant, picked up in the -i $LAN ACCEPT that follows in your current 
sequence, and EST/REL -i $INET -o $DMZ or -o $LAN are subsumed in the
blanket 
accept.

Follow this up with a jump for -o $DMZ_IFACE -j DMZin, then  -o $DMZ_IFACE
-j 
DMZout.  and move all appropriate rules to those chains.  Now you can treat 
DMZin almost like INPUT for the DMZ, and DMZout like OUTPUT, and keep all
DMZ 
rules separate from lan<->inet.  You can easily insert/remove a blanket 
accept/reject/drop/return target at the head, or add 'policy' at the end.  
All that these rules need to test now is protocol related, the other 3 
matches for each -i $INET rule are eliminated.  (unless you later use -d or 
-p to filter various DMZ forwards differently)  Also, if you have this
before 
your EST/REL then the DMZ chains should each get their own EST/REL at their 
end, before any 'policy' rule.

Finish out with your log rule.  Don't forget to change INPUT (and OUTPUT) to

reflect the removal of bad_tcp_packets, if you integrated the state rules.

Thus ends today's session of Feng Shui Firewalling.  :^)  The resulting
script 
is simpler and more easily modified than currently, and the process is 
simpler than the instructions.  As far as I see, it achieves the same 
filtering and forwarding as your current script with potentially far less 
rule tests per packet, but if I've missed something somebody please correct 
me.

j

------_=_NextPart_001_01C28B25.7DC6DA30
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

<P><FONT SIZE=2>Thanks for your input.</FONT>
</P>

<P><FONT SIZE=2>I unfortunately have had litte chance the last day or two to </FONT>
<BR><FONT SIZE=2>actually put to use the advise given by you and the others who</FONT>
<BR><FONT SIZE=2>have sent me feedback due to MEETINGS! </FONT>
</P>

<P><FONT SIZE=2>2 Things you seem to ofer several suggestions regarding reconfiguring</FONT>
<BR><FONT SIZE=2>my iptables script that I will attempt to implement and evaluate. I </FONT>
<BR><FONT SIZE=2>may have some questions in a day or so when I attempt to do this.</FONT>
</P>

<P><FONT SIZE=2>Also you asked me if I had checked /proc/net/ip_conntrack. What should I be</FONT>
<BR><FONT SIZE=2>looking for in ip_conntrack? One thing I did notice in ip_conntrack is packets</FONT>
<BR><FONT SIZE=2>with a destination of xxx.xxx.xxx.255. I believe this to be broadcast traffic from</FONT>
<BR><FONT SIZE=2>some of our workstations. We are working to track this down and stop it. </FONT>
<BR><FONT SIZE=2>What do you see as a possible impact of this broadcast traffic. I have yet to see that</FONT>
<BR><FONT SIZE=2>ip_conntrack has filled up.</FONT>
</P>

<P><FONT SIZE=2>Thank you,</FONT>
<BR><FONT SIZE=2>Doug Watson</FONT>
<BR><FONT SIZE=2>-----Original Message-----</FONT>
<BR><FONT SIZE=2>From: Joel Newkirk [<A HREF="mailto:netfilter@newkirk.us">mailto:netfilter@newkirk.us</A>]</FONT>
<BR><FONT SIZE=2>Sent: Tuesday, November 12, 2002 1:31 AM</FONT>
<BR><FONT SIZE=2>To: Doug Watson; 'netfilter@lists.netfilter.org'</FONT>
<BR><FONT SIZE=2>Subject: Re: intermittent and unreliable behaviour with iptables scripts</FONT>
</P>
<BR>

<P><FONT SIZE=2>On Monday 11 November 2002 12:25 pm, Doug Watson wrote:</FONT>
<BR><FONT SIZE=2>&gt; Fellow list users,</FONT>
<BR><FONT SIZE=2>&gt;</FONT>
<BR><FONT SIZE=2>&gt; I have been attempting to set up a new firewall for my company with the</FONT>
<BR><FONT SIZE=2>&gt; two goals of 1. implementing statefull packet filtering and 2.</FONT>
<BR><FONT SIZE=2>&gt; creating a DMZ for servers that need to be accessed by the</FONT>
<BR><FONT SIZE=2>&gt; outside world, such as HTTP, SMTP, DNS and FTP.</FONT>
<BR><FONT SIZE=2>&gt;</FONT>
<BR><FONT SIZE=2>&gt; There seems to be a lot to describe here so please stick with me.</FONT>
</P>

<P><FONT SIZE=2>OK, but I'm going to snip liberally... :^)</FONT>
</P>

<P><FONT SIZE=2>&gt; When browsing the web, web pages that normally would load very quickly seem</FONT>
<BR><FONT SIZE=2>&gt; to hang for an inconsistent amount of time, anywhere between 1 second to 30</FONT>
</P>

<P><FONT SIZE=2>&gt; I will note that when the firewall is in the state that no web pages will</FONT>
<BR><FONT SIZE=2>&gt; load, pings to its LAN interface which usually return in about 1ms will</FONT>
<BR><FONT SIZE=2>&gt; time timeout, but I have not been able to link this to any specific network</FONT>
</P>

<P><FONT SIZE=2>So the problem is probably occurring in PREROUTING or routing, since it hits </FONT>
<BR><FONT SIZE=2>both forward and input packets. Try inserting in nat prerouting and filter </FONT>
<BR><FONT SIZE=2>forward and input:</FONT>
</P>

<P><FONT SIZE=2>$IPTABLES -t filter -I FORWARD 1 -i $LAN_IFACE -p ICMP -j LOG --log-level </FONT>
<BR><FONT SIZE=2>debug --log-prefix &quot;IPT:SlowPingFront: &quot;</FONT>
<BR><FONT SIZE=2>$IPTABLES -t filter -I FORWARD 1 -o $LAN_IFACE -p ICMP -j LOG --log-level </FONT>
<BR><FONT SIZE=2>debug --log-prefix &quot;IPT:SlowPingBack: &quot;</FONT>
</P>

<P><FONT SIZE=2>Reproduce your problem and slow ping (-i 10 perhaps, -w 10000 from windows) </FONT>
<BR><FONT SIZE=2>from the lan to the firewall and beyond, and see what picture the log paints.&nbsp; </FONT>
<BR><FONT SIZE=2>If the ping is just dying somewhere you can (hopefully) see it's trail.&nbsp; If </FONT>
<BR><FONT SIZE=2>it's really slow (several seconds) you've hopefully narrowed it down to WHERE </FONT>
<BR><FONT SIZE=2>it's slowing.</FONT>
</P>

<P><FONT SIZE=2>Check /proc/net/ip_conntrack, general memory issues, and top.</FONT>
</P>

<P><FONT SIZE=2>&gt; Also overall speed of our connection seems to be noticeably slower when</FONT>
<BR><FONT SIZE=2>&gt; running through this firewall. One example be it a good one or not is</FONT>
<BR><FONT SIZE=2>&gt; when running the high speed bandwidth test at <A HREF="http://www.bandwidthplace.com" TARGET="_blank">http://www.bandwidthplace.com</A></FONT>
<BR><FONT SIZE=2>&gt; through the current firewall the average speed returned is between 1.0 and</FONT>
</P>

<P><FONT SIZE=2>&gt; same test through the new iptables based firewall the average speed</FONT>
<BR><FONT SIZE=2>&gt; returned usually in the range of 600 to 800 Kbps.</FONT>
</P>

<P><FONT SIZE=2>This is quite possibly the same thing as above, just in a less intrusive part </FONT>
<BR><FONT SIZE=2>of the cycle...&nbsp; However, I had a few suggestions on your forward and </FONT>
<BR><FONT SIZE=2>bad_tcp_packets chains.</FONT>
</P>

<P><FONT SIZE=2>- disclaimer -</FONT>
<BR><FONT SIZE=2>below is largely feng shui firewalling.&nbsp; After a dozen readings of your </FONT>
<BR><FONT SIZE=2>firewall (cigarette breaks outside :^) it just didn't 'feel' right, and the </FONT>
<BR><FONT SIZE=2>changes below 'improve the flow' and 'feel right' often without any firm </FONT>
<BR><FONT SIZE=2>justification.&nbsp; (along with some clarity and simplicity)&nbsp; However, you DID </FONT>
<BR><FONT SIZE=2>ask for thoughts in general...</FONT>
<BR><FONT SIZE=2>- /disclaimer -</FONT>
</P>

<P><FONT SIZE=2>Move the spoof tests from bad_tcp_packets to their own chain, or just move the </FONT>
<BR><FONT SIZE=2>state tests directly to the start of forward and input.&nbsp; (Do you need them </FONT>
<BR><FONT SIZE=2>for output?&nbsp; You certainly don't need to test for -i $INET_IFACE in </FONT>
<BR><FONT SIZE=2>output...)&nbsp; Call the spoof tests next, to catch both $LAN and $DMZ bound </FONT>
<BR><FONT SIZE=2>spoofs.</FONT>
</P>

<P><FONT SIZE=2>You currently accept EST/REL from $INET back to $DMZ, then have tests for new </FONT>
<BR><FONT SIZE=2>connections on that route, then blanket EST/REL.&nbsp; Make your unrestricted </FONT>
<BR><FONT SIZE=2>EST/REL rule next instead, followed by your $LAN accept rule, unless you want </FONT>
<BR><FONT SIZE=2>to block otherwise valid EST/REL involving the DMZ, in which case the </FONT>
<BR><FONT SIZE=2>following two rules have to come before the EST/REL.&nbsp; -i $LAN -o $DMZ ACCEPT </FONT>
<BR><FONT SIZE=2>is redundant, picked up in the -i $LAN ACCEPT that follows in your current </FONT>
<BR><FONT SIZE=2>sequence, and EST/REL -i $INET -o $DMZ or -o $LAN are subsumed in the blanket </FONT>
<BR><FONT SIZE=2>accept.</FONT>
</P>

<P><FONT SIZE=2>Follow this up with a jump for -o $DMZ_IFACE -j DMZin, then&nbsp; -o $DMZ_IFACE -j </FONT>
<BR><FONT SIZE=2>DMZout.&nbsp; and move all appropriate rules to those chains.&nbsp; Now you can treat </FONT>
<BR><FONT SIZE=2>DMZin almost like INPUT for the DMZ, and DMZout like OUTPUT, and keep all DMZ </FONT>
<BR><FONT SIZE=2>rules separate from lan&lt;-&gt;inet.&nbsp; You can easily insert/remove a blanket </FONT>
<BR><FONT SIZE=2>accept/reject/drop/return target at the head, or add 'policy' at the end.&nbsp; </FONT>
<BR><FONT SIZE=2>All that these rules need to test now is protocol related, the other 3 </FONT>
<BR><FONT SIZE=2>matches for each -i $INET rule are eliminated.&nbsp; (unless you later use -d or </FONT>
<BR><FONT SIZE=2>-p to filter various DMZ forwards differently)&nbsp; Also, if you have this before </FONT>
<BR><FONT SIZE=2>your EST/REL then the DMZ chains should each get their own EST/REL at their </FONT>
<BR><FONT SIZE=2>end, before any 'policy' rule.</FONT>
</P>

<P><FONT SIZE=2>Finish out with your log rule.&nbsp; Don't forget to change INPUT (and OUTPUT) to </FONT>
<BR><FONT SIZE=2>reflect the removal of bad_tcp_packets, if you integrated the state rules.</FONT>
</P>

<P><FONT SIZE=2>Thus ends today's session of Feng Shui Firewalling.&nbsp; :^)&nbsp; The resulting script </FONT>
<BR><FONT SIZE=2>is simpler and more easily modified than currently, and the process is </FONT>
<BR><FONT SIZE=2>simpler than the instructions.&nbsp; As far as I see, it achieves the same </FONT>
<BR><FONT SIZE=2>filtering and forwarding as your current script with potentially far less </FONT>
<BR><FONT SIZE=2>rule tests per packet, but if I've missed something somebody please correct </FONT>
<BR><FONT SIZE=2>me.</FONT>
</P>

<P><FONT SIZE=2>j</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C28B25.7DC6DA30--


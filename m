From: Doug Watson <doug@1stbooks.com>
Subject: RE: intermittent and unreliable behaviour with iptables scripts
Date: Fri, 15 Nov 2002 10:14:14 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <91F7518FF779D41181A700010266356D015555ED@mail.springbound.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C28CB9.A8B11090"
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
Cc: netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C28CB9.A8B11090
Content-Type: text/plain;
	charset="iso-8859-1"

Thanks for the response. What you mentioned in your first
paragraph was and may still be part of my problem.

Per the suggestion of another list user I am on the trail
of RELATED packets that may be getting DROPped. I think that 
I have adjusted my rules in the INPUT, OUTPUT and FORWARD
chains properly to allow for this. 

But the latest development in the enigma that surrounds my firewall is this.

For one, I did not know where packets were being logged when the --log-level
option
was set to DEBUG. Can anyone clarify this for me?
 
More importantly I simply removed the --log-level option from my logging 
rule in the FORWARD chain prior to a drop by the FORWARD chains policy
(DROP)
so that they would be logged to /var/log/messages where I could find them.
What I have seen both disturbs and confuses me terribly. 
I am seeing packets that have a source address from my LAN that are destined
to an external network that are hitting the firewall on its WAN interface
(eth2) rather
than its LAN interface (eth0) and being DROPped by the FORWARD chain's
policy. 
I would think that these packets should be incoming on the firewall's LAN
interface.
This seems to coincide with the intermittent and unreliable performance that
I have
been seeing.
For example yesterday I was at the console of the firewall and using
tail -f /var/log/messages to see what was being logged and tcpdump I started
seeing
these packets being logged when someone was attempting to browse the
internet and could not.
Eventually without explanation that person was able to get through to some
web pages and when
this happened I stopped seeing these packets being logged and dropped.

My set up is a tad screwy in that I am trying to test this along side my
current production firewall and
I only have 1 source of bandwidth which comes and goes through a Cisco 2621
router. I have the ethernet
from the Cisco plugged into a 3Com 3300 switch. I also have the current
firewalls external interface
plugged into this switch along with some of our servers. I also have the LAN
and WAN interfaces of the 
firewall in question plugged into this switch. The switch is unlinked via
fiber to the rest of the
network. In the end I would have the ethernet from the Cisco plugged
directly into the WAN interface
of the new (questionable) firewall. 

That being said has anyone seen the situation described above before? Do you
think that my switch or atleast a 
port on the switch could be to blame for these packets arriving on the wrong
interface if
that is what truly is happening.

Thank you,
Doug Watson
Director of Information Systems
1stBooks Library
http://www.1stbooks.com
dwatson@1stbooks.com
1 800 839 8640 Toll Free
1 812 339 6554 Fax


-----Original Message-----
From: alex [mailto:alex@bennee.com]
Sent: Wednesday, November 13, 2002 5:48 PM
To: Doug Watson
Cc: netfilter@lists.netfilter.org
Subject: RE: intermittent and unreliable behaviour with iptables scripts


On Wed, 2002-11-13 at 14:34, Doug Watson wrote:
> If there really is a bug in ip_conntrack
> that makes me unfortunately skiddish about 
> continuing on with netfilter/iptables as a 
> viable solution for my company. Yet it seems 
> like many people have implemented this and have
> not seen these types of problems.

Agreed. I finally solved my problem which was due to me not allowing
ICMP packets to sent out the OUTPUT chain for established connections
that where being forwarded. My bad, *not* a conntrack problem, it just
seemed that way at the time.

> I have run the script that you sent me several times.
> Attached is a sample output from it. I don't believe that
> I am seeing anything too strange, but I do have 1 question.
> in the following line which you will see in the attached file
> what does the (policy ACCEPT 4 packets, 284 bytes) mean?
> Chain OUTPUT (policy ACCEPT 4 packets, 284 bytes)

Your attachment seems to of been filtered out. The policy lines mean
that no rules in the chain matched and therefor the default policy took
effect. It is usually recommended to have a default DROP policy if your
being paranoid and explicitly allow the connections you want to come
through. However as I learnt the hard way you have to make sure the
related traffic is also allowed through. The ICMP packet that bit me was
due to fragmentation being required but not possible on the gateway,
probably a symptom of the fact my two interfaces (ppp and eth) had
different MTU's. 

> Is that the total number of packets to traverse the OUTPUT 
> chain or it he number of packets ACCEPTED by the policy for the 
> OUTPUT chain? Or something else?

Just the packets that defaulted to the policy, the other counts will be
against each rule itself.

-- 
Alex
http://www.bennee.com/~alex/

------_=_NextPart_001_01C28CB9.A8B11090
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

<P><FONT SIZE=2>Thanks for the response. What you mentioned in your first</FONT>
<BR><FONT SIZE=2>paragraph was and may still be part of my problem.</FONT>
</P>

<P><FONT SIZE=2>Per the suggestion of another list user I am on the trail</FONT>
<BR><FONT SIZE=2>of RELATED packets that may be getting DROPped. I think that </FONT>
<BR><FONT SIZE=2>I have adjusted my rules in the INPUT, OUTPUT and FORWARD</FONT>
<BR><FONT SIZE=2>chains properly to allow for this. </FONT>
</P>

<P><FONT SIZE=2>But the latest development in the enigma that surrounds my firewall is this. </FONT>
<BR><FONT SIZE=2>For one, I did not know where packets were being logged when the --log-level option</FONT>
<BR><FONT SIZE=2>was set to DEBUG. Can anyone clarify this for me?</FONT>
<BR><FONT SIZE=2>&nbsp;</FONT>
<BR><FONT SIZE=2>More importantly I simply removed the --log-level option from my logging </FONT>
<BR><FONT SIZE=2>rule in the FORWARD chain prior to a drop by the FORWARD chains policy (DROP)</FONT>
<BR><FONT SIZE=2>so that they would be logged to /var/log/messages where I could find them.</FONT>
<BR><FONT SIZE=2>What I have seen both disturbs and confuses me terribly. </FONT>
<BR><FONT SIZE=2>I am seeing packets that have a source address from my LAN that are destined</FONT>
<BR><FONT SIZE=2>to an external network that are hitting the firewall on its WAN interface (eth2) rather</FONT>
<BR><FONT SIZE=2>than its LAN interface (eth0) and being DROPped by the FORWARD chain's policy. </FONT>
<BR><FONT SIZE=2>I would think that these packets should be incoming on the firewall's LAN interface.</FONT>
<BR><FONT SIZE=2>This seems to coincide with the intermittent and unreliable performance that I have</FONT>
<BR><FONT SIZE=2>been seeing.</FONT>
<BR><FONT SIZE=2>For example yesterday I was at the console of the firewall and using</FONT>
<BR><FONT SIZE=2>tail -f /var/log/messages to see what was being logged and tcpdump I started seeing</FONT>
<BR><FONT SIZE=2>these packets being logged when someone was attempting to browse the internet and could not.</FONT>
<BR><FONT SIZE=2>Eventually without explanation that person was able to get through to some web pages and when</FONT>
<BR><FONT SIZE=2>this happened I stopped seeing these packets being logged and dropped.</FONT>
</P>

<P><FONT SIZE=2>My set up is a tad screwy in that I am trying to test this along side my current production firewall and</FONT>
<BR><FONT SIZE=2>I only have 1 source of bandwidth which comes and goes through a Cisco 2621 router. I have the ethernet</FONT>
<BR><FONT SIZE=2>from the Cisco plugged into a 3Com 3300 switch. I also have the current firewalls external interface</FONT>
<BR><FONT SIZE=2>plugged into this switch along with some of our servers. I also have the LAN and WAN interfaces of the </FONT>
<BR><FONT SIZE=2>firewall in question plugged into this switch. The switch is unlinked via fiber to the rest of the</FONT>
<BR><FONT SIZE=2>network. In the end I would have the ethernet from the Cisco plugged directly into the WAN interface</FONT>
<BR><FONT SIZE=2>of the new (questionable) firewall. </FONT>
</P>

<P><FONT SIZE=2>That being said has anyone seen the situation described above before? Do you think that my switch or atleast a </FONT>
<BR><FONT SIZE=2>port on the switch could be to blame for these packets arriving on the wrong interface if</FONT>
<BR><FONT SIZE=2>that is what truly is happening.</FONT>
</P>

<P><FONT SIZE=2>Thank you,</FONT>
<BR><FONT SIZE=2>Doug Watson</FONT>
<BR><FONT SIZE=2>Director of Information Systems</FONT>
<BR><FONT SIZE=2>1stBooks Library</FONT>
<BR><FONT SIZE=2><A HREF="http://www.1stbooks.com" TARGET="_blank">http://www.1stbooks.com</A></FONT>
<BR><FONT SIZE=2>dwatson@1stbooks.com</FONT>
<BR><FONT SIZE=2>1 800 839 8640 Toll Free</FONT>
<BR><FONT SIZE=2>1 812 339 6554 Fax</FONT>
</P>
<BR>

<P><FONT SIZE=2>-----Original Message-----</FONT>
<BR><FONT SIZE=2>From: alex [<A HREF="mailto:alex@bennee.com">mailto:alex@bennee.com</A>]</FONT>
<BR><FONT SIZE=2>Sent: Wednesday, November 13, 2002 5:48 PM</FONT>
<BR><FONT SIZE=2>To: Doug Watson</FONT>
<BR><FONT SIZE=2>Cc: netfilter@lists.netfilter.org</FONT>
<BR><FONT SIZE=2>Subject: RE: intermittent and unreliable behaviour with iptables scripts</FONT>
</P>
<BR>

<P><FONT SIZE=2>On Wed, 2002-11-13 at 14:34, Doug Watson wrote:</FONT>
<BR><FONT SIZE=2>&gt; If there really is a bug in ip_conntrack</FONT>
<BR><FONT SIZE=2>&gt; that makes me unfortunately skiddish about </FONT>
<BR><FONT SIZE=2>&gt; continuing on with netfilter/iptables as a </FONT>
<BR><FONT SIZE=2>&gt; viable solution for my company. Yet it seems </FONT>
<BR><FONT SIZE=2>&gt; like many people have implemented this and have</FONT>
<BR><FONT SIZE=2>&gt; not seen these types of problems.</FONT>
</P>

<P><FONT SIZE=2>Agreed. I finally solved my problem which was due to me not allowing</FONT>
<BR><FONT SIZE=2>ICMP packets to sent out the OUTPUT chain for established connections</FONT>
<BR><FONT SIZE=2>that where being forwarded. My bad, *not* a conntrack problem, it just</FONT>
<BR><FONT SIZE=2>seemed that way at the time.</FONT>
</P>

<P><FONT SIZE=2>&gt; I have run the script that you sent me several times.</FONT>
<BR><FONT SIZE=2>&gt; Attached is a sample output from it. I don't believe that</FONT>
<BR><FONT SIZE=2>&gt; I am seeing anything too strange, but I do have 1 question.</FONT>
<BR><FONT SIZE=2>&gt; in the following line which you will see in the attached file</FONT>
<BR><FONT SIZE=2>&gt; what does the (policy ACCEPT 4 packets, 284 bytes) mean?</FONT>
<BR><FONT SIZE=2>&gt; Chain OUTPUT (policy ACCEPT 4 packets, 284 bytes)</FONT>
</P>

<P><FONT SIZE=2>Your attachment seems to of been filtered out. The policy lines mean</FONT>
<BR><FONT SIZE=2>that no rules in the chain matched and therefor the default policy took</FONT>
<BR><FONT SIZE=2>effect. It is usually recommended to have a default DROP policy if your</FONT>
<BR><FONT SIZE=2>being paranoid and explicitly allow the connections you want to come</FONT>
<BR><FONT SIZE=2>through. However as I learnt the hard way you have to make sure the</FONT>
<BR><FONT SIZE=2>related traffic is also allowed through. The ICMP packet that bit me was</FONT>
<BR><FONT SIZE=2>due to fragmentation being required but not possible on the gateway,</FONT>
<BR><FONT SIZE=2>probably a symptom of the fact my two interfaces (ppp and eth) had</FONT>
<BR><FONT SIZE=2>different MTU's. </FONT>
</P>

<P><FONT SIZE=2>&gt; Is that the total number of packets to traverse the OUTPUT </FONT>
<BR><FONT SIZE=2>&gt; chain or it he number of packets ACCEPTED by the policy for the </FONT>
<BR><FONT SIZE=2>&gt; OUTPUT chain? Or something else?</FONT>
</P>

<P><FONT SIZE=2>Just the packets that defaulted to the policy, the other counts will be</FONT>
<BR><FONT SIZE=2>against each rule itself.</FONT>
</P>

<P><FONT SIZE=2>-- </FONT>
<BR><FONT SIZE=2>Alex</FONT>
<BR><FONT SIZE=2><A HREF="http://www.bennee.com/~alex/" TARGET="_blank">http://www.bennee.com/~alex/</A></FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C28CB9.A8B11090--


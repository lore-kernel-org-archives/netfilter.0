From: "Andrew Kraslavsky" <andykras@hotmail.com>
Subject: Re: Blocking direct private IP address
Date: Thu, 01 Mar 2007 10:59:00 -0800
Message-ID: <BAY119-F1661D1CA6F86B692550992D6800@phx.gbl>
References: <Pine.LNX.4.61.0703011343580.23355@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0703011343580.23355@yvahk01.tjqt.qr>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jengelh@linux01.gwdg.de
Cc: netfilter@lists.netfilter.org

>From: Jan Engelhardt <jengelh@linux01.gwdg.de>
>To: Andrew Kraslavsky <andykras@hotmail.com>
>CC: netfilter@lists.netfilter.org
>Subject: Re: Blocking direct private IP address
>Date: Thu, 1 Mar 2007 13:51:18 +0100 (MET)
>
>
>On Feb 28 2007 20:49, Andrew Kraslavsky wrote:
>
> > The DNAT rule is wokring as I expect it to -- it exposes the private Web
> > server at 192.168.0.99 to the public network as if its address was
> > 10.0.0.1.  Meaning, folks surfing to http://10.0.0.1 are actually being
> > serviced by the Web server at 192.168.0.0.99.
> >
> > My focus here is really on how to differentiate traffic that gets
> > DNATted from 10.0.0.1 to 192.168.0.99 from traffic that was actually
> > directly addressed to 192.168.0.99.
>
>You cannot really. (There is stuff like CLUSTERIP and OpenVZ, and all
>that, but I guess that goes beyond the scope of ease.)
>
> > In both cases, by the time the packet arrives in the filter table 
>FORWARD
> > chain, the destination is simply 192.168.0.99, there is no trace of the
> > original pre-DNAT IP address, if any....at least, that is where I got 
>stuck
> > anyway.
>
>10.0.0.1# iptables [-t mangle] -A FORWARD -d 192.168.0.99 -m conntrack
>	  --ctorigdst 10.0.0.1 [-j MARK ...]
>
>would be one rule to match such. However, I don't see how that would help
>0.99 identify a packet as being DNATed by a box before it.
>
> > I hope that explains it a bit more clearly.
>
>Coming along, but still fuzzy.
>
> > The approach I am playing with at the moment is to add a rule in the
> > mangle table PREROUTING chain that marks any packets that show up from
> > eth0 that are not addressed to 10.0.0.1.  Then, in the filter table
> > FORWARD chain, I added rules to test for that mark and log and drop any
> > packets that match.
>
>The only thing that get forwarded are the packets DNATed to 0.99:80. So
>your DROP rule would never match anything. Or so.
>
>
>
>Jan
>--
I have decided to go with the idea I was working on of adding a rule in the 
mangle:PREROUTING chain that marks the packets addressed to 192.168.0.99 
(actually, marking anything not addressed to 10.0.0.1) that arrive on eth0 
and then adding a rule to filter:FORWARD that logs and drops all packets 
with that marking.

This allows packets that were sent to 10.0.0.1 tcp port 80 to be DNATted to 
192.168.0.99 tcp port 80 and get through the firewall while packets that 
were sent durectly to 192.168.0.99 tcp port 80 are dropped.

A couple of clarifications:

1) The _only_ traffic that was sneaking through via directly addressing 
192.168.0.99 was tcp port 80 traffic.  Traffic to any other private host and 
any other traffic to 192.168.0.99 was not getting through.

2) The reason I care about not allowing the private address to work directly 
is that, well, it is a private address and should not be meaningful on the 
public network and why give clues to any hackers out there?

Perhaps the confusion surrounding this interest was again clouded by my 
attempt to keep my example simple -- I used 10.0.0.1, a reserved private 
address, as my public IP address in my explanation while in reality the 
public IP address is one that is valid on the Internet.  So, having a 
private address like 192.168.0.99 appear in Internet traffic was highly 
undesirable.

My thanks to everyone who gave their advice!

_________________________________________________________________
Mortgage rates as low as 4.625% - Refinance $150,000 loan for $579 a month. 
Intro*Terms  
https://www2.nextag.com/goto.jsp?product=100000035&url=%2fst.jsp&tm=y&search=mortgage_text_links_88_h27f6&disc=y&vers=743&s=4056&p=5117



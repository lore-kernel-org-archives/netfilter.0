From: Giovanni Cardone <g_cardone@libero.it>
Subject: conntrack problems
Date: Tue, 4 Jun 2002 12:24:34 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020604122434.A667@rainbow>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hi, on a dial-up(56k) machine I'm looking at iptables 1.2.6a with both kernel
2.4.13 and 2.4.18. It's 1 months that I'm having troubles with the conntrack.
I have a lot of packets like 'new not syn'(you know what I'm talking about..)
with some combos of flags on them:

ACK FIN
ACK PSH FIN
ACK RST
ACK only

They come from connections with web servers like Google.com, 
SecurityFocus.com and so on and from news server like
Powernews.libero.it(Libero is one of the biggest provider in Italy). So, I
suspect that, because I've found only few cases like mine, those ones aren't 
broken at all :) 
I think the problem is in my conntrack that loss some(a lot...) of packets.
I've used some scripts for the iptables configuration, but it always happen.
then, I read about a patch from Rusty some month ago that increase one of the
timeouts in the kernel source(It was the TCP_CONNTRACK_CLOSE_WAIT timeout from
60 SECS to 2 MINS). I got it but nothing change. Then, I was thinking it could
be really a problem with timeouts, especially because this machine have a poor
dial-up access to the Net and it often goes sooo slow...
So I did this: I run tcpdump and capture some sessions that presents the loss
of packest trouble. Then I looked at those 'lossed packets' and I noticed that
the 'arrival time' of the losed packets had a distance with the one that
precede it(and that was traced correctly by iptables) of circa 12-14
SECS(never more than that). I mean:

arrival time 	type
............    traced packet
18.24.23.4456   traced packet
18.24.35.5678   losed packets
-------------
      12 secs

Then I looked into the kernel source for a timeout that match my(stupid)
thought. I've found TCP_CONNTRACK_CLOSE with 10 SECS, and I changed this to 2
MINS. Initially it seems(yep, <cite>I have a dream...</cite> :) to me that the 
losed packets decrements, but these days I receive costantly a lot of them.
With no other ideas, I've played a little with the timeouts, increasing them
like this 

5 MINS,     /*      TCP_CONNTRACK_CLOSE_WAIT	*/,
1 MINS,     /*      TCP_CONNTRACK_LAST_ACK, */

because I was thinking that maybe the 56k goes really slow some times but I
can't see good results :(
So I tried with this stupid methods, have you any advice at this? What it
could be? And then, I tried to add the tcp-window-tracking patch(the one in
iptables-1.2.6a) by Jozsef Kadlecsik on both 2.4.13 and 2.4.18 but it fails to
apply :( What version of iptables(maybe 1.2.7 ???) is known to work properly 
with 2.4.18 at this time? Maybe a new kernel? What I've to download?


Many thanks for your patience in advice


From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: conntrack problems
Date: Wed, 5 Jun 2002 22:19:30 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020605221930.E2090@funkyjesus.org>
References: <20020604122434.A667@rainbow>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020604122434.A667@rainbow>; from g_cardone@libero.it on Tue, Jun 04, 2002 at 12:24:34PM +0200
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

On Tue, Jun 04, 2002 at 12:24:34PM +0200, Giovanni Cardone wrote:
> Hi, on a dial-up(56k) machine I'm looking at iptables 1.2.6a with both kernel
> 2.4.13 and 2.4.18. It's 1 months that I'm having troubles with the conntrack.
> I have a lot of packets like 'new not syn'(you know what I'm talking about..)
> with some combos of flags on them:
> 
> ACK FIN
> ACK PSH FIN
> ACK RST
> ACK only

<snip>

> Then I looked into the kernel source for a timeout that match my(stupid)
> thought. I've found TCP_CONNTRACK_CLOSE with 10 SECS, and I changed this
> to 2 MINS. Initially it seems(yep, <cite>I have a dream...</cite> :) to me
> that the losed packets decrements, but these days I receive costantly a
> lot of them. With no other ideas, I've played a little with the timeouts,
> increasing them like this
> 
> 5 MINS,     /*      TCP_CONNTRACK_CLOSE_WAIT	*/,
> 1 MINS,     /*      TCP_CONNTRACK_LAST_ACK, */
> 
> because I was thinking that maybe the 56k goes really slow some times but
> I can't see good results :(
> So I tried with this stupid methods, have you any advice at this? What it
> could be? And then, I tried to add the tcp-window-tracking patch(the one
> in iptables-1.2.6a) by Jozsef Kadlecsik on both 2.4.13 and 2.4.18 but it
> fails to apply :( What version of iptables(maybe 1.2.7 ???) is known to
> work properly with 2.4.18 at this time? Maybe a new kernel? What I've to
> download?

Hi.  Sorry, I don't have much to add, except to reassure you that I've seen
similar in my logs.  I hope you will keep the mailing list informed on any
progress you make, I hope I can add to your research at some point.

-- 
FunkyJesus System Administration Team



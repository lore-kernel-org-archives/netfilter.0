From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ethernet headers and iptables counters
Date: Mon, 10 Nov 2003 23:21:49 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311102321.hAANLsj17218@agate.rockstone.co.uk>
References: <1068455679.10203.4.camel@hohum.marcsnet.com> <200311100940.hAA9eij16696@agate.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311100940.hAA9eij16696@agate.rockstone.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Monday 10 November 2003 10:25 pm, Marc Lucke wrote:

> Antony - my thanks to you.  I rather suspected your answer would be
> true.  My problem is that I am getting very large differences in the
> usage I track using iptables and the usage that my ISP reports.
> iptables reports much more traffic - up to 12% in fact.  I have checked
> with the ISP who say they too only count layer 3 IP.

12% is a lot, and the fact that you think you have 12% more traffic than your 
ISP does is more strange than if it were the other way around.

It does occur to me to wonder whether the ISP counts IP headers, but I really 
would expect them to do so, and even so, an IP header is only 24 bytes, with 
up to 1452 bytes of data inside the packet (assuming an MTU of 1500).   For 
24 bytes to make 12% difference your data would be only 200 bytes on average, 
and this is far too low to be plausible.

> Just to be sure in terms of working out why I have such a large
> discrepancy with my ISP, is there a way that the MASQ rule could be
> having some sort of unwanted effect when examining the counters in the
> FORWARD rule?  My thought is not.

I agree with you.   The FORWARD chain counts bytes being forwarded (routed) 
through the netfilter box.   The nat tables in PREROUTING and/or POSTROUTING 
are quite separate and willshow very different byte counts (in fact these two 
will be wildly inaccurate and much lower than your true usage, because they 
do not show automagically de-NATted reply packets).

So, you have higher traffic counts in your netfilter rules than the ISP says 
is going across your external link.

What do your interface packet/byte counters say if you look at the output of 
ifconfig?   Do these agree with your netfilter measurements, with the ISPs 
numbers, or are they different again!?

The only other thing I can suggest is that you try putting in a very simple 
rule at the top of each of the INPUT, FORWARD and OUTPUT chains to count the 
traffic independently of your rules, and see if these counts agree with any 
other measurement being made:

iptables -I INPUT -i eth0
iptables -I FORWARD -i eth0
iptables -I FORWARD -o eth0
iptables -I OUTPUT -o eth0

(Yes, that's right, those rules are *very* simple - they don't even have a -j 
target at the end of them.   They're perfectly valid, and will do absolutely 
nothing to your packets except count them for when you come to look at 
"iptables -L -n -v -x")

Hope something amongst all this helps.

Antony.

-- 

The only problem with the Universe as a platform, though, is that it is 
currently running someone else's program.

 - Ken Karakotsios, author of SimLife
                                                     Please reply to the list;
                                                           please don't CC me.


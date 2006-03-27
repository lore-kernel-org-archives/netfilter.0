From: Menno Smits <menno@netboxblue.com>
Subject: Re: REJECT --reject-with icmp-host-unreachable vs DROP
Date: Mon, 27 Mar 2006 23:07:51 +1000
Message-ID: <4427E3A7.20308@netboxblue.com>
References: <4427A69D.6010702@eccotours.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4427A69D.6010702@eccotours.co.za>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brent Clark <bclark@eccotours.co.za>
Cc: netfilter@lists.netfilter.org

Brent Clark wrote:
> Hi all
> 
> Just something I would like to pick someones brain with.
> 
> If I use the default policy of drop, BUT at the end of the chain use
> the following
> 
> $IPT -t filter -A FORWARD -j REJECT --reject-with
> icmp-host-unreachable
> 
> Would that be ok, or does is another ICMP message I can reply back
> with.

icmp-host-unreachable is fine. The default for the REJECT target is
icmp-port-unreachable which is ok too. If you want to make
troubleshooting easier you may want to want to tailor the ICMP reply
according to the reason that a packet was blocked (ie. was a host
blocked, a network or a port). It doesn't matter too much though.

Do an "iptables -j REJECT --help" to see the available reject types.

> Reason I ask this is because I find that by using the default policy
>  (DROP), some applications keep retrying to make a connection etc.
> 
> Where as this approach, seems to slow things down (I stand to
> correction on this).

Most applications/IP stacks will keep retrying for a while because with
a DROP there is no ICMP packet going back to let the sender know that
its traffic isn't getting through. The packet is just stopped without
letting the sender know. The sender assumes the packet was lost and
tries again until some sort of timeout is reached.

If you use REJECT an ICMP packet is sent back so that the sender know 
that its packet won't get through. This way it won't bother retrying and 
will give up immediately.

Note that this isn't always true. Some applications seem to ignore the 
ICMP reject packets coming back and will keep retrying anyway. The 
built-in command line Windows telnet application seems to do this. I'm 
not sure if this is a Windows thing or just the telnet program.

There are some situations where you should just use DROP instead of 
REJECT, usually for performance reasons where your netfilter machine has 
to deal with a high traffic volume and can't afford to send REJECTs. You 
might also want to use DROP when you get traffic that is almost 
definitely malicious. There's no point in sending a nice REJECT in this 
case.

> If someone could maybe help me understand this or assit I would be
> most grateful.

I hope I've explained it clearly enough.

Menno


From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Fwd: Re: DNATing packets sent to the NATing box
Date: Sun, 14 Dec 2003 14:03:21 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312141403.21256.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Not sure if this got to the list first time....

----------  Forwarded Message  ----------

Subject: Re: DNATing packets sent to the NATing box
Date: Sun, 14 Dec 2003 08:42:08 +0000
From: Antony Stone <Antony@Soft-Solutions.co.uk>
To: netfilter@lists.netfilter.org

On Sunday 14 December 2003 12:52 am, horape@tinuviel.compendium.com.ar wrote:
> I've a system that at its core has an UDP proxy that's the performance
> bottleneck. I wanted to use the DNAT kernel facilities to replace my
> code with the very tuned one on netfilter.
>
> I'm adding a rule that says something like this:
>
> /sbin/iptables -t nat -A PREROUTING -d myip -p udp -m udp --dport 5000 -j
> DNAT --to-destination otherip:18918
>
> but the rule never see the packets (they never got to the chain)
>
> I assume that it's because I've a socket listening on udp:5000, and it
> seems reasonable what's happening... I'd like to add a PREPREROUTING chain
> that is processed before deciding if the packet is for a local socket, can
> somebody give me a hint on where to look for it?

PREROUTING works exactly as the name suggests - it is applied to packets
before the routing decision is made about whether they are local, or being
routed through the box.   Therefore you *can* use the PREROUTING chain to
divert packets which would otherwise be accepted locally, so that they go to
another machine, or else divert packets which would have gone somewhere else,
so that they are accepted locally.

You say the rule never sees the packets...  how do you know this?   Are you
looking at the packet / byte counters, and they stay at zero all the time?

You also say you have a local process listening on port 5000 - is that
 getting any packets and responding to them, even with above rule in place?

Antony.

--
The first fifty percent of an engineering project takes ninety percent of the
time, and the remaining fifty percent takes another ninety percent of the
time.

                                                     Please reply to the list;
                                                           please don't CC me.



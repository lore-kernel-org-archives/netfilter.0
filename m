From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: help with setting up iptables for use with snort_inline (QUEUE target)
Date: Thu, 1 Jul 2004 16:09:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407011609.58553.Antony@Soft-Solutions.co.uk>
References: <200407011656.01529.victor@nk.nl>
Reply-To: Netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407011656.01529.victor@nk.nl>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Thursday 01 July 2004 3:56 pm, Victor Julien wrote:

> Hi all,
>
> I have a question about setting up iptables so I can send selected traffic
> to snort_inline using the QUEUE target.
>
> I'm writing a soon to be released (GPL) frontend to iptables. I'm adapting
>
> iptables -t mangle -A OUTPUT  -p tcp --dport 80 -j MARK --set-mark 0x1
>
> iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -m mark --mark 0x1
> -j QUEUE
> iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> iptables -A OUTPUT -p tcp --dport 80 -m state --state NEW -j QUEUE
> iptables -A OUTPUT -p tcp --dport 110 -m state --state NEW -j ACCEPT
>
> Well this works... but not for ftp. Iptables has as you know a special
> helper module for ftp. I don't know how i can make ftp play well in this
> setup. Because the ftp connection opens other ports i can't use the mark
> ftp connections like this.
>
> So... any ideas, suggestions?

You might find the new "helper" match does what you need?   I'm not certain 
because I haven't played with it, but it seems like a likely bet...

By the way, why are you doing all this in the OUTPUT chain?

I'm not quite sure that I see the purpose of running snort-inline on a single 
machine.   A router for a network, yes, but why on a standalone system?

Regards,

Antony.

-- 
Never automate fully anything that does not have a manual override capability. 
Never design anything that cannot work under degraded conditions in emergency.

                                                     Please reply to the list;
                                                           please don't CC me.



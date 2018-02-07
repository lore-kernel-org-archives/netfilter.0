From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: linux martian packets
Date: Thu, 8 Feb 2018 10:02:11 +1100
Message-ID: <20180207230211.GA2303@dimstar.local.net>
References: <62fbf8b2-9536-6bf4-9fb1-825307d29262@bluemarble.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <62fbf8b2-9536-6bf4-9fb1-825307d29262@bluemarble.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Wed, Feb 07, 2018 at 02:29:52PM -0500, John Ratliff wrote:
> We have a couple of internal networks that we route between, 10.9/16 and
> 10.246/16. But when I try to reply to ICMP requests coming into a 10.246 IP
> on the host from a machine with a 10.9 IP, I can't seem to do that. I see
> the ICMP echo request packets in tcpdump, but I can't find anything in
> iptables. It seems like they're dropped before they come into the filter
> table.
>
> Is there a way I can prevent this so that I can respond to traffic from
> another non-publicly routable IP?
>
> Thanks.

Yes indeed - tcpdump gets in before any of the iptables rules so you will see
incoming packets that are subsequently dropped.

You must have an iptables rule that is dropping them, so I suggest to use watch
of iptables -L to see which rule increments its counter when you ping from 10.9.

If your chains have policy drop it's possible you won't see anything - if so
then put an explicit DROP at the end of the chain so you see the counter.

It might also be worth checking the OUTPUT chain. Or, watch the entire iptables
ruleset:

> watch 'set -x;for i in filter nat mangle raw;do iptables -t $i -L -v -n --line-numbers;done;set +x;'

(set -x enable you to see which table a chain belongs to: search up for the last
iptables command).

HTH,

Cheers ... Duncan.

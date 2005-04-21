From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: IPSet Log and drop.
Date: Thu, 21 Apr 2005 14:40:35 -0500
Message-ID: <426801B3.6030102@riverviewtech.net>
References: <4267E1BE.9010303@kitchenandassociates.com>
	<Pine.LNX.4.58.0504211951320.27455@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0504211951320.27455@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

> ipset set types are really fast. It's hard to say, which is faster:
> the rules
> 
> 
>>iptables -A testhash -m set --set testhash src -j LOG
>>iptables -A testhash -m set --set testhash src -j DROP
> 
> or
> 
> iptables -N logdrop
> iptables -A logdrop -j LOG
> iptables -A logdrop -j DROP
> iptables -A testhash -m set --set testhash src -j logdrop
> 
> In the first case there is an additional set lookup, in the second case
> there are four [six]) additional "wildcard" builtin matches (src, dst,
> inface, outface, [proto, frag]) and one jump.
> 
> Probably the latter one is a teeny bit faster with a few cycles: hash key
> computations are just more expensive operations than simple matches.

One additional advantage of using the latter method is that if you ever decide that you want to do limit matching on the LOG target (to prevent filling the logs for duplicate connect attempts) you could easily add additional entries to the logdrop chain and not have to introduce any additional hash processing as you would if you used the first method.  Think of jumping to a new chain as sort of like a subroutine in your favorite programming language.



Grant. . . .


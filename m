From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: Re: patch-o-matic'd TTL, but it's not there
Date: Mon, 04 Jul 2005 00:39:35 -0400
Message-ID: <daaei7$l6c$1@sea.gmane.org>
References: <ffcea5260507021324388edaa8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Errors-To: netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org

> I used patch-o-matic-ng apparently successfully to add the 'TTL' patch
> (compiled & installed new kernel, modules, and iptables) and yet when
> I give the command:
> 
> iptables -t mangle -A PREROUTING -i eth1 -j TTL --ttl-set 64
> 
> I receive the response:
> 
> iptables: No chain/target/match by that name

This has happened to me in other cases for two different reasons:

(1) My version of iptables didn't support the new target.  You may need a
more recent iptables.

(2) I didn't include all of the necessary other options.  For example, -j
TARPIT didn't work if I didn't also specify -p tcp.

Unfortunately you get the same error message (the one you cited) in both
cases, although it's not very descriptive in the second case.




From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Struggling with NAT: is PREROUTING working at all?
Date: Fri, 21 Jul 2006 19:34:04 +0200
Message-ID: <44C1100C.2080006@rtij.nl>
References: <44BE40D6.90108@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44BE40D6.90108@gentoo.org>
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
To: Daniel Drake <dsd@gentoo.org>
Cc: netfilter@lists.netfilter.org

Daniel Drake wrote:

> I took a step back and re-read the iptables man page. It says that the 
> nat table is consulted whenever a new connection is about to be 
> established, and PREROUTING is used when packets come in, so I'd 
> expect this rule to give me a lot of output:
>
>     iptables -t nat -A PREROUTING -j LOG
>
> But, I get nothing, even when successfully establishing a new 
> connection from the outside to the linux system. Logging is definitely 
> working since I can get logs from other rules.
>
> No other rules are in place before this one, my script simply clears 
> all tables/chains, sets all policies to ACCEPT, then runs the above 
> command.
>
> Am I missing something, or PREROUTING not triggering when it should be?


You may have hit a bug here. That should have worked. I never tried 
LOGging from prerouting, but the NAT functionality definately works.

M4


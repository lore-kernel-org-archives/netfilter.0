From: Henrik Martin <henrik@netgate.net>
Subject: Re: Yet another local nat/port redirecting question
Date: Wed, 25 Apr 2007 00:07:08 -0700
Message-ID: <200704250007.10789.henrik@netgate.net>
References: <200704241701.28038.henrik@netgate.net> <462EEC21.5020306@rtij.nl>
Reply-To: Henrik Martin <henrik@netgate.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <462EEC21.5020306@rtij.nl>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org

On Tuesday 24 April 2007 22:50, Martijn Lievaart wrote:

> The output rule will never be hit, the packet is already redirected by
> the predirect rule. You don't need that second rule.

Ok I figured that was the case, but I had seen it in another example
so I thought I'd try it.

> This should work. It works for me, I use redirects quite frequently. The
> only thing I can think of is that the webserver listens on a specific IP
> and you try to connect to another.
>
> HTH,
> M4

What OS do you run? I'm running OpenSuSE 10.2. I've read a few
postings on the list that claim that some SuSE kernels have problems
with local port forwarding. BTW, I even tried to have it forward to
another host, but it didn't make a difference. I've also tried to
set /proc/sys/net/ipv4/ip_forward to 1, but it has no effect. I've
tried redirecting to ports that are bound via 0.0.0.0, 127.0.0.1, etc,
and it doesn't matter. I simply cannot get it to work and it really
frustrates me. Rgds,

/Henrik





From: Mogens Valentin <monz@danbbs.dk>
Subject: Re: Linux forwarding Win XP hosts VERY slowly
Date: Mon, 02 May 2005 22:47:41 +0200
Message-ID: <427691ED.1080206@danbbs.dk>
References: <200505021350.32836.dcinege-mlists@psychosis.com>
Reply-To: monz@danbbs.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200505021350.32836.dcinege-mlists@psychosis.com>
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
To: dcinege-mlists@psychosis.com
Cc: netfilter@lists.netfilter.org, "Taylor, Grant" <gtaylor@riverviewtech.net>

Dave Cinege wrote:
> To expand further on the zope issue:
> A few months ago I was remotly ssh'ed in to an appliance with my partner on 
> site. Zope had locked. I restarted the process. He connected a few times and 
> it locked again. I could not get a head reply back when it locked. 
>    (telnet 127.0.0.1 < HEAD / HTTP/1.0)
> We restarted it a dozen times with the same thing. It did not stop locking 
> until we rebooted the machine. All of this was via SSL. 
> 
> It was at this point I figured it was SSL in zope. I turned off SSL access. 
> Seemed to help but now we're seeing locking, though maybe less frequently. 
> I was wondering if it was hardware, IRQ, etc. all but ruled that out. As I 
> mentioned, I just saw everything run perfectly with my laptop, then I plug 
> the XP machine in, and it dies.

Sorry I have no way of directly helping, but since zope freezes over, 
could that be a stupid HW problem? i've seen a few services lock up, 
where the rest went on just fine.
Sometimes it has been temperature, sometimes a ramproblem, maybe 
nearly-ok ram, just operating at too close timings.
I don't expect to hear it's HW; your skills there are well reputed :p

A few ideas to isolate whether it's network problems or...
Can you keep zope running without locks with no connections?
Does it run without locks when connecting from the local box itself?
It it possible to create some local testapp to put load on zope?
And yes, I did read it works with one client. Doesn't make it better.

> If you can't tell this is really driving us crazy.

Get your drift...

-- 
Kind regards,
Mogens Valentin



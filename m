From: Filip Sneppe <filip.sneppe@cronos.be>
Subject: Re: /proc/net/ip_conntrack filling without ipt_conntrack.o loaded?
Date: 14 Jan 2003 17:09:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042560593.464.862.camel@xbox>
References: <20030114093711.GC9940@westend.com>
	<20030114121232.GA3362@westend.com> <1042551825.465.143.camel@xbox>
	<20030114150641.GB23431@westend.com> <1042559354.464.770.camel@xbox> 
	<20030114160134.GC6664@westend.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030114160134.GC6664@westend.com>
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
To: Christian Hammers <ch@westend.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2003-01-14 at 17:01, Christian Hammers wrote:
> Yes, thought so, too. - The question that I was trying to ask in this
> thread was, why the /proc/net/ip_conntrack is filled by the kernel
> although I *already did* remove the module!

Well that's not supposed to happen :-)
What kernel version are you running ? modutils version ?
Is this reproducable upon every reboot ?
I am no expert on this, but part of the reason why
Rusty is rewriting the modules infrastructure in 2.5
is that module loading/unloading is inherently racy iirc.
You may have hit a race condition with one particular
chain of events.
 
> I would have guessed that just after I removed the ipt_conntrack module
> and all the sub modules (ipt_conntrack_ftp, nat etc) the
> /proc/net/ip_conntrack would either vanish or at least return nothing
> because the code at the other end of the virtual device has gone.

I've been giving it a few tries on my machine, and 
ip_conntrack disappears nicely from /proc/net upon
unloads/reloads of ip_conntrack, even
with unreplied connections pending.

Have you already rebooted the box (this is no
Windows-advise - if something went wrong with
the module unload, there really isn't much 
other choice :-) ) ?





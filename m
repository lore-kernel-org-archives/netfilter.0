From: cc <cc@belfordhk.com>
Subject: Re: ipt_string problems and FAQ
Date: Mon, 01 Sep 2003 09:41:09 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F52A3B5.6090606@belfordhk.com>
References: <200308271319.29439.tabris@tabris.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200308271319.29439.tabris@tabris.net>
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
To: Netfilter Group <netfilter@lists.netfilter.org>

Tabris wrote:
> Ok, i admit to finding a message in the archive that mentioned that we're 
> not supposed to use ipt_string for stopping code red and such (it says 
> there's an FAQ entry for it, which i did not find), so first, I'd like to 
> ask where this FAQ entry is...

It's actually in the Netfilter-Extensions FAQ, under -m strings module.

> 
> second, I've been using ipkungfu to attempt to stop codered, nimda, etc 
> from hitting my apache server and clogging up my logs.
> 
> It's not working, the rules never trigger. I've played around with it to 
> no avail.

Which doesn't work?  ipt_string or ipkungfu, or both?  Have you
installed the kernel patch and have recompiled your kernel?

> I guess, if this doesn't work, and isn't supposed to work, what SHOULD I 
> do?

Find an alternative, I guess.   I too have been trying to figure
this out myself, but I suppose ipt_string wasn't meant to be used
like that(though, I can't see why not, but that's a different
topic).  I was told to use the correct tool for the job.

Snort w/ snortsam is the type of setup I'm using right now; though
I'm still figuring out if it is indeed working.  The logs are
showing a decrease in junk; but still, some are seeping through.
*sigh*

> I'm using a kernel 2.4.22-pre series kernel with some patch-o-matic 
> iptables patches. I hope this doesn't end up being another of those 
> stupid questions that never gets answered.

I don't know.  What do you think? ;)



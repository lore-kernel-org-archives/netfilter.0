From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: P-O-M and string matching
Date: Fri, 4 Apr 2003 12:14:02 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030404201402.67633.qmail@web40205.mail.yahoo.com>
References: <1049486058.25167.88.camel@tux.rsn.bth.se>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1049486058.25167.88.camel@tux.rsn.bth.se>
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
Content-Transfer-Encoding: 7bit
To: Martin Josefsson <gandalf@wlug.westbo.se>
Cc: nml <netfilter@lists.netfilter.org>


--- Martin Josefsson <gandalf@wlug.westbo.se> wrote:
> On Fri, 2003-04-04 at 20:03, SBlaze wrote:
> 
> > Then using patch o matic I applied a very few changes (quote time and
> string).
> > Now the quote and time patches are selectable from a make menuconfig from
> the
> > /usr/src/linux directory. However the string matching options are NO WHERE
> to
> > be found. I don't understand why and thats why I need help.
> > 
> > Can anyone tell me what I am doing wrong? Is it a bug somewhere? Thanks in
> > advance for anyones and everyones time!
> 
> You need to compile iptables against your new kernel after you've
> patched it with the string match from p-o-m.
> 
> There's a check during the complilation that checks which things you
> have in your kernel. Only these things get compiled (with a few
> exceptions).
> 
> -- 
> /Martin


Additional Info that might help someone help me is...

Welcome to Rusty's Patch-o-matic!

Each patch is a new feature: many have minimal impact, some do not.
Almost every one has bugs, so I don't recommend applying them all!
-------------------------------------------------------
Already applied: submitted/01_2.4.19
                 submitted/02_2.4.20
                 base/TTL
                 base/iplimit
                 base/quota
                 base/time
                 extra/string
                 extra/talk-conntrack-nat

-----------------------------------------------------------------
No more patches to apply! Q to Quit or ? for options [Q/a/r/b/?]

azkerban:~/iptables-1.2.7a# make KERNEL_DIR=/usr/src/linux | grep string
Extensions found: IPv4:quota IPv4:string IPv4:time

It appears that the p-o-m is doing its job.... Mayb I am wrong but this leads
me to believe it might be a problem with the string matching files/code ?





=====
"No touchy NO TOUCHY! Emperor Kuzko -=Emperor's New Groove=-"

__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
http://tax.yahoo.com


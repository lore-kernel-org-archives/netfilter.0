From: Nox <pheusion@snet.net>
Subject: Re: POM woes
Date: Wed, 24 Sep 2003 17:39:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064439558.27142.194.camel@shaolin.gridlocksecurity.com>
References: <20030924213330.66720.qmail@web60110.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030924213330.66720.qmail@web60110.mail.yahoo.com>
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
To: Stack Buffer <black_merkury@yahoo.com>
Cc: netfilter@lists.netfilter.org

Try it with the "f" instead of "y"
that should force it to work.

At least you can get through it this way
Let me know how it goes

Thanks

Nox
GenMicro Systems

On Wed, 2003-09-24 at 17:33, Stack Buffer wrote:
> Sorry Actually its an typo
> I  did cd /usr/src/linux-2.4.20-8
> wonder whats wrong??
> 
> --- Nox <pheusion@snet.net> wrote:
> > Hold on:
> > 
> > # export KERNEL_DIR=/usr/src/linux-2.4.20-8
> > 
> > 3). # cd /usr/src/linux/
> >     # make dep
> > 
> > see the difference?
> > 
> > you set env for 2.4.20-8
> > but cd into /usr/src/linux/
> > 
> > Is this a typo?
> > if not thats most likely the cause
> > 
> > On Wed, 2003-09-24 at 16:48, Stack Buffer wrote:
> > > Greetings Nox,
> > > Thank u very much for the advice.
> > > I recently tried checking out what this POM stuff
> > was
> > > all about and to see if I could apply any patches.
> > > Well I did according to what the Netfilter
> > Extension
> > > HOWTO instructed, namely:
> > > 
> > > 1). Get the latest CVS tree, by doing (taken from
> > > HOWTO)..
> > > 
> > > # cvs -d
> > :pserver:cvs@pserver.netfilter.org:/cvspublic
> > > login
> > > 
> > > (When it asks you for a password type `cvs').
> > > 
> > > # cvs -d
> > :pserver:cvs@pserver.netfilter.org:/cvspublic
> > > co netfilter/userspace netfilter/patch-o-matic
> > > 
> > > 2). Second I did the following to state my kernel
> > src
> > > dir..
> > > 
> > > # export KERNEL_DIR=/usr/src/linux-2.4.20-8
> > > 
> > > 3). # cd /usr/src/linux/
> > >     # make dep
> > > 
> > > 4)# ./runme extra
> > > 
> > > Actually my problem is at stage 4, the output
> > says..
> > > 
> > > Do you want to apply this patch
> > [N/y/t/f/a/r/b/w/q/?]
> > > y
> > > Testing patch submitted/03_2.4.21.patch...
> > > Failed to patch copy of /usr/src/linux-2.4.20-8/
> > > TEST FAILED: patch NOT applied.
> > > 
> > > [Press enter to continue]....
> > > 
> > >  As u can see somethng is wrong, even worse when
> > press
> > > return it just keeps cycling thru the same above
> > entry
> > > :( . Is the patch number somehow related to my
> > kernel
> > > version number??. What can I do from here
> > > I would really appreciate any help on the above.
> > > Thanking u for ur time
> > > Stack..
> > > 
> > > __________________________________
> > > Do you Yahoo!?
> > > Yahoo! SiteBuilder - Free, easy-to-use web site
> > design software
> > > http://sitebuilder.yahoo.com
> > 
> 
> __________________________________
> Do you Yahoo!?
> Yahoo! SiteBuilder - Free, easy-to-use web site design software
> http://sitebuilder.yahoo.com



From: Jason <baker@cyborgworkshop.com>
Subject: Re: chance to impress the suits
Date: Fri, 28 Feb 2003 06:53:45 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.50.0302280652440.20514-100000@alfred.home.cyborgworkshop.com>
References: <Pine.LNX.4.50.0302261757350.18770-100000@alfred.home.cyborgworkshop.com>
 <200302270201.04762.netfilter@newkirk.us> <20030227134810.7728c8d5.arnt@c2i.net>
 <Pine.LNX.4.50.0302270811550.19694-100000@alfred.home.cyborgworkshop.com>
 <20030228014041.7394bcfa.arnt@c2i.net>
 <Pine.LNX.4.50.0302271518100.19962-100000@alfred.home.cyborgworkshop.com>
 <20030228173420.1a1bdc11.arnt@c2i.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030228173420.1a1bdc11.arnt@c2i.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnt Karlsen <arnt@c2i.net>
Cc: netfilter@lists.netfilter.org

well remember, them getting bigger boxes are to handle the number of
connections that I am giving to them.  Its not a matter of TCP slowing
down, its us waiting on their application to finish and their app just
handles waits very poorly.

-- 
Jason Baker
baker@cyborgworkshop.com
www.cyborgworkshop.com

On Fri, 28 Feb 2003, Arnt Karlsen wrote:

> On Thu, 27 Feb 2003 15:21:02 -0600 (CST),
> Jason <baker@cyborgworkshop.com> wrote in message
> <Pine.LNX.4.50.0302271518100.19962-100000@alfred.home.cyborgworkshop.co
> m>:
>
> > They need a bigger box.   The whole app on their end is 6 boxes,  two
> > front end web servers, two application servers and then the database.
> > They upgraded the database, which used to be the bottleneck, and we
> > then maxed out their web servers. They upgraded their web servers and
> > now we max out their app servers. They have more hardware on order,
> > but Sun is claiming a month lead time for Sunfires.  But I figure in
> > the meantime, this should work out pretty well.
> >
>
> ..ok, I'm still deep in the dark:  How is a bigger set of iron, that can
> spew _more_ connections, gonna help avoid the authorized dos attack???
>
> ..the 6-too-small-boxes understands ipcm, and will back off when you
> drop packages or connection?
>
> ..I _think_ a _short!_ timeout on these connections, could work.
>
>


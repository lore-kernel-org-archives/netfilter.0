From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: what do the contents of /proc/net/ip_tables_names mean?
Date: Fri, 25 Oct 2002 08:45:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021025074540.GMFV459.mta02-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0210241927030.3938-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210241927030.3938-100000@localhost.localdomain>
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
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Friday 25 October 2002 12:30 am, Robert P. J. Day wrote:

> On Thu, 24 Oct 2002, Antony Stone wrote:
> > On Thursday 24 October 2002 7:44 pm, Robert P. J. Day wrote:
> > >   in looking through the system script for iptables under red hat 8.0,
> > > i notice the occasional reference to the file
> > > /proc/net/ip_tables_names, which contains, one per line, the names
> > > of one of more of the possible netfilter tables (filter, nat
> > > and/or mangle).
> > >
> > >   what does it mean for a table to have its name in this file?
> >
> > It means that this particular netfilter system supports rules in those
> > tables.
> >
> > If you compile netfilter without mangle table support and then try to add
> > rules to the mangle table, you will get errors.
> >
> > By reading this file you can find out which tables are supported on a
> > given machine.
>
> not quite.  as i see it, that a table name is in that file means nothing
> more than that it's currently being *required* by your rule set.

No - it's nothing really to do with the rule set.   You can have support for 
the mangle table, with a "mangle" entry in /proc/net/ip_tables_names, and 
have no mangle table rules at all (and not intend to have any either).

What the file indicates is whether your machine is *capable* of accepting 
rules in particular tables, either becuase you compiled them in, or because 
you loaded a module.

> so, if all your table support is modular, it looks like that file
> will represent just those modules that had to be loaded for your
> rule set.  if you're not mangling, it won't show mangle since that
> module never needed to be loaded.

If you don't load the mangle module, then no, you won't get a "mangle" entry 
in /proc/net/ip_tables_names, and you can't add any mangling rules.

If you do load the mangle module, then you will get a "mangle" entry in 
/proc/net/ip_tables_names, and you can add mangling rules.

> what i *don't* know is what that file will show if your table
> support is compiled directly into the kernel.  and that's what
> i'm asking here.  anyone know?

Yes.   It will show the tables for which you have compiled in support.

Antony.

-- 

It is also possible that putting the birds in a laboratory setting
inadvertently renders them relatively incompetent.

 - Daniel C Dennett


From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: what do the contents of /proc/net/ip_tables_names mean?
Date: Thu, 24 Oct 2002 19:30:06 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210241927030.3938-100000@localhost.localdomain>
References: <20021024211932.XLJJ17202.mta01-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021024211932.XLJJ17202.mta01-svc.ntlworld.com@there>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter mailing list <netfilter@lists.netfilter.org>

On Thu, 24 Oct 2002, Antony Stone wrote:

> On Thursday 24 October 2002 7:44 pm, Robert P. J. Day wrote:
> 
> >   in looking through the system script for iptables under red hat 8.0,
> > i notice the occasional reference to the file
> > /proc/net/ip_tables_names, which contains, one per line, the names
> > of one of more of the possible netfilter tables (filter, nat
> > and/or mangle).
> >
> >   what does it mean for a table to have its name in this file?
> 
> It means that this particular netfilter system supports rules in those tables.
> 
> If you compile netfilter without mangle table support and then try to add 
> rules to the mangle table, you will get errors.
> 
> By reading this file you can find out which tables are supported on a given 
> machine.

not quite.  as i see it, that a table name is in that file means nothing
more than that it's currently being *required* by your rule set.  in
my case, when i looked, all that was in there was "filter".  but i
did a quick modprobe and added the module for nat, and suddenly nat
was in that file as well. 

so, if all your table support is modular, it looks like that file
will represent just those modules that had to be loaded for your
rule set.  if you're not mangling, it won't show mangle since that
module never needed to be loaded.

what i *don't* know is what that file will show if your table 
support is compiled directly into the kernel.  and that's what
i'm asking here.  anyone know?

rday



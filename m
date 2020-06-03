From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [MAINTENANCE] Shutting down FTP services at netfilter.org
Date: Wed, 3 Jun 2020 23:32:35 +0200
Message-ID: <20200603213235.GA31552@salvia>
References: <20200603113712.GA24918@salvia>
 <20200603171621.GC717800@nataraja>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200603171621.GC717800@nataraja>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harald Welte <laforge@gnumonks.org>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi Harald,

On Wed, Jun 03, 2020 at 07:16:21PM +0200, Harald Welte wrote:
> Hi Pablo,
> 
> On Wed, Jun 03, 2020 at 01:37:12PM +0200, Pablo Neira Ayuso wrote:
> > So netfilter.org will also be shutting down FTP services by
> > June 12th 2020.
> 
> I always find that somewhat sad, as with HTTP there is no real convenient
> way to get directory listings in a standardized / parseable format.  But
> of course I understand the rationale and I obviously respect your
> decision in that matter.

There was a discussion regarding the existing netfilter.org
infrastructure during the last workshop. People are busy and the
infrastructure maintainance tasks end up being the last thing on the
list at the end of the day, unfortunately. Luckly, there is one more
person volunteering to help maintain the netfilter.org infrastructure
these days. Still I have to scratch my limited spare time to migrate
the infrastructure to the new datacenter.

> > As an alternative, you can still reach the entire netfilter.org
> > software repository through HTTP at this new location:
> > 
> >         https://netfilter.org/pub/
> 
> Maybe make http://ftp.netfilter.org/ an alias to it?

It's just one extra file in apache and an entry on the DNS server.
Yes, I can do that. It's probably convenient to keep this at least
working for a while.

I cannot hide, however, that I would like to simplify the existing
infrastructure to reduce the maintainance burden to adecuate it to the
existing resource availability. Including the consolidation of the
existing virtual servers in apache around one or two instances.

> I think the important part would be some way to conveniently obtain a
> full clone, e.g. by rsync.  This way both public and private mirrors
> can exist in an efficient way, without having to resort to 'wget -r'
> or related hacks, which then only use file size as an indication if a
> file might have changed, ...

Regarding rsync: I'm actually considering to propose to remove
netfilter mirrors or, alternatively, only propose to maintain a number
of them that have worked reliably along these years. So rsync would be
only available for those few people that will be maintaining mirrors.

Regards.

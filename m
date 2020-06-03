From: Harald Welte <laforge@gnumonks.org>
Subject: Re: [MAINTENANCE] Shutting down FTP services at netfilter.org
Date: Wed, 3 Jun 2020 19:16:21 +0200
Message-ID: <20200603171621.GC717800@nataraja>
References: <20200603113712.GA24918@salvia>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200603113712.GA24918@salvia>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi Pablo,

On Wed, Jun 03, 2020 at 01:37:12PM +0200, Pablo Neira Ayuso wrote:
> So netfilter.org will also be shutting down FTP services by
> June 12th 2020.

I always find that somewhat sad, as with HTTP there is no real convenient
way to get directory listings in a standardized / parseable format.  But
of course I understand the rationale and I obviously respect your
decision in that matter.

> As an alternative, you can still reach the entire netfilter.org
> software repository through HTTP at this new location:
> 
>         https://netfilter.org/pub/

Maybe make http://ftp.netfilter.org/ an alias to it?

I think the important part would be some way to conveniently obtain a
full clone, e.g. by rsync.  This way both public and private mirrors
can exist in an efficient way, without having to resort to 'wget -r'
or related hacks, which then only use file size as an indication if a
file might have changed, ...

Regards,
	Harald
-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)

From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd will not accept connection records into kernel table
 from another machine
Date: Fri, 10 Mar 2017 10:59:47 +0100
Message-ID: <20170310095947.GA4053@salvia>
References: <2602-58bd9900-3-1184bca@164654059>
 <20170309203247.GA12738@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170309203247.GA12738@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gerald <gerald@palmerhouse.net>
Cc: netfilter@vger.kernel.org

On Thu, Mar 09, 2017 at 09:32:47PM +0100, Pablo Neira Ayuso wrote:
> On Mon, Mar 06, 2017 at 11:15:04AM -0600, gerald wrote:
> > https://bugzilla.netfilter.org/show_bug.cgi?id=1123
[...]
> > conntrackd.conf:
> > Sync {
> >     Mode FTFW {
> >         DisableExternalCache On
> 
> You cannot use FTFW with DisableExternalCache On. I'll make a patch to
> warn on this to users. But this shouldn't be the cause of the problem.

Forget this, FTFW and DisableExternalCache is OK.

> >         CommitTimeout 1800
> 
> Could you comment out this option and retest?

I managed to reproduce this here.

You cannot combine CommitTimeout with DisableExternalCache. If you set
CommitTimeout, then conntrack starts spitting EINVAL error messages.

Fixed here:

http://git.netfilter.org/conntrack-tools/commit/?id=39398cd3c1e488e099ea186ad1e5b725c2f09d1d

Thanks for reporting.

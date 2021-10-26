From: Nathan Wagner <nw@hydaspes.if.org>
Subject: Re: nft list empty
Date: Tue, 26 Oct 2021 20:58:54 +0000
Message-ID: <YXhsDm0P7BOS3l98@granicus.if.org>
References: <YXhWwPas9vnN2XDi@granicus.if.org>
 <bb50c53c-f365-92b9-87c5-193a77ca3ace@freenet.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bb50c53c-f365-92b9-87c5-193a77ca3ace@freenet.de>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Tue, Oct 26, 2021 at 10:32:15PM +0200, Benno wrote:
> Am 26.10.21 um 21:28 schrieb Nathan Wagner:
> > For some reason, 'nft list ...' doesn't seem to print anything out.
> > A nft create table seems to create the table, but other than an
> > error if I try to create it again, I don't have any way to tell.
> > 
> 
> Which version of nftables are you using?

1.0.0

> Does nft list tables or nft list chains output your rules?

No, I added a '/usr/sbin/nft list tables' and '/usr/sbin/nft list
chains' to the appropriate places in my repro script, and they don't
produce any output.

> (Kernel 4.15 is from 2018, most major distributions moved to at least
> 4.19.

I think 4.15 should still support nftables.  I've got a more recent
kernel compiled and packaged, but my uptime is 848 days...

> Currently nftables 1.0.0 is stable but not yet available in all
> distributions.)
> 
> Is nft really the binary from the nftables package

Yes, which I can guarantee, since I compiled it myself.

> or something wrapped/enhanced by a distribution?

No, that's not it.  I packaged it myself.  I also tried running the
binary straight from the compilation directory.

> Is there an alias in your shell? (In Bash this can be avoided by using
> 'nft' ??? single quotes.)

No alias.  I changed my repro script to call /usr/sbin/nft rather than
just 'nft', same result.

-- 
nw

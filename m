From: Nathan Wagner <nw@hydaspes.if.org>
Subject: Re: nft list empty
Date: Wed, 27 Oct 2021 05:49:37 +0000
Message-ID: <YXjocckHkYyILnjl@granicus.if.org>
References: <YXhWwPas9vnN2XDi@granicus.if.org>
 <YXiDxDKfBLbZCaIy@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <YXiDxDKfBLbZCaIy@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Wed, Oct 27, 2021 at 12:40:04AM +0200, Pablo Neira Ayuso wrote:
> On Tue, Oct 26, 2021 at 07:28:00PM +0000, Nathan Wagner wrote:
> > For some reason, 'nft list ...' doesn't seem to print anything out.
> > A nft create table seems to create the table, but other than an
> > error if I try to create it again, I don't have any way to tell.

> > + uname -r
> > 4.15.10-2-zoranix
> 
> There's a fix in master (to be included in the upcoming 1.0.1 release)
> which fixes nftables with older kernels:

[snip]

> Could you give a try to a nftables git HEAD snapshot?

That version works with my kernel.

-- 
nw

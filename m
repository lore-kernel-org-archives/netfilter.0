From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft list empty
Date: Wed, 27 Oct 2021 00:40:04 +0200
Message-ID: <YXiDxDKfBLbZCaIy@salvia>
References: <YXhWwPas9vnN2XDi@granicus.if.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <YXhWwPas9vnN2XDi@granicus.if.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nathan Wagner <nw@hydaspes.if.org>
Cc: netfilter@vger.kernel.org

On Tue, Oct 26, 2021 at 07:28:00PM +0000, Nathan Wagner wrote:
> For some reason, 'nft list ...' doesn't seem to print anything out.
> A nft create table seems to create the table, but other than an
> error if I try to create it again, I don't have any way to tell.
> 
> I am probably missing something, but I have looked around and
> don't see what it could be.  I worked up a script to reproduce
> the issue, the output of which is below.
> 
> What is especially puzzling is that a 'list ruleset' within the same
> nft process shows output, so it's like nft just isn't committing the
> changes for some reason.  Except that doing two creates in a row
> generates an error that I interpret to mean that the table already
> exists.  This also implies that the table create persisted across
> separate nft processes.
> 
> Finally and separately, I tried doing an 'echo list ruleset | nft -f -'
> and it errors out with a missing /dev/stdin.  Ok, my /dev filesystem is
> probably broken, but why is it trying to open /dev/stdin in the first
> place instead of just reading from fd 0?  I imagine that somewhere
> there's the equivalent of an "if filename = '-' then filename =
> '/dev/stdin' and then it goes through the same process it uses for named
> files.  I'd do this the other way around.
> 
> + uname -r
> 4.15.10-2-zoranix

There's a fix in master (to be included in the upcoming 1.0.1 release)
which fixes nftables with older kernels:

commit 058a943cefbdde9aee273115624de27cf15dd3f3
[...]

    cache: provide a empty list for flowtables and objects when request fails
    
    Old kernels do not support for dumping the flowtable and object lists,
    provide an empty list instead to unbreak the cache initialization.
    
    Fixes: 560963c4d41e ("cache: add hashtable cache for flowtable")
    Fixes: 45a84088ecbd ("cache: add hashtable cache for object")

Could you give a try to a nftables git HEAD snapshot?

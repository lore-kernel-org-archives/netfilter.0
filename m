From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: How to add overlapping CIDR blocks in a set and have a way
 delete them ?
Date: Thu, 7 Oct 2021 14:06:23 +0200
Message-ID: <YV7iv721TKI3EVKD@salvia>
References: <CAEOQC3M3qUF-Ds6gGP=9d00uQUE36QzBovDjuvgAnuA8WdxMZg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEOQC3M3qUF-Ds6gGP=9d00uQUE36QzBovDjuvgAnuA8WdxMZg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shivam Sandbhor <shivam@crowdsec.net>
Cc: netfilter@vger.kernel.org

On Mon, Oct 04, 2021 at 02:45:37PM +0530, Shivam Sandbhor wrote:
> For context, we are detecting nefarious IP ranges/CIDR blocks by
> parsing the live logs of various services (eg nginx, apache etc) using
> the crowdsec agent. After the agent detects a nefarious IP range, we
> want to block the range using nftables. To do this we tried adding IP
> range to a nftables set, with appropriate rules in place.
> 
> The problem we are facing is when the agent detects IP ranges which
> overlap. In such cases, nftables rejects the newer overlapping range.
> Even if the previous range is smaller.
> 
> We tried using the "auto-merge" flag for the set but it doesn't solve
> the problem because only ranges present in the same
> transaction/command are auto-merged.

Automerge does not support for running updates, ie. it does not merges
interval for incremental updates.

> Also we want to provide users an option to delete a range. But this
> won't be possible if this range was merged to some other range by
> nftables.
> 
> So how do we add IP ranges in a nftables set which are potentially
> overlapping and have a way to delete the originally provided ranges ?

You could do an incremental update in a batch file, deleting first the
range you want to remove and then adding the new range:

# cat file.nft
delete element x y { 1.1.1.0/24 }
add element x y { 1.1.1.0/23 }
# nft -f file.nft

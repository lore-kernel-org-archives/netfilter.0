From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Updating set elements from command line
Date: Sun, 9 Oct 2022 05:39:50 +0100
Message-ID: <20221009053950.be64bd6555d9c7060e363136@plushkava.net>
References: <Eio6D1ukecFTMx3qFhiCTbHRPOiSKqei5fvfeaGcMc4SfXxZriRAXGFv_HgaBa-wVulHKr7D-6mE6RNQOJztUM1tooTU5nCqQ1Z9AO_o_IM=@proton.me>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1665290392; x=
        1665376792; bh=KVLTJEB10pzIkgFabe85zdFIJYG/0WvYHlkj6kUSt54=; b=p
        2eAYd7hyw8JVtsxmZrKJTmULEev80354gLDoQHyHIDaZhhOj568xdFI0JURGXzOX
        cUqyW+GURbryZoi4SjFHxfOOuiYI19yiUtiEHCaK2wkst1lPYxIZmEbU/VUpukGq
        FbiohyMFDHfyCZ/WOJZmUL2SbP+OBZg+f+ZQLIg41J5FOxOih8dz07VMoiJPOpRU
        jgYmDsF9+Q0yDTO+8sZgADp7IqUFwZhbh+pobH4jeANL3pB2I6GrEJ4qw/JwnZYQ
        7PmVWWpdfOni0ioBaDv0sBsnhECzm4qg+j4No6rLXTNvMV28Gc7JaFmTctiPJdU8
        TjM5zhupunvz0WMtovuXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665290392; x=
        1665376792; bh=KVLTJEB10pzIkgFabe85zdFIJYG/0WvYHlkj6kUSt54=; b=W
        K18+TPgrgnSGguLuBf/btRh1bwZL/YmUja+fFIx0e8wY14tv9Fn4vrkqWIHBbzaX
        iDoh1ugmsAdnkyDN39js1anIaD9Fp/MvKDdeMe0BrCKPZKOMAQWbnLDk/SJDgQfg
        JfPWcqC609SvU+5Cv10PDu/nC5awWSdGCZylxU69gCPjnZtmcQHwSwYBtQHr7Y9W
        jt8piHu7/0puDpeXqaA1Gbnzwni/ooqGYSwZxvbf+PpLousI0DEKjOrufuExgPwo
        Mh+HrO2AtenCfLwTTaAasI7IAgxRYSxUHdYoKU69RUnnqwVHgoqxDsqYDvWG15/o
        qNsLPGlm45EhaIj0vtn4g==
In-Reply-To: <Eio6D1ukecFTMx3qFhiCTbHRPOiSKqei5fvfeaGcMc4SfXxZriRAXGFv_HgaBa-wVulHKr7D-6mE6RNQOJztUM1tooTU5nCqQ1Z9AO_o_IM=@proton.me>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric <evil.function@proton.me>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sat, 08 Oct 2022 18:31:01 +0000
Eric <evil.function@proton.me> wrote:

> Is it possible to update set elements outside the packet path?
> https://wiki.nftables.org/wiki-nftables/index.php/Updating_sets_from_the_packet_path
> 
> I'm using a blacklist set, which is populated from an external source and
> updated nightly in a cron job.  Current set definition is:
> 
>     table ... {
>         set doh_ipv4 {
>             typeof ip daddr
>             counter
>         }
>         ...
> 
> My update script currently maintains counter values by a kludge,
> dump-flush-repopulate:
> 
>     # Dump the current set in json
>     json=$(nft -j list set inet firewall doh_ipv4)
>     ... select out the current counts into a map indexed by IP ...
> 
>     ips=$(curl https://some/ip4.list)
>     nft flush set ...  # Thus losing all statistics.
>     for ip in $ips; do
>         ... fetch $packets and $bytes from map using $ip ...
>         nft add element ... { $ip counter packets $packets bytes $bytes }
>     done
> 
> I would much rather use timeouts to remove old elements, thus eliminating
> the kludge.  First, redefine the set with timeouts:
> 
>     table ... {
>         set doh_ipv4 {
>             typeof ip daddr
>             counter
>             flags timeout
>             timeout 3d
>             gc_interval 1h
>         }
>         ...
> 
> Then my cron script would just run through the list of addresses something like:
> 
>     ips=$(curl https://some/ip4.list)
>     for ip in $ips; do
>         nft update element ... { $ip expires 3d }
>     done

Firstly, for reasons of efficiency and atomicity, you should compose a command stream that is executed once by nft(8). Here is one example of how to go about it.

{	
	echo "add element ip filter doh_ipv4 {"
	curl https://some/ip4.list | paste -d, -s -
	echo "}"
} | nft -f - 

As you pointed out, there does not appear to be any way to "update" other than in the packet path. One applicable kludge would be to enable auto-merge, along with the interval flag.

table ip filter doh_ipv4 {
	type ipv4_addr
	flags interval,timeout
	counter
	auto-merge
	timeout 3d
}

Given such a set, re-adding an existing /32 will reset the timeout to 3d (the timeout need not be specified by the add element command). Unfortunately, its counters will be reset to 0 also, so this method confers no advantage over keeping the set as it currently stands and, instead, incorporating a flush command into the stream conveyed to nft(8). 

set="ip filter doh_ipv4"
{
	# flush and add, atomically
	echo "flush set $set"
	echo "add element $set {"
	curl https://some/ip4.list | paste -d, -s -
	echo "}"
} | nft -f -

In summary, I think that nftables would need to be changed in order to support your use case, and that it ought to be.

-- 
Kerin Millar

From: Devin Bayer <dev@doubly.so>
Subject: Re: meter directive
Date: Sun, 27 Sep 2020 14:27:36 +0200
Message-ID: <aaa67cc8-c8c0-465b-3fa5-10f62e67795e@doubly.so>
References: <2781f10c-a5e5-0bdc-b701-617f9476c57b@doubly.so>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=doubly.so; s=MBO0001;
        t=1601209659;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kW+c56o3OMkkQ4Uw0Qu6RLAiJ4s2f6pMJkGnsJFg/Ss=;
        b=o80VpARrXGUFd/UadibpluuyhHfPoUa1yBSISaC8UePa+6FIgk4mpw4CCC1HXNlE2Fn58/
        BkaeffWnrpvuY5NzWydJpmQD6lLv6typxz196dHEd9Nf0NM5UmuNwmMDhMcs+gg90zdYf0
        Rne6BwzXKkd4P6Nc3QyVklbXVyCC5FOuDtWqqW4cIwq8L9pBhb48VNkpfxSHoha1oGM4Hw
        Pi1B76NZLHvjvCP0GLrfcho9le+G09W1gUNimSXsvFcdYka0ocISQxFuN/KOwebknoUs+p
        q10Kidf4A1O5rR7fW+4LySUkGh4A0N3hx/mELwZgllgCBN4a3h8kW/ZO9m3FCA==
In-Reply-To: <2781f10c-a5e5-0bdc-b701-617f9476c57b@doubly.so>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Anyone have thoughts on this, especially the questions:

a) is meter an obsolete directive?
b) if not, is it documented anywhere?
c) is it possible to display the counters in a meter?

Thanks,
Devin

On 04/09/2020 10.38, Devin Bayer wrote:
> Hello,
> 
> I am looking for some docs on the `meter` directive. Should it still be 
> used instead of `map` or `set` and what are the arguments?
> 
> I see it's used in examples in the man page and also on this page:
> 
>     https://wiki.nftables.org/wiki-nftables/index.php/Meters
> 
> However the example does not work as described. When I do
> 
>      nft list map my_filter_table my_ssh_meter
> 
> I don't get the output like is described. First, it's a "set", not a 
> "map", so I just see "Error: No such file or directory". But when 
> changing to "list set", I don't see the counters:
> 
> table ip my_filter_table {
>      set my_ssh_meter {
>          type ipv4_addr . inet_service
>          size 1000
>          flags dynamic,timeout
>          elements = {
>      3.10.95.11 . 22 expires 14s492ms limit rate 10/second,
>      3.123.217.208 . 22 expires 38s596ms limit rate 10/second,
>      ...}
>      }
> }
> 
> 1) I wondering if someone can clarify.
> 2) If meter is obsolete, as the wiki suggests, can the examples in the 
> man page be updated?
> 3) If meter isn't obsolete, can it's usage be added to the man page?
> 
> I am using nftables v0.9.6 on kernel 5.7.0.
> 
> 
> Thanks,
> Devin

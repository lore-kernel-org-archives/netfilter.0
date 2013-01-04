From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: [SOLVED] Re: Native support of counting rules?
Date: Fri, 04 Jan 2013 07:57:38 +0200
Message-ID: <50E66F52.7070809@ngtech.co.il>
References: <20130102134421.GA17997@devnull> <50E43D07.50009@ngtech.co.il> <CAJZVxRkyDyZyWUBbhP+H5gv2Dk1_Jj=v4QRAheHKWEnSKTdrhg@mail.gmail.com> <50E6626B.8040705@ngtech.co.il> <50E66B1F.3050805@airpost.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50E66B1F.3050805@airpost.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: blackhole@airpost.net
Cc: Aaron Lewis <the.warl0ck.1989@gmail.com>, netfilter mailing list <netfilter@vger.kernel.org>

On 1/4/2013 7:39 AM, Born Without wrote:
> That is not true.
> There also is the security table.
> And if you have xtables-addons installed, there might also be the
> rawpost table.
> But any of those might not be loaded, if compiled in as loadable module.
> So you might need to read /proc/net/ip_tables_names to work only on
> existing tables, without loading unwanted/needed ones.
>
> [...]

You can read For these specific cases.
But still it's not changing the basic concept which you don't need a new 
binary to do all the above just add:
tables=`cat /proc/net/ip_tables_names`

He do have a point that adding this option he seeks is such a simple 
task and can be added into iptables as a simple --rules-count or any 
other directive.

I really don't know why and how this system works so if a binary works 
it's fine by me.

The distance between the Binary file and this script is portability and 
complexity.

Regards,
Eliezer

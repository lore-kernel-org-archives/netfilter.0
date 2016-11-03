From: Arturo Borrero Gonzalez <arturo@debian.org>
Subject: Re: nftables: named set for ipv4 networks
Date: Thu, 3 Nov 2016 12:29:28 +0100
Message-ID: <CAOkSjBjWmNZFHnYu5B=FcM1qT3sUWBBq+=9Kk8WsEzu6F0JV6Q@mail.gmail.com>
References: <20161023213822.16337e5c@doomgiver> <20161027192338.GA1570@salvia>
 <20161027234152.2c94a832@doomgiver> <20161028080419.GB1553@salvia>
 <20161028162353.7da8573c@doomgiver> <20161102113006.0b3de6cd@doomgiver>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20161102113006.0b3de6cd@doomgiver>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leon Merten Lohse <leon@green-side.de>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 2 November 2016 at 11:30, Leon Merten Lohse <leon@green-side.de> wrote:
> I would really appreciate if someone could comment on this.
>
> The problem is that nft complains about overlapping intervals in the
> set, if I load the following ruleset twice.
> This occurs even though there is a `flush ruleset' directive at the
> beginning of the ruleset. As far as I understand it, all sets should be
> empty after that.
> Calling `nft flush ruleset' beforehand works around this but is no
> longer atomic.
>

Yes, this is probably some bug in the nft cache.

Will send a testcase so we don't forget about fixing this.

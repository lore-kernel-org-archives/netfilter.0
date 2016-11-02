From: Leon Merten Lohse <leon@green-side.de>
Subject: Re: nftables: named set for ipv4 networks
Date: Wed, 2 Nov 2016 11:30:06 +0100
Message-ID: <20161102113006.0b3de6cd@doomgiver>
References: <20161023213822.16337e5c@doomgiver>
        <20161027192338.GA1570@salvia>
        <20161027234152.2c94a832@doomgiver>
        <20161028080419.GB1553@salvia>
        <20161028162353.7da8573c@doomgiver>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20161028162353.7da8573c@doomgiver>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I would really appreciate if someone could comment on this.

The problem is that nft complains about overlapping intervals in the
set, if I load the following ruleset twice.
This occurs even though there is a `flush ruleset' directive at the
beginning of the ruleset. As far as I understand it, all sets should be
empty after that.
Calling `nft flush ruleset' beforehand works around this but is no
longer atomic.

Best
Leon

flush ruleset

table inet filter {
  set blacklist_v4 { type ipv4_addr; flags interval; }
}

add element inet filter blacklist_v4 {
192.168.0.1/24,
}

On Fri, 28 Oct 2016 16:23:53 +0200
Leon Merten Lohse <leon@green-side.de> wrote:

> When I load this ruleset twice, it complains that "interval overlaps
> with an existing one" even though I explicitly do a "flush ruleset" at
> the beginning of the file.
> This problem does not occur if I "nft flush ruleset" first and then
> load the ruleset.
> Do I have to explicitly flush the sets, somehow?

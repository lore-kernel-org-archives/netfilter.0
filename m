From: Arturo Borrero Gonzalez <arturo@netfilter.org>
Subject: Re: Create set and/or chain accessible across multiple tables
Date: Wed, 23 Aug 2017 12:10:13 +0200
Message-ID: <CAOkSjBiqzd5PHuFU=_sctb4JxRC0_ibmgcVkgDL8C9qANrCFMQ@mail.gmail.com>
References: <02c72729-72ab-1947-53b7-0a3cbaff4d7a@wagsky.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <02c72729-72ab-1947-53b7-0a3cbaff4d7a@wagsky.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Kletsky <netfilter@allycomm.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 22 August 2017 at 23:08, Jeff Kletsky <netfilter@allycomm.com> wrote:
> In reworking my ruleset to get around the "NAT can't be in inet table"
> challenge, it is looking as though the accessible namespace for a table may
> be just that table itself.
>
> If true, this would mean that if you're dual-stack and using NAT, you can't
> have a unified ruleset in inet, but have to replicate and maintain most
> everything in both ip and ip6 tables.
>
> This was revealed in an attempt to manage a set containing the ports to be
> mapped in one place, then be able to access it from both IPv4 and IPv6
> configuration (NAT, as well as traffic rules).  It isn't tidy or robust to
> have manage this "list of ports" for IPv4 NAT, potentially IPv6 NAT, IPv4
> filtering, and IPv6 filtering (especially as add/remove(?) changes to
> multiple sets can't be easily done atomically).
>

By now, sets are defined per table. We have no plans so far to change
this in the short term.
And yes, NAT statements are required to be in either 'ip' or 'ip6'
families. No NAT in other families.
This is already documented in wiki and a proper error is reported by
nftables. Not sure what more do you miss here?

The inet family may become a fully-fledged family at some point in the
future, this has been discussed in Netfilter Workshop 2017 in Faro,
Portugal.
But right now, NAT can only be done in either 'ip' or 'ip6'.

Not sure what you mean with the problems replacing sets atomically.
You should write your sets in plain text in files to load it later
with 'nft -f'.
Take this as an example:
https://wiki.nftables.org/wiki-nftables/index.php/Classic_perimetral_firewall_example

From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: named set for ipv4 networks
Date: Thu, 27 Oct 2016 21:23:38 +0200
Message-ID: <20161027192338.GA1570@salvia>
References: <20161023213822.16337e5c@doomgiver>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161023213822.16337e5c@doomgiver>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leon Merten Lohse <leon@green-side.de>
Cc: netfilter@vger.kernel.org

On Sun, Oct 23, 2016 at 09:38:22PM +0200, Leon Merten Lohse wrote:
> Hi,
> 
> is there a way to migrate a hash:net type ipset to nftables?
> We use this to implement a blacklist where we block a large number of
> networks.
> 
> I tried using a type ipv4_addr named set as follows:
> 
> flush ruleset
> table inet filter {
>   set blacklist_v4 { type ipv4_addr; }
> }
> add element inet filter blacklist_v4 { 10.0.0.0/8 }
> 
> However, this results in:
> Error: Set member cannot be prefix, missing interval flag on declaration
> add element inet filter blacklist_v4 { 10.0.0.0/8 }
>                                        ^^^^^^^^^^
> Is ipv4_addr the wrong type in this case? I could not find any
> documentation on it.
> Using networks in anonymous sets seems to work flawlessly.

Missing "flags interval;" here, so this should be:

        table inet filter {
           set blacklist_v4 { type ipv4_addr; flags interval; }
        }

With named sets, you have to specify this flag since the kernel uses
to select what is the best data structure uses to represent what you
need.

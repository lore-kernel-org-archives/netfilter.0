From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Error: conflicting intervals specified - Bullseye 0.9.8
Date: Thu, 16 Sep 2021 11:29:24 +0200
Message-ID: <20210916092924.GB31336@salvia>
References: <ab060c71-e640-a67e-347f-60cd1d800932@tootai.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ab060c71-e640-a67e-347f-60cd1d800932@tootai.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel <tech@tootai.net>
Cc: Netfilter list <netfilter@vger.kernel.org>

On Wed, Sep 08, 2021 at 11:33:02AM +0200, Daniel wrote:
> Hi,
> 
> I get the following error with the above nft version, lan being the
> interface name:
> 
> add element ip6 nat fwdtoip_tcp.lan { 1-65534 : 2001:db8:27b:10:ff9b::,
> 1-65534 : 2001:db8:27b:ff9b::c0a8:ad1}
> 
> with
> 
> add map ipv6_addr nat fwdtoip_tcp.lan { type inet_service : ipv6_addr\;
> flags interval\; }
> 
> What's wrong here ? My goal being to redirect all (or range ports) external
> traffic to another server.

Could you develop what your use-case is?

Keys uniquely identify an entry in a map, if you define two entries
with the same key, you hit this conflict interval error.

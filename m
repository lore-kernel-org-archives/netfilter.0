From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: Example involving payload_raw_expr
Date: Mon, 14 Dec 2015 18:29:31 +0100
Message-ID: <20151214172931.GA1513@salvia>
References: <565C4F06.5030102@secunet.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <565C4F06.5030102@secunet.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Berghofer <stefan.berghofer@secunet.com>
Cc: netfilter@vger.kernel.org

On Mon, Nov 30, 2015 at 02:28:38PM +0100, Stefan Berghofer wrote:
> Hi all,
> 
> I just tried out the example file tests/payload-ll distributed with nftables,
> which makes use of payload raw expressions of the form "@..,..,..". While the first
> two declarations in the file, i.e.
> 
>   nft add table ip filter
>   nft add chain ip filter input \{ type filter hook input priority 0\; \}
> 
> work as expected, the third declaration
> 
>   nft add rule ip filter input @ll,48,48 00:15:e9:f0:10:f8 counter
> 
> is rejected with the error message
> 
>   Error: protocol specification is invalid for this family

It seems this got broken at some stage of the development, so it would
be good to get this back working and add tests to our regression test
infrastructure so we make sure this doesn't break again.

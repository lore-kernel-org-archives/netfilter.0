From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Flowtable with ppp/bridge
Date: Mon, 26 Apr 2021 19:29:24 +0200
Message-ID: <20210426172924.GA3178@salvia>
References: <16CF72C8-335A-48D2-BA6F-FF632735DCFD@public-files.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16CF72C8-335A-48D2-BA6F-FF632735DCFD@public-files.de>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Wunderlich <frank-w@public-files.de>
Cc: netfilter@vger.kernel.org

On Mon, Apr 26, 2021 at 05:30:47PM +0200, Frank Wunderlich wrote:
> Hi,
> I try to setup a flowtable for use with ppp(oe) and bridge interface.
> 
> http://forum.banana-pi.org/t/new-netfilter-flow-table-based-hnat/12049/60?u=frank-w
> 
> table ip filter {
> flowtable ft {
> hook ingress priority 10;
> devices = {"ppp8","lanbr0"};
> flags offload
> }
> 
> I cannot get nft (0.9.8) apply this
> 
> Any idea? Is there a kernel option or something in nft missing?

Someone already replied to you:

http://forum.banana-pi.org/t/new-netfilter-flow-table-based-hnat/12049/63

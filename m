From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: tproxy with nftables
Date: Thu, 8 Jan 2015 11:56:25 +0100
Message-ID: <20150108105625.GA3735@salvia>
References: <1981739983.1515764.1420466742999.JavaMail.zimbra@tpip.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1981739983.1515764.1420466742999.JavaMail.zimbra@tpip.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Schultz <aschultz@tpip.net>
Cc: netfilter@vger.kernel.org

On Mon, Jan 05, 2015 at 02:05:43PM +0000, Andreas Schultz wrote:
> Hi,
> 
> Is it possible to use tproxy with nftables?

No native tproxy support yet and noone is scheduled to work on that
anytime soon, sorry.

> It seem that nft has no support for the tproxy table. It might
> be possible to use a mix of nft and xtable-compat to get tproxy
> to work on nft.

I posted a patch time ago to:

http://patchwork.ozlabs.org/patch/255896/

the main problem was that getopt() gets confused when this is used
from the command-line (so it works fine with nft -f). The internal
state of getopt() needs to be reset before calling libxtables to parse
the options.

> But I would like to use a map to lookup a match and then use tproxy
> as action. I there a way to get this working?

I would need to know more on your use-case to be sure that the patch
above will help you to achieve this, otherwise wait for the native
tproxy support :-(.


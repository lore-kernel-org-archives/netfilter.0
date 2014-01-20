From: Patrick McHardy <kaber@trash.net>
Subject: Re: [HEADS UP] libnftables renamed to libnftnl
Date: Mon, 20 Jan 2014 13:52:51 +0000
Message-ID: <20140120135250.GA5495@macbook.localnet>
References: <20140120121935.GA2794@localhost>
 <52DD2997.4040506@linux.intel.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52DD2997.4040506@linux.intel.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomasz Bursztyka <tomasz.bursztyka@linux.intel.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

On Mon, Jan 20, 2014 at 03:50:15PM +0200, Tomasz Bursztyka wrote:
> Hi Pablo,
> 
> Thus we have to adapt iptables to look for libnfnl headers instead
> of libnftables?
> (and nftables too btw).

Crap, indeed, seems the change to configure.ac was not complete:

AC_CHECK_LIB([nftables], [nft_rule_alloc], ,                                    
             AC_MSG_ERROR([No suitable version of libnftnl found]))


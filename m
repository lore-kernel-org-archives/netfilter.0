From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: How to add bordering ip-ranges to a named set
Date: Thu, 7 Jul 2016 20:33:20 +0200
Message-ID: <20160707183029.GA1317@salvia>
References: <nljcua$m72$1@ger.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <nljcua$m72$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Taube <no_html.max50kb@nurfuerspam.de>
Cc: netfilter@vger.kernel.org

On Wed, Jul 06, 2016 at 06:51:21PM +0200, Matthias Taube wrote:
> Hi,
> 
> if I define a named set in nftables
> >nft 'add set inet filter black2 {type ipv4_addr; flags interval; }'
> >nft add element inet filter black2 { 192.168.1.1/24 }
> 
> it is not possible to add bordering ip-ranges:
> >nft add element inet filter black2 { 192.168.2.1/24 }
> ><cmdline>:1:1-49: Error: Could not process rule: File exists
> >add element inet filter black2 { 192.168.2.1/24 }
> >^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> but if I add the ranges in ONE command it works:
> >nft add element inet filter black2 { 192.168.1.1/24, 192.168.2.1/24 }
> 
> then the ranges are put together to one ip-range:
> ># nft list set inet filter black2
> >table inet filter {
> >	set black2 {
> >		type ipv4_addr
> >		flags interval
> >		elements = { 192.168.1.0-192.168.2.255}
> >	}
> >}
> 
> How it is possible to create a set to flexible add and delete bordering
> ip-ranges?

This is fixed in the upcoming 4.7, you can give a try to 4.7-rc6. You
also have to install nft 0.6.

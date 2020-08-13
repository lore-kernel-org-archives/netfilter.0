From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: Is it possible to change a chains default policy when rules are
 already present?
Date: Thu, 13 Aug 2020 23:38:53 +1000
Message-ID: <20200813133853.GA19665@smallstar.local.net>
References: <AM0PR06MB4628C196EBABF0FD53AA8006C5430@AM0PR06MB4628.eurprd06.prod.outlook.com>
 <27311b7d-1192-3c01-3398-bcaa34856ffe@thelounge.net>
 <AM0PR06MB4628EC9ADC47B01F8B6DFDB1C5430@AM0PR06MB4628.eurprd06.prod.outlook.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM0PR06MB4628EC9ADC47B01F8B6DFDB1C5430@AM0PR06MB4628.eurprd06.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, Aug 13, 2020 at 12:50:54PM +0000, Andreas Hoefler wrote:
> Hi
>
> Thx for the quick reply. Forgot to mention I am using NFTables...but I guess this should be then possible as well.
>
> Thx
> Andy
>
> Am 13.08.20 um 14:28 schrieb Andreas Hoefler:
> > I have a chain with default policy drop.
> > I would like to first have the default policy set to accept, then add rules and later change it to drop.
> > Is this possible?
>
> iptables -t <table> -P <CHAIN> ACCEPT
> iptables -t <table> -P <CHAIN> DROP

Hi Andy,

If you are using individual nft commands then yes, you can do that.

But there is no need to do it if using an nft script (#!/usr/sbin/nft -f), since
nothing is sent to the kernel until the script is all done, and then the kernel
makes all the changes atomically (i.e. all processes are locked out until all
the changes are done).

Cheers ... Duncan.

From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Is it possible to change a chains default policy when rules are
 already present?
Date: Fri, 14 Aug 2020 13:07:49 +0200
Message-ID: <20200814110749.GA30331@salvia>
References: <AM0PR06MB4628C196EBABF0FD53AA8006C5430@AM0PR06MB4628.eurprd06.prod.outlook.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM0PR06MB4628C196EBABF0FD53AA8006C5430@AM0PR06MB4628.eurprd06.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, Aug 13, 2020 at 12:28:34PM +0000, Andreas Hoefler wrote:
> Hi
> 
> I have a chain with default policy drop. 
> I would like to first have the default policy set to accept, then add rules and later change it to drop. 
> Is this possible?

For the record:

 nft add chain x y { policy accept\; }

Assuming an existing basechain 'y'. The backlash (\) before the
semicolon is there in case of invoking this from bash.

From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables map with numgen type, not sure if it was implemented?
Date: Mon, 31 Aug 2020 17:25:10 +0200
Message-ID: <20200831152510.GB2725@salvia>
References: <!&!AAAAAAAAAAAuAAAAAAAAAGg7dk9mYqJGhbBt3m/ghGwBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAABJQLj6e+mFSq/mTrWisCc4AQAAAAA=@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <!&!AAAAAAAAAAAuAAAAAAAAAGg7dk9mYqJGhbBt3m/ghGwBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAABJQLj6e+mFSq/mTrWisCc4AQAAAAA=@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eliezer Croitor <ngtech1ltd@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, Aug 27, 2020 at 06:34:35PM +0300, Eliezer Croitor wrote:
[...]
> lb-r4:/tmp# nft add map nftlb m2 '{ type typeof numgen random mod 2 :
> verdict; }'
> Error: syntax error, unexpected typeof
> add map nftlb m2 { type typeof numgen random mod 2 : verdict; }
>                         ^^^^^^
[...]
> 
> Am I right for even trying it?

What nft version are you using?

typeof support was introduced in nft >= 0.9.4.

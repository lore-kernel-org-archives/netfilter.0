From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: device list reversed
Date: Tue, 20 Apr 2021 13:28:04 +0200
Message-ID: <20210420112804.GA26530@salvia>
References: <trinity-199f77e0-dc05-45d9-85a6-3b583adcee10-1618146461717@3c-app-gmx-bap41>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <trinity-199f77e0-dc05-45d9-85a6-3b583adcee10-1618146461717@3c-app-gmx-bap41>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Wunderlich <frank-w@public-files.de>
Cc: netfilter@vger.kernel.org

Hi,

On Sun, Apr 11, 2021 at 03:07:41PM +0200, Frank Wunderlich wrote:
> Hi,
> 
> i import ruleset by file with a devicelist (flowtable)
> 
> devices = { wan, lan0, lan3 }
> 
> and if i do a nft list ruleset, it gets reversed
> 
> devices = { lan3, lan0, wan }
> 
> imho this is a cosmetic thing, but strange anyway
> 
> took a look in ./libnftnl/src/flowtable.c but it seems the loop is always done in forward way
> 
> any idea why this happen?

Each device is represented as a hook, and hook are registered using
list_add() IIRC, which is reversing the order.

Probably just sort device names alphanumerically?

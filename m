From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: NOTRACK equivalent
Date: Wed, 11 May 2016 22:49:54 +0200
Message-ID: <20160511204954.GB24369@salvia>
References: <1462869799.1641.3.camel@idealista.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462869799.1641.3.camel@idealista.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ricardo Fraile <rfraile@idealista.com>
Cc: netfilter@vger.kernel.org

Hi Ricardo,

On Tue, May 10, 2016 at 10:43:19AM +0200, Ricardo Fraile wrote:
> Hello,
> 
> 
> How is possible to avoid tracking in nft as its done in iptables with
> NOTRACK?
> 
> For example:
> 
> iptables -t raw -I PREROUTING -j NOTRACK
> iptables -t raw -I OUTPUT -j NOTRACK

This extension doesn't exists yet.

Please fill a bug in bugzilla so we can assign this task to anyone.

From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: nf_acct and quota support ?
Date: Wed, 10 Aug 2016 15:37:02 +0200
Message-ID: <20160810133702.GA16543@salvia>
References: <91a3fab3-fd7d-02bc-4caa-107af0a39495@toulouse.viveris.com>
 <20160810123430.GA16233@salvia>
 <1500e903-050f-cca2-02b7-ac2fc8948b39@toulouse.viveris.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1500e903-050f-cca2-02b7-ac2fc8948b39@toulouse.viveris.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jalvarez <jalvarez@toulouse.viveris.com>
Cc: netfilter@vger.kernel.org

On Wed, Aug 10, 2016 at 03:14:38PM +0200, jalvarez wrote:
> In the end, do you think the following features could be added in nftables ?
> - an expression to increment nfacct counters (maybe reusing the existing
> semantic "counter xxx").
> - an expression to match if the quota set on the nfacct object is exceeded.
> Something like : "counter name xxx overquota".
> 
> This could lead to interesting things like starting to drop packets when a
> quota is exceeded.

Yes, quota support is also included. And similar semantics to nfacct
will be retained.

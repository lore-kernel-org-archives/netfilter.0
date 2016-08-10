From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: nf_acct and quota support ?
Date: Wed, 10 Aug 2016 14:34:30 +0200
Message-ID: <20160810123430.GA16233@salvia>
References: <91a3fab3-fd7d-02bc-4caa-107af0a39495@toulouse.viveris.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <91a3fab3-fd7d-02bc-4caa-107af0a39495@toulouse.viveris.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jalvarez <jalvarez@toulouse.viveris.com>
Cc: netfilter@vger.kernel.org

On Wed, Aug 03, 2016 at 04:06:09PM +0200, jalvarez wrote:
> Hi,
> 
> I am currently trying to add quotas for traffic that matches some nftables
> rules.
> While looking for a solution I have found the netfiler accounting
> infrastructure (nfacct) very interesting.
> Problem is I didn't find anything about nfacct in the nftables code.
> 
> Is there any nftables support (or planned support) for nfacct ?

I have a patchset that I need to spin over again, but it's coming with
native support for nftables.

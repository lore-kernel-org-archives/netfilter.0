From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables kernel bug
Date: Tue, 29 Nov 2016 23:54:30 +0100
Message-ID: <20161129225430.GA8487@salvia>
References: <2097005.VXRZyRJPl3@nemmerle>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2097005.VXRZyRJPl3@nemmerle>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Bednar <martin@serafean.cz>
Cc: netfilter@vger.kernel.org

On Tue, Nov 29, 2016 at 11:37:21PM +0100, Martin Bednar wrote:
> Hi, I just hit a kernel bug using nftables.
> Using kernel 4.8.11.
> 
> Inline is a minimal configuration file to reproduce and the dmesg log.
> Let me know if you need anything else.
> 
> Martin.
> 
> Minimal configuration to reproduce: 
> 
> table inet filter{
> 	map iface_rules {type iface_index : verdict;}
> 	chain lan1{
> 	}
> 
> 	chain input{
> 	type filter hook input priority 0;policy accept;
> 
> 	iif vmap @iface_rules
> 
> 	}
> }
> add element inet filter iface_rules {enp0s18 : jump lan1 } #BUG_ON here.

Fixed by:

http://git.kernel.org/cgit/linux/kernel/git/pablo/nf.git/commit/?id=58c78e104d937c1f560fb10ed9bb2dcde0db4fcf

Will pass this to -stable asap.

Thanks for reporting.

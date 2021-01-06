From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables Set Bug with interval & timeout Flags
Date: Wed, 6 Jan 2021 15:03:02 +0100
Message-ID: <20210106140302.GA5857@salvia>
References: <5c90f2e3-76ac-1b00-1ca8-fab74bfd97cd@softtalker.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5c90f2e3-76ac-1b00-1ca8-fab74bfd97cd@softtalker.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Mike Dillinger <miked@softtalker.com>
Cc: netfilter@vger.kernel.org

Hello Mike,

On Thu, Dec 10, 2020 at 09:35:35AM -0800, Mike Dillinger wrote:
[...]
> Step 4: Now restart nftables and observe the failure condition
> $ systemctl restart nftables.service
> $ nft list set ip filter test2
> table ip filter {
>         set test2 {
>                 type ipv4_addr
>                 flags interval,timeout
>                 counter
>                 timeout 10m
>                 gc-interval 1m
>                 elements = { 1.1.1.1 expires 9m48s864ms counter packets 0 bytes 0, 8.8.8.0/24 expires 9m48s864ms counter packets 0 bytes 0 }
>         }
> }
> 
> Note the timers reset when the service restarted even though they
> were saved to /etc/nftables.conf.  And again, this behavior is only
> present when the interval flag is set.  I have other sets of type
> ipv4_addr not using the interval flag and those timers are preserved
> on reset/reboot.

This is the fix for the issue you're observing:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20210106140119.10915-1-pablo@netfilter.org/

Thanks for reporting and for your patience.

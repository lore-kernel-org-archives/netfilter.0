From: Eric Garver <eric@garver.life>
Subject: Re: nft 0.9.8 - error in mnl.c - with addition hw interfaces
Date: Wed, 22 Sep 2021 08:31:05 -0400
Message-ID: <YUsiCXbyAnuvyFCn@egarver.remote.csb>
References: <trinity-470c22f9-5190-479b-9f59-3088360d78f3-1632307777449@3c-app-gmx-bs53>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <trinity-470c22f9-5190-479b-9f59-3088360d78f3-1632307777449@3c-app-gmx-bs53>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Wunderlich <frank-w@public-files.de>
Cc: netfilter@vger.kernel.org

On Wed, Sep 22, 2021 at 12:49:37PM +0200, Frank Wunderlich wrote:
> Hi,
> 
> i try to add second gmac on bpi-r2 and modified dts in linux-kernel.
> 
> normally all traffic from the switch (lan0-lan3,wan) are routed via eth0.
> 
> (MT7623 SOC) eth0 => port6 (mt7530 Switch-chip) [wan,lan0-3]
>              eth1 => port5
> 
> 
> with dts-modification i have eth1 (second port on SOC) and aux (second port on switch) interfaces.
> 
> i had setup a vlan aware bridge over aux and wan and give it an own vlan-id, this way i can pass wan-traffic to eth1.
> 
> basicly this config, only that i don't use lanbr here but an own wanbr (bridge vid is different to lanbr)
> 
> https://github.com/ericwoud/buildR64ubuntu/blob/master/rootfs-arch/etc/systemd/network-RT/10-wan.network
> 
> works so far, i can work over the wan-port which *should* be mapped to eth1
> 
> in the next step i wanted to try "normal" behaviour (all over eth0) but with the dts-nodes activated. network itself works, but on running nft (list ruleset) i get this error:
> 
> root@bpi-r2:~# nft list ruleset
> mnl.c:45: Unable to initialize Netlink socket: Protocol not supported

Check your kernel config for

  CONFIG_NETFILTER_NETLINK=m


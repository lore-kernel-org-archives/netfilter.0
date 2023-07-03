From: Serg <seentr@at.encryp.ch>
Subject: Best practices on iif usage at persistent ruleset
Date: Mon, 3 Jul 2023 10:40:26 +0300
Message-ID: <ede291f8-c556-0d0c-d598-7c69f387ed74@at.encryp.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=at.encryp.ch;
        s=flopster; t=1688370027;
        bh=lbEEid1qzfGsxhijSmFcuy9OrLm1y5InGeh3zs0F1Ek=;
        h=Date:From:To:Subject;
        b=xBM7/03Kr5JydEl2nRyYlUk5iCToiaRgOaL7bSA9CdF2+55XDHNBwKtF7c6/kMVdm
         8/G/GDiAvBzMSGFB15yVhlQFICh+a14XgDJUEhroKonTnrCXP/yGt9CgB+kACCyUIk
         WIEboj+dQmhCQ9w5q3uJ51lpqZqSBeXspSNyA9KQ=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello netfilter community,

How do you deal with iif used at persistent ruleset? Personally, my 
issue is that VLAN device is not created at the moment when 
nftables.service is started on boot, thus the following error happens:

> Error: Interface does not exist

To solve this issue I use this systemd service override configuration:

> # /etc/systemd/system/nftables.service.d/override.conf
> # Configuring the nftables to start after the network has been started
> [Unit]
> Before=
> After=network-online.target

But are there any alternatives approaches to this issue?

I know that there is iifname as a safe alternative, but as far as I know 
it has huge performance drawback and thus its' usage is discouraged in 
my case.

From: zrm <zrm@trustiosity.com>
Subject: Re: nf_conntrack_max
Date: Thu, 1 Sep 2016 11:18:02 -0400
Message-ID: <7e06cce8-6b80-886e-f605-9713f8de32ad@trustiosity.com>
References: <000e01d203d5$3e576d00$bb064700$@bluemarble.net>
 <20160831224731.GP28999@harrier.slackbuilds.org>
 <20160901105911.GA2779@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
        s=mx; t=1472743043; bh=VO+DaoYxB7kMyDQCFdZyuNWXA5MYUX7VyPEIhaxV3fo=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=2RzbOQq3yj6xBGkRYhk0kHohubJJd9yg3Cxh7iI7yBdilokEjU8zsT/gVOPVgVlXY
         ILvBBAdcOTZVEQP1TdK86JwcdDYu3YOX636R/tZk60Q08y/7hSx6LR6VLm4TrlhgQh
         llQfZvib7rvmO5VNvs48f9fMVnmnfs5shtdG75gU=
In-Reply-To: <20160901105911.GA2779@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org


On 09/01/2016 06:59 AM, Pablo Neira Ayuso wrote:

> Setting custom timeout policies per address/protocol/port (any
> selector basically) is possible through -j CT --timeout name from the
> raw table.
>
> You have to create the timeout policy in first place through 'nfct'
> that comes in the conntrack-tools package. I think there are examples
> for this already, otherwise let me know and we can place it on the
> manpage.

There is a TCP example on the nfct manpage but it would be helpful if it 
listed what timeouts are possible to set for each protocol (syn_sent, 
time_wait, etc.) corresponding to ip_conntrack_[proto]_timeout_[state] 
in net.ipv4.netfilter. Especially how to set the timeout corresponding 
to ip_conntrack_udp_timeout since it doesn't follow the pattern.

FWIW it would also be useful (in another context) if there was a stable 
way to set these values for a specific conntrack entry.

From: =?UTF-8?Q?Laura_Garc=C3=ADa_Li=C3=A9bana?= <nevola@gmail.com>
Subject: [ANNOUNCE] nftlb 1.0.9 release
Date: Wed, 13 Sep 2023 17:32:33 +0200
Message-ID: <CAF90-Wg4NTjfUE7pomw8VnQAjSQC2OXa5FQFH_XwK=zf1nOn4A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694619211; x=1695224011; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LsIGUVYLG51ZiWYJq7FwzO7gDs/2DvpvrxoOWIorm5c=;
        b=YVAsNLcw19E+fD/tOBmYWo16Cx0Z+hK1DpZVcdGzfUs7OAp3Gg8urLA9E/JIhpBL0u
         WPujZQBaUINbV/ky5RopMd6oKB0oRDGYL7NJWtNMyGRJr432+LjUJFoyTh/6pqqO9KCv
         ukYq/vR/ugr2HUmKrNE1WnSkm7dQNMQNGHc5oggrS9Mje4mH7mPuu2Yxs7fgeIu+eqXC
         Ygtns4cnXNZlA3Ft6iRWQU/RYMY0WchxelN0V73FYRsvMfbAvHWeEAMl18jbLpvTSmYY
         F+drOKKuXf4vffnJWBgTooKSdB5UMJQB5x8OyjWpZq4Ubahi1gEg5Oh0lvxSyfUn6ji2
         eq1w==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mail List - Netfilter <netfilter@vger.kernel.org>, Netfilter Development Mailing list <netfilter-devel@vger.kernel.org>

Hi!

I'm honored to present

    nftlb 1.0.9

nftlb stands for nftables load balancer, a user-space tool
that builds a complete load balancer and traffic distributor
using the nft infrastructure.

nftlb is a nftables rules manager that creates virtual services
for load balancing at layer 2, layer 3 and layer 4, minimizing
the number of rules and using structures to match efficiently the
packets. It comes with an easy JSON API service to control,
to monitor and automate the configuration.

Most important changes in this version are:

* Protect daemon authentication key against timing attack
* Fix bulk application of farm policies with PATCH


For further details, please refer to the official repository:

https://github.com/relianoid/nftlb

You can download this tool from:

https://github.com/relianoid/nftlb/releases/tag/v1.0.9

Special thanks to the contribution of Samuel Forestier.

Happy load balancing!

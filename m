From: =?UTF-8?B?U3ZlbiBLw7ZobGVy?= <sven.koehler@gmail.com>
Subject: Re: how to ignore forwarded traffic?
Date: Mon, 21 Apr 2014 17:56:38 +0300
Message-ID: <535531A6.6090602@gmail.com>
References: <lj1rka$f3l$1@ger.gmane.org> <CAEzD07Kz6bh16_YFTv-sgO0ZoXAneOwUUQt7=Kg6fy2b8LCY7w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=MSFVHuYncMQdnDnZmTgElhwltNk+wQcTtJpRWKaEPO8=;
        b=lzdA3uhlh688ApFyK3o7BbbhpaiGCvIvovtGYc0ekYtn2wMeqyoGUaqvnUxMiZx/Jr
         2yK1ck2smEakaqwZvnnCSLeizsOMkvzU4E8sxToU0Iz2les53eXb1SNKLkpy8IZIFJp7
         Gc8vMk93pNhstoMveKVLhrj01kmJWDTxlyP0pIEfD5mHc5LcLqEyhPsPGCCKp8twJumi
         AfqRQHrw2DoCT9/Xb9fw1oA7dvU6ZWULD0zu/dnvzJTaFeeCJ2NuccSSpZXbyw0q8Ek0
         obdZBK6K+qNe0Y60TpP4YmCqoVli5QTumRNDDK4L9BGmxZe6uG0HWxI9679yuXmCqnnS
         ZIQg==
In-Reply-To: <CAEzD07Kz6bh16_YFTv-sgO0ZoXAneOwUUQt7=Kg6fy2b8LCY7w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anton 'EvilMan' Danilov <littlesmilingcloud@gmail.com>
Cc: netfilter@vger.kernel.org

Am 21.04.2014 11:38, schrieb Anton 'EvilMan' Danilov:
> Hi, Sven.
> 
> You can disable conntrack at all by removing of the module.

Assume, the firewall protecting the router is stateful (i.e., it uses
conntrack).

> Also you can disable conntrack only for specifyed connections with CT
> target (--notrack option).

I know have the following three rules:

iptables -t raw -A PREROUTING -d <router-ip> -j CT
iptables -t raw -A PREROUTING -s <router-ip> -j CT
iptables -t raw -A PREROUTING -j CT --notrack

So any traffic directed at the router or coming from the router should
be conntracked while all other traffic is not.
Note, that I don't have any rules in the OUTPUT chain of the raw table,
as it seems to me that the default (connections are conntracked) is fine.

Do the above rules seem OK to you?


Regards,
  Sven

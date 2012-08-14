From: Denis <yefremov.denis@gmail.com>
Subject: Re: [PATCH] [NETFILTER] bridge: rcu_deref outside read-lock section
Date: Tue, 14 Aug 2012 11:32:37 +0400
Message-ID: <5029FF15.4030903@gmail.com>
References: <1344898062-23633-1-git-send-email-yefremov.denis@gmail.com> <20120813163641.69a8388a@nehalam.linuxnetplumber.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=zU1snSn/26IDJZICiQepFsfdFcq2JJiieF2kRrDGRFI=;
        b=o/ysFG3BjqWbroubPx8UKz6gNjSOSE2UzEIVZbrFXKmoqJPLkgWi1+sQjuWA9F+waG
         9poLjFt/ZMzzpe0M4sbC7zBvTPCEBMtRw2X27GG2XTKJnYZvPfsJAVrgD0nd6NnK9aE2
         hYBIX7YrTidBH2/8QQsrfOMn7LhoNMoMzR7YSR7MN5yJ/CCJ0Q3dMDTZwE1qs2NNwPBB
         VJuozkHIM3GG7x3v9N6woZqaOCsRcR0LOrnsOq3fdGkFqiYbqirP1iijtlYcyH4rzC4h
         qqfV6y5YorNfs7HraqP8VCcrGclhgQpzbUWoaDeR+UzXgqOlQKE+qa1642pGptHXiVmo
         dSqg==
In-Reply-To: <20120813163641.69a8388a@nehalam.linuxnetplumber.net>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Stephen Hemminger <shemminger@vyatta.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Patrick McHardy <kaber@trash.net>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, linux-kernel@vger.kernel.org, ldv-project@ispras.ru

On 14.08.2012 3:36, Stephen Hemminger wrote:
> Why not just move the rcu_read_lock() in br_dev_xmit earlier? 

I don't know the semantics of this code, so it's difficult for me to
choose the appropriate place. I thought that the callers
of br_nf_pre_routing_finish_bridge_slow function are limited to
br_dev_xmit and we can modify header without problems.
Anyway, I will send another version of the patch.


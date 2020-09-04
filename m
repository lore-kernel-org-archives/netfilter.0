From: Devin Bayer <dev@doubly.so>
Subject: synproxy with NAT
Date: Fri, 4 Sep 2020 15:24:41 +0200
Message-ID: <03b956ff-9d05-1bc1-80b0-c73ee1a19ffd@doubly.so>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=doubly.so; s=MBO0001;
        t=1599225885;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=nhGb0KNjq0TA9C2UHDGmpkzQEQ7UyKBvGKThdThzJZw=;
        b=dgBAaAEVMsFK4Nk6uEf2mvyACDUXq4XH90nPkZqo6RIasbXZOGtuQGy3nrfledX/HQX5NX
        BCdhNGSvCEGY34yD7QihH+5IGWuhmv2+ngP7h8CpM2v1ZPc0JDGi1YiEgqs1eP/j89oRPA
        N7K1tx1BQl/3x9AIBSR6iM2iwgbzVxVZb95LU3jjjUZ3atkyemYos5uP/NnaB91UYipTCR
        0+Rka4eBymkiUrdos2pyCY5KJcDd6UUR2S54Gu16eFuO70LUtCXJWCnUNhuSWfB6nEiyET
        LNcQEmUgp03vwNpeEtGDexqttdAoyBBVW34k7A2czUcNQFanM7RI2zjjo2drkw==
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

does anybody have an example of using synproxy with NAT, especially 
docker containers?

I tried putting this statement in my forward chain, but then nothing 
gets through:

   chain forward {
     type filter hook forward priority -1
     tcp dport 443 synproxy mss 1460 wscale 7 timestamp sack-perm
     ct state invalid drop
     policy accept
   }

I would imagine it makes most sense to put it in the prerouting chain, 
so it's applied before NAT, but that is apparently not allowed.

Any pointers appreciated.

Thanks,
Devin

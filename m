From: khawar shehzad <shehzad.khawar@gmail.com>
Subject: NFTABLES - Can we do filtering based on SRC address before doing DNAT
Date: Thu, 24 Aug 2017 10:23:10 +0100
Message-ID: <645e0d25-9505-b703-023c-75c5a5878494@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=LD5p79CUJkMeeZ/vGHU4GmVyhuqoDKdiLJTWeYLGnkE=;
        b=jKEOhQqE1n2jGUpoUSh5Rt/qkvhKfSqCSFY7Pr+JvX1gVtZj0B0l4eK/EbNj7dEqD1
         s7fjAfMJhDSMSOMfWhW6X2tIM3yT695ibE9AQo0D8SzWQi7VkzxJDXEo+o/iCEh/g/BQ
         Snp3nuznJy7i+4KgJKiv0YoHAj9GZm6mYKNE+EfGRvd5X441Sv9RcfYn/svIJA6VmtFW
         BAZD6tihzXdks6H59HcUaIgR+0/pVHCRXBBV0QGPWenyLg9zLQXzWcXorSHfWUVhR75A
         CU7CPzY0B2amQbtSYBYmcxMiuxQbEN7K2dv8WVhjrrCJzeudk5DHViTiHYMgDq6KXVXl
         4Qmg==
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,

I hope all is well.

Can we do filtering based on the source address before doing DNAT in 
nftables?

If so are there any directions for them OR is there something that I 
need to know.

I heard that it can be done in iptables using raw table. But what about 
nftables? I need to do it with nftables because I want to make use of 
latest features e.g. verdict maps.

Cheers,

Khawar

Infoginx.com


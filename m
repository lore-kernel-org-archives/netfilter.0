From: marek <cervajs64@gmail.com>
Subject: ipset swap to nftables set
Date: Fri, 29 Sep 2023 15:44:14 +0200
Message-ID: <befa0f8e-e76f-8671-81b1-587351b0cf53@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695995057; x=1696599857; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r3Tka524mDD+J576uZllQwxvBMTwSzdEMJb97GgdKkw=;
        b=N2iA7KLcS6dkUQ7omwbwVFdDqRozLABfzbPiWwHUdZsT+cyrDYtJp7qSFPRAlqI3QF
         wfrMBumvq6N5uPIwsGU50GOJE1WQiSeXhsAxKzATcWeMyOKKvlJO4qm6N0KtcBfV7o3c
         tTPmCVMkRpAXTtofRoJjCswlx7WgfNmBVEF+HuMHgZj06UpXR8ZtmuB0zPRAdI1MpK61
         +gDnSsePwUDHgSkHGJN5xO9prcLzENfY/fd9oBFZkRHCVLXs70gtMPCeF3zA7Rj8sWl5
         FNG2ObLJyq5CkdVOBHxGK/fKOihW/aW+XWAk02S3yf1k+oIvmbhgMqh68Z5QJq8DcpMo
         WGRw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

hi,

i'm using in production ipset swap with ~3000 ip addr

i.e.

- change coming from customer (new ips, old ips deprecated)

- generation of new list /etc/sysconfig/ipset-new

- swap ipset-new with ipset

transaction is near real-time


now i'm moving from RHEL7 to RHEL9 (rocky, kernel 5.14, nftables 1.0.4) 
and trying move from ipset to nftables sets

nft add set ip filter blackhole { type ipv4_addr\; comment \"drop all 
packets from these hosts\" \; }
fill the set

now the new flow is

- change coming from customer (new ips, old ips deprecated)

- nft flush set ip filter blackhole

- nft add element ip filter blackhole { X }   (bash for loop)


it tooks 10sec

can you recommend better way? (performance similar to ipset swap)

thanks

Marek


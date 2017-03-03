From: Jamal Hadi Salim <jhs@mojatatu.com>
Subject: ANNOUNCE: Netdev 2.1 update Mar 03
Date: Fri, 3 Mar 2017 17:34:22 -0500
Message-ID: <4112ce7e-f793-9982-64c4-d9c3aeb3835e@mojatatu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=bQw5fpM37e327kwKwcy9ftmKqQVnm18BXCNEkuSo+bI=;
        b=B+gMbUKOTMCViZ1S1IxUOV3iBLyKK6ziIzYglt9BX1mTQ24v6Xu+Vb24skqas+CYfp
         hHREUUNT49a700hpwZKBCoIcvNm2Oq09pkmTRnp9H23/tV5yu4aWw7x0+f8ma09Sl5tp
         14DdUMh/5WVj0KmNAo6/ppPZgyN5kiNPv5eBeesgNEYosvBD+tB63k9e/Sl0tXURy2ED
         X/wt8Dhb9Z7pVbG8yF48AIPPmkgQzoslejE2E9cyBj2ho72Gw4hGPaaWgOyohsrlAZ9c
         6JmGi5Sfz+nLhpDgq8eqKliEkhe7ERlJYRqVPYNTfypnk87EcwXMBuUL+Xgb3VO8yQXh
         ggiw==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, linux-wireless@vger.kernel.org, tech-committee@netdevconf.org, David Miller <davem@davemloft.net>, Stephen Jaworski <jaws@mojatatu.com>, people@netdevconf.org, Brenda Butler <bjb@mojatatu.com>



The tech committee has accepted a new workshop on
Network Performance chaired by Alexander Duyck

Some details:
----------
The network performance performance workshop is a follow-up of several 
mailing list threads on the netdev mailing list as well as presentations 
at Netdev 1.2. We want to discuss the progress made on various efforts 
to enable better performance through enabling new features in the 
kernel, and changing existing APIs to better enable the drivers to 
handle the ever increasing workloads.

This is an opportunity to bring together the various network device 
vendors to discuss what has worked and what hasn't in terms of enabling 
better performance in the Linux kernel ecosystem.

Topics for the session would include:

Implementing page based receive paths and page recycling and/or reuse
Zero-copy using AF_PACKET to accelerate user-space networking
Recent changes to enable better use of build_skb and XDP
Batching of Tx and Rx workloads
Kernel memory optimizations
-----

Alex will be posting a lot more details and agenda items by
the conference time.

cheers,
jamal

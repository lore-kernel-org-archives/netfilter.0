From: Patryk Sondej <patryk.sondej@gmail.com>
Subject: [PATCH 0/2] netfilter: nfnetlink_log & nfnetlink_queue: enable cgroup id socket info
Date: Fri,  5 May 2023 04:03:30 +0200
Message-ID: <20230505020332.9338-1-patryk.sondej@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683252224; x=1685844224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nm/ASM/8sn0sxkPsqx6d3CRnWMnZNjxUIeOJ9v3oynA=;
        b=KsgcCDjN95HldG3BpJBuN4d64UAb1MrLCYKy6h6nzcSK1FIB/TUXGLYrd0pnbapFlt
         BKgUY/aCeKWg6ByYizzK64TzXQ7qsz9BOh9oLsJ+IyosfmkXD57ug8kD12ELv+wMjmA7
         PvFWNLaq00yiLM1WZ27e/Lx2RQ3qXZGcu0CgrVwzOBBnwDh6SbzsH57Otg+eCqJJJZNQ
         mS0DP6feHXBSVYJCkf3xSFPFqgZFQCtUOzLFpmuz0hAGev9IbQ7Rf8p/mva5XX+w9Wce
         2NyOOcjtWTw9FqlYYxBW84MoZF4/3Y7CMJBDNozRBzxkARIB/MK8rZMKdxn85mvax18z
         EB/g==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

I'd like to propose this patchset that adds support for retrieving cgroupv2 ID. 
This functionality is useful for processing per-cgroup packets in userspace using nfnetlink_log, 
or writing per-cgroup rules using nfnetlink_queue.

Please find the two patches attached.

Thanks for your consideration.

Best regards,
Patryk



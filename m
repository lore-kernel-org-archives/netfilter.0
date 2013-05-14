From: Alex Flex <aflexzor@gmail.com>
Subject: Re: syncookies load testing
Date: Mon, 13 May 2013 19:24:30 -0600
Message-ID: <5191924E.7010800@gmail.com>
References: <5191903A.20708@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=bbvl4Q3ChV+sQShsac82GgtMlEo7PAjLcDUbn3bQKgo=;
        b=xRJDvE/YSdeydYue8Rzj9r6/kWf6dBs1nwx8YBVHrEPPu20R09W1SbaAKS6lLZGltr
         JiHGKg/QlcM/BpT1weAldOspJEfXDTzZY8KtsgA4wTmdnwyPhSJbKknEviwh9VJ7Qm0v
         rOyZNnmhLBkRKv1Rn64Gi8Rgruj04FczzinzhFfZivJq3NoU3wKAJWmBDbcpWDXMZQgG
         WRQ6cJIcuL9D8zGauPXEDftLga2ye7WAYoLxQ4gReJ/q2IKVroUGQqB0Sjuqfjc3U1FU
         0dCOYG3RpPvLqBucJX+njQs+kYTo7BAC5XKnEiXksNWLM3hYPhhHEpldXrKU3GgC8FG7
         4rDQ==
In-Reply-To: <5191903A.20708@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Oh and one other thing i was wondering,

In regards to the sysctl variable: net.ipv4.tcp_synack_retries... Would 
anybody know if tweaking this have any effect over the behaviour when 
syncookies are being sent? Are there syn ack replies as well?

Thanks
Alex


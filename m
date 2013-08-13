From: Alex Flex <aflexzor@gmail.com>
Subject: Segment the conntrack table resources per chain?
Date: Tue, 13 Aug 2013 14:37:12 -0600
Message-ID: <520A98F8.5090607@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=BDa/8ZZxwz1USTxX6h99R4oa1Rfey6k6pEhKZ+g7BUU=;
        b=lVBpQEbdflJrxYNWX1BSXr2jjXAQ+VY3+z3qtJmLxPNdakaA5ofzqiZZPQZnl4Qivr
         PMkoiORCPo/OAI4DZaiQA82mmf42QEpg8bNpAVD5x5bhZh0dzi63F4VL11qcyOSObn78
         S7jRov532huReILl+x5ZNQrxz8dX6vlyHbXoAWj6enC3JnnBUu6xPvmRU7JfOKCmufwu
         jSbL6qArOEWtx9s1ZMKYLpMhNSvhX1CC1IkJaWqCvJqRGumFBFgOG8lXitkG1+4LJ5iA
         iKUqWe+tPiBfQR1nC+vFIo6l5l52N9sFBUpGuqt8m0ZSb1rHZz9ILMtKaci5b6Tpnxch
         fisQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello Netfilter,

I understand that the state table is managed by the conntrack has table 
and its size can be modified in /proc, however I would like to know if 
there is anyway to actually segment that resource on how iptables uses 
it. My goal would be to have a couple of chains each have their own 
piece of the pie, in state information.

The above is due to the fact to better isolate DoS attacks that are 
aimed to fill the state table.. so this way iam thinking the damage can 
be isolated.

If there is no conventional way, perhaps a creative way?

Thanks
Alex



From: =?UTF-8?B?TmVqYyDFoGtvYmVybmU=?= <nejc@skoberne.net>
Subject: conntrackd failback problem
Date: Fri, 13 Jul 2012 18:56:00 +0200
Message-ID: <50005320.4080907@skoberne.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=skoberne.net; s=google;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :content-type:content-transfer-encoding;
        bh=+3x5id+516kqW7nJrsLS1Yl+QKSzYNA+LHBvRSl4mVg=;
        b=GM+uuWV5ttU/TfsstKNI9VoXv+VNDRFwo6L6BiCu+1DYSK2bRe+vX+/+IVS0apwFzS
         uvNzqIZ2ddvDOlHabjGRI7i81ysrWxpf7LHlt8KiTx7bN4/FtqhSOB4cvjq2VSQ01E37
         6hm8VAHmLmdcRlAWJatuk7RnfIZLLKYlRFyFo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: =?UTF-8?B?J0x1a2EgTWFub2psb3ZpxI0n?= <luka@manojlovic.net>

Hi,

I am building a 2-node cluster of bridging firewalls (filtering on br0 
bridge device with no IP address configured). Instead of keepalived and 
friends I am simply using Spanning Tree Protocol to fail over to slave 
bridge and fail back to the master. This works great, 10-seconds of 
switchover time is acceptable for me.

I want to have stateful firewall cluster, so that's why I am trying to 
use conntrackd to sync state between the two nodes. It works when the 
fail over occurs since the states are synced at that time (all the 
states which are bound at the time when both nodes are up, show up on 
both nodes). If the master node goes down, the STP does the switch and 
since the states are in place, everything works fine. However, when the 
master node comes back again, the STP does the failback, but the states 
are not synced back to the master by conntrackd.

How to fix this? Is there any better, more "proper" way to make a 
cluster of bridging firewalls?

Thanks,
Nejc

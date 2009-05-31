From: Michael Mefford <meffordm@gmail.com>
Subject: netfilter queue
Date: Sat, 30 May 2009 23:56:10 -0600
Message-ID: <4A221BFA.20507@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=u+Ne4U4v0tL0eSzlnOJgzWfADEO4aAfwrv3uyPnW1Us=;
        b=CxW5IwHxPSvewrFyXOwJYAex+XJrO6Td82JpVilbuzM5Vk5J0oBLTz2TOgVLAOxoIM
         UdvbyEC6mv3vCSqtD1Mn7fQ+Aa7L8+lqXiDT82fVZLRd8FbNz8G7O0klCsLYoYXO+hHP
         UbH1lRg2c1UJmg8fMbcD6owvcEhLb2mpFteaI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I need to know how to interact with the netfilter queue.  My project 
needs to capture TCP packets from the queue, process them in userspace, 
and then re-insert them back into the firewall to forwarded on.  
However, I can't find any recent documentation that explains how to do 
this.  The most I can find is about 3 years old (and seemingly out of 
date).  Does anyone have good working knowledge that might help me 
understand this?


Michael.


From: Alex Flex <aflexzor@gmail.com>
Subject: Limit based on req/sec and connections/sec plus accounting
Date: Tue, 06 Aug 2013 15:28:41 -0600
Message-ID: <52016A89.8040407@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=E40K5VxzFR6Q1Ss5obG+iTSe6GMOt6poeVSz137FKFo=;
        b=xineJXjXC+hl6dYRY/r7lMdjCaVSe4o8P/gg2mjfLGGOpyDwYi+alXYqeuheeQAbw0
         kdEth+RA+LBHACCf36GYN8h+D2oMYGHywLgOmfafEBgjb4g2+6up3eHmnOWiOKfiBx8s
         rn0YwDt8M9FOjPbSU/lkJK145xHPcAE2RMooge6OjgwgRuSYHgcCG2KKHeoszPQgC4f5
         zEYz3zJqWlHSRQNJXM/Wise3MyJz3bdQ4WGs0arGWNbJDdQ41s/f5p6ZUVT8ae3Dx/Ij
         cKJgOLUHh1HX278gCPxOjuWD8s5Xjt3SRDGw1BzonNitjTVdaajFzDFwAY0A2+pTExrD
         q8cg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello Netfilter

Iam trying to limit the amount of connections/sec and requests/sec my 
server sends to a single destination IP. At the same time iam looking to 
account/poll periodically what those values are for statistics .

Is there a simple way I can accomplish this with iptables or some other 
feature in the linux kernel?

Thanks for the help

Alex

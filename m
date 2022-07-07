From: Richard Lucassen <mailinglists@xaq.nl>
Subject: CONNMARK rules
Date: Thu, 7 Jul 2022 15:17:39 +0200
Message-ID: <20220707151739.06206fa5b2536669309e8041@xaq.nl>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xaq.nl; s=202104;
        t=1657199859; bh=ia2qd7GZTFQDhuTc5f2TzCJNSG/GfZmv/2YVf/kspJo=;
        h=Date:From:To:Subject:Reply-To;
        b=XOveHzPo7M/XBmETHq552iwCoViiVXhgPJLPZ3hQADySvkrqrbRLIs86UxIQbygLM
         0vEzA1JZTsLPO0FIqJ5ExlGkl27XDkfNsqimuxUJqGlJERLAFj++uew/MoCLRNwRBY
         UMB6QGkeqUdg08qLdiVxR7xNYoo3QKMgM7wOOQlYMUDFYUk8QxryaloBoFYI0CqFYf
         dqGZpsdIlrAI0BOZISoenx+D2ZhwRg/815UHPwFR9Hg+nth+23GLddsNCn/KM3xRDq
         OKcMX7GTzS+i5zY+t8OWXlnbSQRXMojs8i6ONk09wppmCNX8yIBgvbjiPNhbC9NeFL
         Pvl5yta28F6BQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello list,

I have two lines in the iptables PREROUTING mangle table to split up
traffic from even and odd ip numbers:

-s 10.32.24.0/23 -j CONNMARK --set-mark 0x1001
-s 10.32.24.0/255.255.254.1 -j CONNMARK --set-mark 0x1000

But I noticed that rules in this order does not work (everything
gets 0x1001):

-s 10.32.24.0/255.255.254.1 -j CONNMARK --set-mark 0x1000
-s 10.32.24.0/23 -j CONNMARK --set-mark 0x1001

So I assume the the CONNMARK rules are not end rules (hit = exit)

Is that correct?

R.


-- 
richard lucassen
http://contact.xaq.nl/

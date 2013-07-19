From: Hung NguyenTang <tanghungnguyen.itc@gmail.com>
Subject: Help to implement an firewall as a semi-transparent gateway
Date: Fri, 19 Jul 2013 15:47:53 +0700
Message-ID: <51E8FD39.3090205@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=7Gbd3QC8rOppd5ZM7t/vT2tbYGqi1W1ceBhDjkeVK6s=;
        b=t+YM2D7IiQWL+I44MRBg6hIG4rNd9uAeiXktmNRRuuvso0tzwFQHua6M7jiWLlAGhU
         2M2E/Sk1u6a7jFY/yKeguzhH82x6+4McHuxq3TnrtvSy20fjVezC+20TSqBMD1OVqdQ4
         PsoQaY6mVTeol65kCwu3P5qorv0Rv530NuaOlGzJIh2/uvP7fvOf5YbShm8lqNe+hWsc
         G321KV9Hw7P14//Qn3wWatFqOIZbJLnVrU2SXLkuhZtA6B0TZjzf34D5BGMa9FqhF7jl
         vBuCJKQP5WTCdWnHl+65CUf7+7aQ3QK9UkUlkrQJ7FW2IWuWQe7txECR3K2e+MwqAl35
         VyFQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello.

Currently, I want to implement an firewall as a semi-transparent gateway
like this: when the firewall receive a SYN packet from client, it will
pass to internal hosts. When the host response with SYN+ACK, the
firewall forward it, but also generate and send an ACK packet that seem
to come from client.

I'm wonder are there any ways to implement this using netfilter
framework + iptables or could anyone advising me a right way to do.

Thanks you,
HungNT.

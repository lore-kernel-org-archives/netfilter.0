From: Roc Bai <buroc83@gmail.com>
Subject: Which has fast speed, BSP and iptable?
Date: Sun, 24 Apr 2011 17:14:53 +0800
Message-ID: <BANLkTineF4RPb8-Gd7y39XaN7FPwVTUiOw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=1sQxoTdU4LyLbr/7FMBB1AQx/YU8CBZ4Mb4oKEVQgQ8=;
        b=pll/Kv6zmgoi2SnnTvos+NlssNN/KDhfN6s/35gMmXABeboMkM2e/QfhK1RAIuAQY3
         CeiQhRufBvSnxI/elQtGPEbTeN6276oaMz124+E0uUSkUF8qTFLboKyPp47gajDEDMUq
         VpRyIvMbbgcoexd0INsd6rqrd/qYWgfAvpncE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi, all:
    I want to use one algorithm to check the packet whether meet
rules. As i know iptable can be use to set for gateway and bsp is used
by tcpdump, so both should have filter method. My question is
1) whether they same?
2) if not same, which will be fast?

Best Regards

Bai Shuwei

-- 
------------------------

Thinking before action, but you are wasting time if you don't do action.

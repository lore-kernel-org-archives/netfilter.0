From: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Subject: Packets stops traversing after nat PREROUTING
Date: Wed, 14 Apr 2010 11:30:32 +0300
Message-ID: <s2sc4ada2161004140130ve00e5873qc38aebaa842d3b6e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:received:message-id
         :subject:from:to:content-type;
        bh=89+VPjXLpSEmogSj4Px7nwaqURTvZrQ5j+4qhRHLbC0=;
        b=p/RcbHjnZz6hf7JOaoJ8PU1Sk2RM9r/bj7GV6Eej/Jn7q8YaBfmXrz/1IPJtHrmdVA
         udSxYGrbwRe10K+nGHYBdns9IL1uvK3PJqFwN462Q4L6NZRqo8Jti/HFHQJa1NF5D7+a
         HR/rV1J88HbxOPJ1yIwQWoGuTbHc2Hstizys4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

OS is CentOS 5.4
Kernel is 2.6.18-164

Sometimes my firewall blocks the internet. When I inspect I have seen:
- nat PREROUTING counters increase
- filter FORWARD counters do not increase
- nat POSTROUTING counters do not increase

According to the diagram of Engelhardt,
http://jengelh.medozas.de/images/nf-packet-flow.png, the problem
should be in Bridging Decision point or acc.to former diagrams in
Routing Decision point.

I have tried to flush routing cache by "ip ro fl ca".

Problem is recovered only after /etc/init.d/iptables stop / start

I need further cues for deepen the problem, or exact reasons for
updating/recompling to newer kernel/netfilter.

Best Regards,

Oguz.

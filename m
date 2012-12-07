From: Rishi Kapoor <rkapoor.rishi@gmail.com>
Subject: iptable rule to change incoming interface
Date: Thu, 6 Dec 2012 20:12:12 -0800
Message-ID: <1DAF6950-F0F7-4B32-88F4-FC65798EB4B3@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:content-type:content-transfer-encoding:subject:message-id:date
         :to:mime-version:x-mailer;
        bh=hp1QF/Kh4LWsQeD85Ec7Dp6BvgqpIdHTipfHJ5PoIpU=;
        b=QCYE7WFDhERb+VJgL7EqtA8GtfL4+H1Cebp+tg8qykuPGPgGltoSuZudMwkS7FzJDJ
         NiHzvKl4XKkyf8toOdKdq3NHqokRUaeYMkXpcLlHiDGlK6kB7ToObBRG3nnASHFkifKx
         zkEVJWbuFyShGTSOkXC8mB27v8UlEZ5r8h9yRclvX/fHo8F6FY5fP9bggVyvemIJl7Um
         rOHFtlF2wUNJF8PUoIJgohZyjjdzc7UfQPWqq7FMctnnIDXa7vDB66EBaEMU0Eu/Hnit
         hMillBcGvs4GWr8S6edT07xjqTOsXzPpXqmeIBLeLTK+GhQO1xDFNOM33ihXYX1Y068z
         RkwA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I am looking for a iptables rule which can change packet's incoming interface.  It seems that ROUTE.patch from patch-o-magic seems best fit, example,
"iptables -t mangle -A PREROUTING -i hdlc+ -j ROUTE --iif teql0"

but that patch-o-magic is no longer supported and I couldn't find similar command/module in Xtables add-on which can achieve same effect.  Is there any alternative way to change the incoming interface of a packet using iptables?


Thanks !
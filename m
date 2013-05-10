From: Alex Flex <aflexzor@gmail.com>
Subject: synflood +syncookies + conntrack strange behaviour
Date: Thu, 09 May 2013 19:04:29 -0600
Message-ID: <518C479D.1070904@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=gF9kZSDirjffE/fb5XZM+FnKi6f86UyIabuwlPB59nQ=;
        b=QaFRqVKAjYf+MYMd32Fod1ze15WZ4o1qMtUrASYVc4YyXPazvy1Hua7PUF31fWEmR8
         0ylFQRo3bFJQ1qxJODQshgzGyFV/vTNaZPUECLqbgpeJ0iSuom5FElOv+Bnf1ZjhoEOF
         o3qQuU5ZLxESjpjurHtIsAdvy/uWuvWPvGFtkJzCFAJ5MuKd314n1o8TisqSIx+53Apa
         zff8ympkkfF3DOKafFCwm7y4Oe2QNhRQiP+qzNUt9p7OYb8rtEl5bLwV/opFRfREhAeN
         CjmDdbjddJUGwNVIwE2LtXKWpd3Hn3RzBhJNbiRuVqyNTFEGN3HSDO88WP5EGvgwBc0N
         ctlg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello Netfilter,

Today I wanted to do some LAN tests with two machines, where i would use 
one to syn flood the other.

Iam using a firewall with conntrack enabled. I noticed that while I made 
the attack (50k pps @ 15mbitsfrom random IPs) I immediately  saw the 
conntrack max count reach 65535 which is my max value. Packets 
immediately started being lost almost in full.

Questions:

a.) Shouldnt syn cookies (which is enabled) deal with the syn flood 
without compromising my state table?
b.) Why if my state table is full am I not getting any table full error 
message in dmesg or syslog? I tried setting max conntrack to something 
lower (10,000)and even maxed out it didnt give any warning. In fact i 
had to set it to 100 and only at that time I got the conntrack error 
full message??
c.) I  tried disabling iptables all together (thus no conntrack)and I 
still saw 100% packetloss , iam sure iamnot hitting a  cpu or link limit 
because previously i hit a 100k pps 50mbits, and now iam doing half that 
for testing and still using syncookies. Why would i still be lossing 
packets?

Thanks for the help!

Alex



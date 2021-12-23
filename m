From: Gio <gioflux@gmail.com>
Subject: nftables character limits?
Date: Thu, 23 Dec 2021 03:10:28 -0500
Message-ID: <CADhidkqEE_Pud167s6-AXJ1rBuODQFkbDUUB+nCvDhFs805xkA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=cQ+pOqaRoE394i6f9ktZHKOICxQ2GU7b96+1PH7E8FA=;
        b=hPJVWjpVbpcsU+NLucxTqvLPbHia8OQbdE3C+fyFaQ7iX9CY62UWOjUNXWi8N4RXyT
         muAMwC9yAtxqRrV+LCXrpOGmqwRoHHdXZqohCNCm1Mczglp70D+4c/L/fculnhF35oXl
         T83LJzR68YlYdecreIyj5cQ3pY8c0mSnshDsW/sCjKkurGcEyE9t9Lqjgosy7zw3scZg
         zDU3C+aDWQyFUGN52WjM9cXeUZuKtzIYFfVcMqXNVUbSMynw6RNrc8MeUKsWPIiZNNv3
         ZCWWZEWVrutn/3dZb2xcXOOpV0jWNb7vt7CpYOxk4vjUd/iqrajSQgl9cmtt7GeABdFU
         wjnA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm writing a script that converts firewall policies from one platform
format to .nft format to use inside VMs.

During conversion of data from one format to another I need to
consider maximum character limits in fields like comments, chain
names, etc.

I have not been able to find a central place documenting the maximum
character limits for certain fields, the only reference I found so far
"Set names must be 16 characters or less" from
https://wiki.nftables.org/wiki-nftables/index.php/Sets

Are there any better places or could someone help fill in the blanks
for me, for example are there any limits on how long of a string
`comment` may be?

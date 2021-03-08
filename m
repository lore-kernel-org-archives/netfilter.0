From: Amish <anon.amish@gmail.com>
Subject: when will nftables have ability to delete matching rule like
 iptables?
Date: Mon, 8 Mar 2021 18:44:38 +0530
Message-ID: <d27a2a67-6739-6ade-d822-bbefd9c8bcd4@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=3zJKCgxUuEpyz4dJV9pljM8ti9TRPbnL4D/NgqElAkQ=;
        b=tu26J165A5gG5TV1y7AhDpqGUVRuGBEG9TWn9CiAvWcY+pK7qXtO8twUerpj7TQTVD
         IQWPIp4j0/eYUMjx3ojg5Z2H2tFC1N6Xm+gjLB7S9t/hiwl05n44lA4QS9F77xZdJocz
         xmW+Ob6JaWSHJIVKeSI4GGZz9b2zO1CfZdGy6rwMS64AHJ8i/9f2ukReEwPI2CWhCsVe
         miyZDyn0JQ9HhT+pRpZUdJtx2b243KbJvNUoBdFgkWK0gChb8hqGZQKJMHQ9RmdT4K/H
         olb9kLnoUnIXafAtpDYh4hH+J8wmsr0Y2+KeEF/SmPimTf8DMGFJ5Lniy8DJO9zQqcxf
         VV/A==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I have few programs that currently use iptables to add / delete firewall 
rules.

I have been waiting to migrate to nftables from 3-4 years. (I do not 
want to use nft based iptables)

But roadblock for me is inability of nftables to delete a matching rule. 
(similart to iptables -D INPUT -s 192.168.1.10 -j ACCEPT)

Obtaining the handle first and then deleting is difficult programmatically.

Have I missed any easy way out here?

Why is it difficult for nftables to find and delete matching rule?

Is there any ETA for this?

Curious to know,

Thank you,

Amish.


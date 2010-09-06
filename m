From: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Subject: tc add filter match src ip and mark
Date: Mon, 6 Sep 2010 14:33:35 +0000
Message-ID: <AANLkTikY4XubbQ+TvasEDkTuheG6-GiETg5q6HKV6k9e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=ZZylSn3UQDzF7MwG7mbKMr1d/8BUuF7vp7zN6M+WZI4=;
        b=XWnARDdyR1bv1oFWIJOgcBxOPtN271Z6thxVLEO5AvFW6Zoe1RhazYjFUq6facDUSE
         60CAocngxSTV+pthYLBZUjyx4/W8c941VLMl8gCZ145QC9VK19kQda51MasGQZO8X4qE
         M1LaZkJlPKE0w36+3JTY6AttuVHriqAAibInY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

hi all,
to shappe my P2P traffic per user i've mark P2P in my iptable mangle
posrouting as :

iptables  -t mangle  -A POSTROUTING     -m layer7 --l7proto  edonkey
-j MARK --set-mark 47
iptables  -t mangle  -A POSTROUTING     -m layer7 --l7proto  fasttrack
 -j MARK --set-mark 48
iptables  -t mangle  -A POSTROUTING     -m layer7 --l7proto  freenet
-j MARK --set-mark 49

I have 2 users 10.10.2.3/32 and 10.10.2.5/32

how should define filter to classify traffic according to src ip and mark.

i've tried
 tc filter  add  dev  eth0  parent  1:  protocol ip  u32 match ip src
10.10.2.3/32   flowid  1:12

But in this definition there is no match for the mark.

regards.

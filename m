From: Michael Rigoni <michael.rigoni@gmail.com>
Subject: nftables: udp port matching on bridge
Date: Sun, 03 Aug 2014 23:04:36 +0200
Message-ID: <53DEA3E4.9020008@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=WAw9UQtGWzsGjqsQ2EBBMJVCHwyr19/9oKJm7NbYbBY=;
        b=Lyl69XeNvbc95Kkv8Zts205Ywhu5pKYHtcVNve83iduGgOdEAjS/UH5Ze9+89yjDfY
         7LQNR/W78sBXoZuiHs4HX59EVDcRo/Xu7xtJ/+pKXp5T5KIulX1LBJLtgFrjHd32pVcx
         qGj8wbhdZOo0rdVFMuDpX0aXAdQjnZtAyDMInDjYJI0rFR2avLjR8AKScwOTKai3CdtS
         e7x1+Ro7SiAZYxqQNC1cGCeqiTlwYFVCn/yRUtk8miq0YacrGBhBEX0lw0R4YibaPqg+
         NBzPt/aZJv462Z3XCXDELd0Tl6PIfPes/BHPBuULfYDHJhDfyEr1HT+7A5J9o+WcQAc5
         XUkg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,

I was trying out nftables and as a test I wanted to log dhcp packets 
from a given bridge port but I could not make it work (kernel 3.15.8 and 
nft  v0.3).
# nft list table bridge test
table bridge test {
     chain forward {
          type filter hook forward priority -200;
          iif eth1.5 ip protocol udp udp dport bootps log group 2
     }
}

Nothing shows up in the logs, however when logging udp packets (iif 
eth1.5 ip protocol udp log group2), I do see the DHCP packets in the 
logs. Any clues on what I am doing wrong ?

Also, is there an equivalent of iptables'--physdev-in  for ip/ip6/inet 
tables ?

Michael

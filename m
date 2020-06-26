From: jamez <djamez@gmail.com>
Subject: iptables hashlimit scrip and srcport
Date: Fri, 26 Jun 2020 12:05:42 -0300
Message-ID: <CACGucCtrJ0z04N0ShMMpS528SEtGp8+URheBcq8V7iB3=aPFpQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=f4m0l1gkBGF91TMtRarKH3Z761uBSdDPVvBFkkUXSyk=;
        b=EfoZIyC2t9uVLChuT1wfvROfBe33JQXJwOQ0vEf6VKuGbeKjJog7PcPYknbOyxttNW
         lgonn7G/M+h8mQf93504tQZd+CbMPm8N+l5icT4o07voOa/9QDynjCWGVQ7+82qY1nhU
         V4rcenMjjDEmY2rqfZyNZbXsJw9Q3UnGEjI/NQru8ecDLSO2gb/MwUs3KQ2E5AGcrKBZ
         9ql4gzsFjy7EmJdwA/RgSgxyl3B4I1nL3/5lUUwnTjNSyVHzqwr2VlKJa915VyEhrL4j
         qMMByewrXjx2rIKQkBLvmvcVgLoHx2H5k1ayBBTq3RjuTkHdUa4T0oHO7v6gU59qfCkV
         50SQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I've following working rules, it blocks all IPs sending more than
1000kb/s and keeps it to the blocked list for 60s.

-A msg_rate -m recent --rcheck --seconds 60 --name msg_rate_blocked
--mask 255.255.255.255 --rsource -j DROP
-A msg_rate -m hashlimit --hashlimit-upto 1000kb/s --hashlimit-mode
srcip --hashlimit-name msg_rate_1 --hashlimit-htable-expire 5000 -j
RETURN
-A msg_rate -m recent --set --name msg_rate_blocked --mask
255.255.255.255 --rsource
-A msg_rate -j DROP

Now I want to block the combination of IP:Port, so I added
srcip,srcport to the hashlimit but it doesn't work. It keeps blocking
all IPs instead of IP:Port. So what I'm doing wrong ?

-A msg_rate -m hashlimit --hashlimit-upto 1000kb/s --hashlimit-mode
srcip,srcport --hashlimit-name msg_rate_1 --hashlimit-htable-expire
5000 -j RETURN

iptables v1.6.2

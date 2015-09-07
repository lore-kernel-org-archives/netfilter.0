From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: ulog dropping packets when rate is 4000 packets/sec or more
Date: Mon, 7 Sep 2015 17:45:24 +0530
Message-ID: <CAA5aLPhF4QYbneoceDP+h-5sNretjodn2oHbNTzqa5PzN8nW_A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=PtWnrZezrHGehaCHXMAJ6lzu/r0W4Fd4sHCL7p5+68s=;
        b=VUciwAqx3bc731awuyOVH95JHuPi1qNlLzTvh7bCrTTedXmuNMD/CGqPGcSAduNxky
         CTXPFukYcbfo8w6FJ/NaNXhMimIY9Y7pfrTl8Wdio8IK0oip1tGug9JpFTVoQj8Hogiz
         JdICGcrF4j+oKV2aaAM8KRXOkXpXD7FSjt12nml6Rm/X0iUAsX1fU5TodtCrHgEuqjw0
         r1D8cKAFZNAcdwiDmy40THqO1Ao/xY05+c85U4bx6+zzsFcujL+HZS3uuuPTsuywlA8V
         BfpUxf0cn2XZt+1KaAnKRRvtR8us0R+lNS29HYSnKnjhUgbpGhkU+tUEPnYc5yvvAxYn
         zNFA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi!

I am using JSON plugin of ULOG to log iptables traffic. When the input
rate  is arond 4000 packets/sec, ulog is not logging all the packets.
At 4000 pkts/sec, it drops around 0.1 % of pkts.
At 5000 pkts/sec, it drops around 2.4% of pkts.
At 6000 pkts/sec, it drops around 3.67% of pkts.
At 15000 pkts/sec, it drops around 16.7% of pkts.

Is this expected? or am I missing something.

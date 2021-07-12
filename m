From: rakesh goyal <goyal.rakesh@gmail.com>
Subject: Netfilter rules to replicate, consume ingress packet locally and
 forward clone packet
Date: Mon, 12 Jul 2021 20:49:41 +0530
Message-ID: <CANaqFbrZgViUKTvgEFje3yf0ozsstcst8_gjX84aw03WXOw_tQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=P/SG1Jtqx9NLWmMGQ8rHCeP+E6DhmTO9zl7VQJM6aq0=;
        b=p/bTwFyLoPoCTC3bBg6qWtV+HSSQesimxULYRSVZs2QpHQ93EyAwPnLeK3EM5Guwoy
         BZg06ktjUk7zeZOg9+IpaPATS1PNKBMjN4fjANAca4cogOdbb/ACAReN1UUjJUNmQiGD
         TsQiVX5ITXxchsPFwm8TwFcJcEJHhNvvhQL4+3FY1uXRa90lbDn4w+5G0ZX9bctbazDU
         Mu0jT9Ldw14BORMQLQ14v2+JBRWOJi7d54+Uco1DCtZgcvoh5NJKxvShLIrxRMSqLF1O
         d/xbJB1DueuPqdsfhPcrykWPD90MblFuCl/BrKQXFDjHNd6tMvVWBCX4OCgm+iSvI5IW
         1LUw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
I am looking for netfilter rules to accomplish the following requirements.
1. every UDP packet received on the interface i.e. eht0 should be
consumed locally.
 2. replicate same packet and Forward to other interface i.e. enp7s0

experiment done.
1 .Host PC IP 192.168.1.3 which is connected to DUT eth0.
2. DUT  eth0 - 192.168.1.4
         enp7s0  10.40.197.108
3. Another Host which is in 10.40... network having IP 10.40.198.9
connected to     enp7s0 of DUT.

Rules :
sudo iptables -t mangle -A PREROUTING -d 192.168.1.4  -j TEE --gateway
10.40.198.9
sudo iptables -t nat -A OUTPUT -s 192.168.1.3 -j DNAT --to-destination
10.40.198.9
sudo iptables -t mangle -A INPUT -s 192.168.1.3  -j ACCEPT

Issue Seen with this rule:
1. packets from #1 Host PC get cloned until TTL becomes 1/0. So there
are multiple replications.

please help here to understand the correct rules for the requirement.

Regards,
Rakesh

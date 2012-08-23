From: Wei Huang <daviseago@gmail.com>
Subject: Which one is chosen on multiple default gateway set?
Date: Thu, 23 Aug 2012 14:31:26 +0800
Message-ID: <CAJPS4yY7sqqsOfhiouqjmfuW3Kof-ZzHEBs9E1+QoYYce01U4Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=tQmf5IMl9W7EpIaaRrjAb3FVfrW8Tl2WSUh4Ol9FlDA=;
        b=yCKqK/tdsSCozsHxUwHXG5xgm6EGGRzdYTSVk44hkRFGAPrmr6M32vCE+FQWcPeQRP
         uNlFkibtymlrakONfohHi2Pc22dhfom3yl8vV1QD28yzoXmNVFy2ozgvXlRo2Ah6DqeX
         DqheJwFlhfw5grGJFDYfE1dgA02NXnZw6tmI8MVrS9894ssjyLuRBYWGbBbaVvgdNEHz
         iUM5G07iupYJhuTjVPdE+HZIQyudgUeKSE/0scQy1VZU63qW7sHLWsIqfqMESqGl4FJM
         liqfxMuKGr2hP567aMjPotrOK7+AF6RJJoI0HCzM9RIzi58jn0EY72ILpV+0vSR4wfWk
         5UVw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, netfilter@vger.kernel.org

Hi,

If multiple default gateways are set, which one will be chosen? And if
the chosen one is down, will others take over?

It works sometime, but not most of the time. (example below) The
behavior is inconsistent.

How the case is handled? On what condition another default gateway is
chosen?  Thank you!

=======================
~ # ip r
10.65.30.0/24 dev bond0  src 10.65.30.71
default via 10.65.30.221 dev bond0   (this one is down!)
default via 10.65.30.1 dev bond0
~ # ip r get 8.8.8.8
8.8.8.8 via 10.65.30.221 dev bond0  src 10.65.30.71
~ # ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8): 56 data bytes

--- 8.8.8.8 ping statistics ---
3 packets transmitted, 0 packets received, 100% packet loss

// after a while

~ # ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8): 56 data bytes
64 bytes from 8.8.8.8: icmp_seq=0 ttl=56 time=5.0 ms
~ # ip r get 8.8.8.8
8.8.8.8 via 10.65.30.1 dev bond0  src 10.65.30.71

// after two while


~ # ip r get 8.8.8.8
8.8.8.8 via 10.65.30.221 dev bond0  src 10.65.30.71
~ # ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8): 56 data bytes

--- 8.8.8.8 ping statistics ---
2 packets transmitted, 0 packets received, 100% packet loss
==================================

Best regards,
Wei

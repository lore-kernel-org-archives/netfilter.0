From: Pieter Ennes <pieter@ennes.nl>
Subject: Classifying ingress traffic via cgroup filters
Date: Tue, 07 May 2013 10:40:19 +0100
Message-ID: <5188CC03.3050402@ennes.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I'm researching (=breaking my head to find) ways to classify ingress 
traffic to a cgroup. Is this possible?

Details:

With something like the following I can easily filter egress:

   $ echo 0x00010010 >net_cls.classid		
   $ tc filter add dev $iface protocol ip parent 1:0 prio 1 handle 1 cgroup

But I'm very much in the dark about my options to correctly 
filter/classify ingress with a clever combination of connmarks, fwmarks, 
cgroups and/or ifb interfaces (imq is not an option in this case).

Though it seems that some of this field is still very much in flux, I'm 
trying to come up with a solution that will work on Debian Wheezy's 3.2 
kernel.

Any help or pointers in the right direction are much appreciated.

Best,
-- 
  - Pieter

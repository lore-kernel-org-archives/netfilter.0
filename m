From: "Pedram Fard" <pjfard@gmail.com>
Subject: iptables: Too many levels of symbolic links
Date: Fri, 18 Apr 2008 16:05:50 -0400
Message-ID: <925702580804181305j1e61782dp6a8f71b96c2e7774@mail.gmail.com>
References: <925702580804181302j57d22b0av413e8e25ab619c7b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=jd5Stm868f/p6PSG7mrS28Fp86Yllvb1kiKevf/TC0I=;
        b=oqRsVl0Li6GrflRaZs6MZXHlXnUuJUYeA8YHwYfmEnkUWiKAwNItxv7rbkdf01Rj2F5aDd0R0FyiHI1yTDpkdhYsPaVJebM40RoBUxFjaM9U9V8FycqpK0YLWoYr1IafR1kvYbHVz+F/DQ1WXX2wDYhwa5DrUOOUbsydSCy6GYE=
In-Reply-To: <925702580804181302j57d22b0av413e8e25ab619c7b@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

We are porting some old code that was running on the 2.6.15 kernel
with iptables 1.3.4. This code needs some iptables rules to be in
place. I have installed iptables 1.4.0 on Ubuntu 7.10 (kernel 2.6.22)
now.
When I define the rules set as follows:

iptables -t mangle -N CLASS_1
iptables -t mangle -N REV_CLASS_1
iptables -t mangle -N NON_TCP_CHAIN
iptables -t mangle -N DOWNLINK_SYN_CHAIN
iptables -t mangle -N TCP_SYN_CHAIN
iptables -t mangle -N TCP_DOWNLINK_CHAIN
iptables -t mangle -A CLASS_1 -j MARK --set-mark 0x1
iptables -t mangle -A CLASS_1 -j QUEUE
iptables -t mangle -A REV_CLASS_1 -j MARK --set-mark 0x80000001
iptables -t mangle -A REV_CLASS_1 -j QUEUE
iptables -t mangle -A NON_TCP_CHAIN             -m mark --mark
0x80000000 -j REV_CLASS_1
iptables -t mangle -A NON_TCP_CHAIN -p udp -j QUEUE
iptables -t mangle -A NON_TCP_CHAIN             -j CLASS_1
iptables -t mangle -A TCP_SYN_CHAIN -m mark --mark 0x80000000 -j
DOWNLINK_SYN_CHAIN
iptables -t mangle -A DOWNLINK_SYN_CHAIN             -j REV_CLASS_1
iptables -t mangle -A TCP_SYN_CHAIN             -j CLASS_1
iptables -t mangle -A TCP_DOWNLINK_CHAIN             -j REV_CLASS_1
iptables -t mangle -A TCP_DOWNLINK_CHAIN -j QUEUE
iptables -t mangle -A FORWARD -p ! tcp -j NON_TCP_CHAIN
--------------------------------------------------------------------------------------------------------------
iptables -t mangle -A FORWARD -p tcp  --tcp-flags SYN,RST,ACK SYN -j
TCP_SYN_CHAIN
 -------------------------------------------------------------------------------------------------------------
iptables -t mangle -A FORWARD -m mark --mark 0x80000000 -j TCP_DOWNLINK_CHAIN
iptables -t mangle -A FORWARD -j CLASS_1

When I get to the line that is separated above, I get the following error:
iptables: Too many levels of symbolic links

Any ideas on how to fix this problem?

Thanks,
Pedram

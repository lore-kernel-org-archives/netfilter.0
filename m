From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: help on tc with kernels >= 2.6.27
Date: Fri, 2 Jan 2009 21:53:48 +0100
Message-ID: <20090102215348.7d67b8c4@catlap>
References: <37b3b63f0901021046n40962c84mef64cab10153261e@mail.gmail.com>
	<20090102204908.7ec18094@catlap>
	<00c301c96d17$750ea820$5f2bf860$@jorge@decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <00c301c96d17$750ea820$5f2bf860$@jorge@decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jorge Bastos <mysql.jorge@decimal.pt>
Cc: netfilter@vger.kernel.org

>My QoS rules (always were the same)
>---
>/sbin/tc qdisc del dev eth0 root
>/sbin/tc qdisc add dev eth0 root handle 1 cbq bandwidth 100Mbit avpkt
>1000 cell 8
>/sbin/tc class change dev eth0 root cbq weight 10Mbit allot 1514

Sorry, but I'm not familiar with cbq. Try the script below:

-----------------------------CUT-----------------------------
TC="/sbin/tc"
DEV="eth0"
$TC qdisc del dev $DEV root
$TC qdisc add dev $DEV root handle 1: htb default 10
$TC class add dev $DEV parent 1: classid 1:1 htb rate 100Mbit
$TC class add dev $DEV parent 1:1 classid 1:10 htb rate 90Mbit ceil \
100Mbit
$TC class add dev $DEV parent 1: classid 1:1280 htb rate \
200kbit ceil 200kbit 
$TC qdisc add dev $DEV parent 1:1280 handle 1280: sfq perturb 1
$TC filter add dev $DEV parent 1:0 protocol ip prio 100 u32 match ip \
src 195.23.14.71 match ip sport 110 0xffff classid 1:1280
-----------------------------CUT-----------------------------

I hope it does the same your cbq.init did - shapes traffic to
195.23.14.71 to maximal throuput of 200kbit/s and lets the rest of the
traffic to go fullspeed.

Regards,
Marek Kierdelewicz

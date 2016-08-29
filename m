From: Llorente Santos Jesus <jesus.llorente.santos@aalto.fi>
Subject: RE: smcroute and snat rules - snat not working if multicast traffic
 is received while rules are being added otherwise it works
Date: Mon, 29 Aug 2016 20:20:40 +0000
Message-ID: <A404B5896AB4F5468A8755AFC23F7317E4334916@EXMDB04.org.aalto.fi>
References: <FEE7A75AD8EEEF44A9D44E051B8E9A9B2F96E666@PRS49.progressrail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <FEE7A75AD8EEEF44A9D44E051B8E9A9B2F96E666@PRS49.progressrail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Mark Fanara <mfanara@PROGRESSRAIL.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi Mark,

Maybe you could try flushing the conntrack information, "conntrack -F" after applying the new rules.
If the system has generated connection state already, it could be using that to forward your traffic. In any case, you could also monitor the rule counters and see what rules are being applied, (iptables -L -nv).

Let me know if this helps :)

Best,
Jesus

-----Original Message-----
From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel.org] On Behalf Of Mark Fanara
Sent: 29 August 2016 23:07
To: netfilter@vger.kernel.org
Subject: RE: smcroute and snat rules - snat not working if multicast traffic is received while rules are being added otherwise it works

I am using smcroute to route multicast traffic from one LAN to another. Along with this I am using iptables to mangle the TTL value and also to NAT the source address onto the target LAN.

I have a script that runs on startup of my device. The script starts the smcroute daemon, adds the smcroute rule, adds the iptables mangle rule and the NAT rule.

If the script runs on startup and no multicast traffic (destined to the address of interest) is being received while the script runs, the traffic is properly routed, mangled and NATed. However, if, while the script is running, multicast traffic destined to the address of interest is being received, the traffic is properly routed and mangled, but is not NATed. 

I have compared the rules as displayed by iptables in both cases and don't see any difference. I have also tried searching the user list archive as well as general Internet search on this topic, but have not found any useful discussion.

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in the body of a message to majordomo@vger.kernel.org More majordomo info at  http://vger.kernel.org/majordomo-info.html

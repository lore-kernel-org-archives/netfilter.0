From: Lorenzo Allegrucci <lorenzo.allegrucci@forinicom.it>
Subject: RTP traffic and nf_conntrack_sip
Date: Thu, 10 Dec 2009 09:28:34 +0100
Message-ID: <4B20B132.3090607@forinicom.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


Hi, searching ML archives I found that "RTP can be matched on using
"-m helper --helper sip", so I tried the following simple rule on my router:

iptables -t mangle -A FORWARD -m helper --helper sip -j CLASSIFY --set-class 1:1

but it doesn't match any RTP traffic (no packet classified).
I tried different nf_conntrack_sip module parameters but it didn't help.

Moreover, the nf_conntrack_sip (the module that should match SIP & RTP protocols)
is not loaded by iptables.. so now I wonder how does nf_conntrack_sip work.
Any idea? Am I missing something?
Thanks,

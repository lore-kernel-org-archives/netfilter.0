From: bahamin takhtaei <b_takhtaei@yahoo.com>
Subject: specified protocl number problem
Date: Mon, 17 Nov 2008 23:31:55 -0800 (PST)
Message-ID: <59826.13109.qm@web55306.mail.re4.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi everybody,

Why I can't QUEUE some ip-protocol packets such as IGMP, AH, ESP 
and so on?
I add these rules to Iptables:

iptables -A INPUT -j QUEUE
iptables -A OUTPUT -j QUEUE

and I see that TCP, UDP and ICMP packets are queued only and 
other protocol packets are not! But I see them by tcpdump. :(



      

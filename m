From: Fabio Marcone <fabio.marcone@duet.it>
Subject: tc and priority
Date: Wed, 20 May 2009 18:29:43 +0200
Message-ID: <4A142FF7.1050700@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,
I'm studying traffic shaping and I need some informations.
I studied HTB and I had no problem to limit bandwidth (with and without 
borrowing). Then I would undestand how assign different priorities to 
packets: I test qdisc PRIO and prio paramenter in CBQ (and HTB) but 
without success.

with CBQ, I create 2 two classes with different priority and I filter 
traffic to send different traffic (source port) to a particular queue. 
Then I run 2 connections having different priority and I see that a 
connection stalls and the other uses all bandwidth then it succeeds the 
opposite.

The same behaviour I see using PRIO qdisc.

Instead, I would get that che higher priority connection uses all 
bandwidth until its queue is full (so che lower priority  connection 
waits until the other finish).
What's wrong? Suggestions?

Thanks,
Fabio

From: Roger Sala <rsala@ssci.com>
Subject: Packets occasionally not queued
Date: Tue, 14 Sep 2010 12:53:31 -0400
Message-ID: <4C8FA88B.5090405@ssci.com>
Reply-To: Roger Sala <rsala@ssci.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have some basic netfilter queue code that diverts packets with the 
following two rules:

iptables -A OUTPUT -m tos --tos 0xe0/0xe0 -j QUEUE
iptables -A FORWARD -m tos --tos 0xe0/0xe0 -j QUEUE

It works as expected almost all the time, but occasionally I see cases 
where Wireshark indicates that the packet was received at the nic, but 
my code doesn't log the recv() of it.

I had assumed that my receive buffer was sometimes being overrun, but 
now that I'm throttling back the traffic, I see cases where isolated 
packets just don't get queued, so I assume its a case off competing for 
resources with other processes on the machine.

Is there anything I can do, such as increasing the priority of my 
program, to enhance the likelyhood of receiving all the packets I am 
filtering on?

Thanks



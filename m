From: Morgon.J.Kanter@Dartmouth.edu
Subject: Bypassing netfilter, or injecting marked packets out a raw socket?
Date: Thu,  8 Jul 2010 11:39:47 -0400
Message-ID: <20100708113947.hnbubk0ziocoowgo@webmail.dartmouth.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org

Hi there,

I'm having an issue where I want to capture all traffic going both to and
from a certain IP/port. This is easy enough to accomplish with netfilter
QUEUE. The nafter capturing the traffic, I modify it a bit and send it back
out.

Normally this would just be a verdict of NF_ACCEPT, but I have the problem of
sometimes this traffic generates additional packets that I have to send out to
the same target, from the same source. Normally I'd inject them out a raw
socket, but in this case they just get snarfed back up by the NFQUEUE target.

Example ruleset:
iptables -A INPUT -p tcp --sport 25 -j NFQUEUE
iptables -A OUTPUT -p tcp --dport 25 -j NFQUEUE

Unfortunately I need the latter, which means the raw socket output gets queued
as well. Is there a way to either:
1) Bypass Netfilter entirely.
2) Mark the packets that get sent out the raw socket, so that iptables will
compare the mark and ignore the marked ones?

Any help would be much appreciated.

Thanks,
-- Morgon

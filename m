From: Ottavio Campana <ottavio@campana.vi.it>
Subject: natting an ipv6 address into an ipv4 one?
Date: Tue, 08 Feb 2011 10:23:21 +0100
Message-ID: <4D510B89.5050706@campana.vi.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi,

I have a question about ipv6 and nat.

Suppose you have a box with 2 NICs, one running ipv6 attached to the 
main network and one running ipv4 directly attached to an old device 
that does not support ipv6. Thus, the box with two NICs has to play the 
role of protocol translation, by taking IPV6 packets and send them with 
IPV4 to the old device

Is it possible to directly DNAT packets or do I have to do something 
different?

Thank you,

Ottavio

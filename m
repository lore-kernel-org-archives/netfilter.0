From: Stephen Satchell <list@satchell.net>
Subject: saddr, daddr type determination
Date: Wed, 20 May 2020 10:55:51 -0700
Message-ID: <bb6a0ba8-bc8f-3e03-3ec8-d2bae008439b@satchell.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

OK, I'm trying to determine if the source address, using the FIB 
(routing table), is a broadcast or multicast address.  I'm making the 
rash assumption that the daddr type is accessed by using the meta 
pkttype in the output and forward chains:

> define wan0 = enp1s0
> iifname $wan protocol {tcp,udp} pkttype {broadcast, multicast} counter drop

Is there any way to do with for the source address using the FIB?

I need this to conform to BCP38 in my Linux router.

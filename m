From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Bridges
Date: Thu, 19 Aug 2010 00:26:29 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net> <4C6C5B87.9070906@abpni.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6C5B87.9070906@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: Grant Taylor <gtaylor@riverviewtech.net>, netfilter@vger.kernel.org


On Thursday 2010-08-19 00:15, Jonathan Tripathy wrote:
>
>>> Incidentally, would using ebtables rules prevent the bridge from going into
>>> "dumb hub" mode? Like let's say I said that "all traffic leaving this
>>> interface must have this destination MAC address".
>>
>> No, EBTables will not prevent a bridge from having to go through the learning
>> process.  EBTables might filter out the frame so that it doesn't (fully)
>> traverse the bridge, but it will not educate the MAC table.
>>
>> Remember that the bridge will behave just like any switch would that multiple
>> servers are plugged in to.
>>
> Sorry, I used a bad choice of words - Would ebtables stop the frame reaching
> the remote host (VM in my case) is what I meant to say :)

No. The two bridges are not connected to another in the first place,
so the only way for a packet to come in on br0 and go out on br1 is
routing, for which iptables is needed to filter.

From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: Bridges
Date: Wed, 18 Aug 2010 23:15:35 +0100
Message-ID: <4C6C5B87.9070906@abpni.co.uk>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6C59E2.4080307@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Grant Taylor <gtaylor@riverviewtech.net>, netfilter@vger.kernel.org


>> Incidentally, would using ebtables rules prevent the bridge from 
>> going into "dumb hub" mode? Like let's say I said that "all traffic 
>> leaving this interface must have this destination MAC address".
>
> No, EBTables will not prevent a bridge from having to go through the 
> learning process.  EBTables might filter out the frame so that it 
> doesn't (fully) traverse the bridge, but it will not educate the MAC 
> table.
>
> Remember that the bridge will behave just like any switch would that 
> multiple servers are plugged in to.
>
Sorry, I used a bad choice of words - Would ebtables stop the frame 
reaching the remote host (VM in my case) is what I meant to say :)

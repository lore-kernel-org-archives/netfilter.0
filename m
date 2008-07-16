From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: MARK and CONNMARK
Date: Wed, 16 Jul 2008 10:09:47 -0500
Message-ID: <487E0F3B.3070904@riverviewtech.net>
References: <200807161046.39247.vladislav.kurz@webstep.net> <alpine.LNX.1.10.0807161156560.26724@fbirervta.pbzchgretzou.qr> <200807161233.51463.vladislav.kurz@webstep.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200807161233.51463.vladislav.kurz@webstep.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/16/08 05:33, Vladislav Kurz wrote:
> Ok, I can read this, but i just wonder what is the difference and how 
> can I use connmark. Just marking connections for fun? What other use 
> they are for?

The first thing that you need to realize about MARK is that it is only 
good while the packets are in the kernel.  This means that the mark is 
only retained from the point the packet comes in an interface and goes 
out an interface or goes out to a local process.  Said another way is 
when a packet comes in, gets marked and goes out and the reply comes 
back in the mark is no longer there (because from the firewalls point of 
view the reply is a completely different packet).

This is where CONNMARK comes in to play.  CONNMARK is actually not used 
to filter so much as it is used to remember a given packets mark across 
different packets.  To re-use the above analogy you would check to see 
if there is a CONNMARK associated with a packet and if there is use it 
to set the MARK.  If the MARK has not been set (no stored CONNMARK) you 
would set it your self.  Before the packet leaves the system you would 
store the MARK to the CONNMARK for later use.

Think of MARK as simple stateless filtering and CONNMARK as the state 
that is stored across packets.

Does that help?



Grant. . . .

From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Weird NAT problem
Date: Sat, 01 Nov 2008 18:14:21 -0500
Message-ID: <490CE2CD.9090505@riverviewtech.net>
References: <200811012307.18305.bero@linux.cd> <490CDCC2.3070202@riverviewtech.net> <200811012359.02766.bero@linux.cd>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200811012359.02766.bero@linux.cd>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/1/2008 5:59 PM, Bernhard Rosenkraenzer wrote:
> It's almost any connection -- and the few connections that do work 
> don't seem to be related to the destination. It seems more related to 
> transfer size:

*nod*

> $ scp bero@linux.cd:linux*tar.bz2 .
> Password:
> linux-2.6.27.2.tar.bz2		0%	0	0.0 KB/s	- stalled -

I bet that if you sniff traffic on each end of the connection you will 
find that each end is sending packets and waiting for the other end to 
reply.  I'll even go so far as to say that the "linux.cd" system (above) 
is even sending the reply packets in response to the last packet that it 
received from your client and that your client is *not* receiving said 
reply packet.

> So, authentication works, and it definitely gets something back or it 
> wouldn't know the filename -- but it stops and just sits there as 
> soon as bigger amounts of data get transferred.

Ayup.  This is sounding more and more like a path MTU / (TCP)MSS issue 
to me.

Like I said before (I don't know if you read the second half of my 
post.) try using the TCPMSS match extension / target and clamping the 
TCPMSS value.

> It can't be a performance problem on the router - this is a quadcore 
> box that is (currently) almost idle, and has virtually no traffic on 
> either ethernet card.

I /seriously/ /doubt/ that the box is over loaded.  Keep in mind that 
SMP has some of its own issues with IPTables.  Though I don't think that 
is your problem here.



Grant. . . .

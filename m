From: Bernhard Rosenkraenzer <bero@linux.cd>
Subject: Re: Weird NAT problem
Date: Sat, 1 Nov 2008 23:59:02 +0100
Message-ID: <200811012359.02766.bero@linux.cd>
References: <200811012307.18305.bero@linux.cd> <490CDCC2.3070202@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490CDCC2.3070202@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Saturday 01 November 2008 23:48:34 Grant Taylor wrote:
> > I've done the same thing the same way before without running into
> > trouble - but this time, clients have no problem keeping an existing
> > transfer going, but initiating connections seems to be troublesome.
>
> Ok...
>
> Is it any connection or just some specific destinations?

It's almost any connection -- and the few connections that do work don't seem 
to be related to the destination. It seems more related to transfer size:

$ scp bero@linux.cd:linux*tar.bz2 .
Password:
linux-2.6.27.2.tar.bz2		0%	0	0.0 KB/s	- stalled -

So, authentication works, and it definitely gets something back or it wouldn't 
know the filename -- but it stops and just sits there as soon as bigger 
amounts of data get transferred.

It can't be a performance problem on the router - this is a quadcore box that 
is (currently) almost idle, and has virtually no traffic on either ethernet 
card.

Regards
Bernhard

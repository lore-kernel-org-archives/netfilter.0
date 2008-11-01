From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Weird NAT problem
Date: Sat, 01 Nov 2008 17:48:34 -0500
Message-ID: <490CDCC2.3070202@riverviewtech.net>
References: <200811012307.18305.bero@linux.cd>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200811012307.18305.bero@linux.cd>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/1/2008 5:07 PM, Bernhard Rosenkraenzer wrote:
> I've set up a basic masquerading NAT box to share a PPPoE connection 
> between various boxes.

*nod*

> I've done the same thing the same way before without running into 
> trouble - but this time, clients have no problem keeping an existing 
> transfer going, but initiating connections seems to be troublesome.

Ok...

Is it any connection or just some specific destinations?

> There is no problem with the line itself, because I can use 
> everything on the router just fine, and I can even scp huge files 
> from the outside to the public IP of 192.168.2.2 without running into 
> the slightest problems.

Ok...

> Any idea what's going wrong there? Is there anything I'm overlooking 
> with my routing setup, or do I need to look for the problem on the 
> OSX side?

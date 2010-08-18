From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Bridges
Date: Wed, 18 Aug 2010 17:08:34 -0500
Message-ID: <4C6C59E2.4080307@riverviewtech.net>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6C5739.5040106@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/18/10 16:57, Jonathan Tripathy wrote:
> Thanks Grant. Just to put it into a little context, it's a Xen host. One 
> bridge for the "public" VMs for some customers. The other bridge is more 
> my private stuff (including the Dom0 xen host itself).

You are welcome.

I wondered if something like that might be going on.

> Incidentally, would using ebtables rules prevent the bridge from going 
> into "dumb hub" mode? Like let's say I said that "all traffic leaving 
> this interface must have this destination MAC address".

No, EBTables will not prevent a bridge from having to go through the 
learning process.  EBTables might filter out the frame so that it 
doesn't (fully) traverse the bridge, but it will not educate the MAC table.

Remember that the bridge will behave just like any switch would that 
multiple servers are plugged in to.

> Cheers

Likewise.



Grant. . . .

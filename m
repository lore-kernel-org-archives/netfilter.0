From: Roger Sala <rsala@ssci.com>
Subject: Re: nfnetlink_queue interfering with ioctl calls
Date: Fri, 13 Aug 2010 12:40:47 -0400
Message-ID: <4C65758F.9090604@ssci.com>
References: <4C65526A.1030805@ssci.com>
Reply-To: Roger Sala <rsala@ssci.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C65526A.1030805@ssci.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Roger Sala <rsala@ssci.com>
Cc: netfilter@vger.kernel.org

On 08/13/2010 10:10 AM, Roger Sala wrote:
> Hi
>
> I have code that makes the SIOCGARP ioctl call that works correctly 
> (i.e. it either returns successfully when it finds a match in the arp 
> cache or it returns -1).  However when I integrate that same code with 
> nfnetlink_queue code it no longer works as expected (i.e. it returns 
> successfully (0) whether or not the address was found in the arp cache 
> and it doesn't copy the mac address into the struct arpreq).  I 
> searched the archives and didn't see anything about this.  Does anyone 
> have any idea what could be causing this?
>
>
Correction: the code actually does behave as expected if the address 
actually is in the arp cache.  It is only when it is not there that it's 
return value indicates success and nothing is copied into the struct 
arpreq.  The same code, on the same machine, running at the same time 
works as expected when not linked in with the nfnetlink_queue code.

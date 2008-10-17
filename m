From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Some weird issue with return traffic with redirect rule
Date: Fri, 17 Oct 2008 12:19:26 -0500
Message-ID: <48F8C91E.5010608@riverviewtech.net>
References: <cc64e8ce0810162330i44d61166xc16eafc0cfbf3834@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cc64e8ce0810162330i44d61166xc16eafc0cfbf3834@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/17/08 01:30, Pranav Desai wrote:
> We are seeing cases where the return traffic is going out using the 
> proxyIP and port 8001, instead of using the origin servers IP and 
> port 80. I have added the traces for both cases below. Most of the 
> traffic goes out correctly using the origin server IP and port, but 
> the traffic using port 8001 is not insignificant, hence we are a bit 
> concerned about it.

*nod*

> There are no connections coming in to port 8001.

Ok...

I have to ask, is there a reason you are not configuring clients to talk 
directly to the proxy?  In my experience this works a lot better than 
transparent proxying.  I tend to use direct proxying as the primary 
method and then transparent proxying as a backup and to catch devices 
that don't know how to talk to a proxy.

> I am not sure what could be causing this behavior or how I should go 
> about debugging this. Could the conntrack table or its usage be 
> screwed up?

Are there any DMESG or syslog entries about the connection table being full?



Grant. . . .

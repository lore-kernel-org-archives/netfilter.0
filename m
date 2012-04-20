From: Rick Jones <rick.jones2@hp.com>
Subject: Re: MTU question
Date: Fri, 20 Apr 2012 10:30:19 -0700
Message-ID: <4F919D2B.70206@hp.com>
References: <op.wc2nftsax1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.wc2nftsax1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

On 04/20/2012 09:15 AM, Lloyd Standish wrote:
> Hi,
>
> I have a question about MTU. Suppose my PC's Ethernet interface is
> configured at 1500 MTU, and it connects to a router interface configured
> to use 1492 MTU.
>
> Suppose my PC needs to send packets to the router. Given these MTU
> settings, which of these 2 is correct?
>
> (a) my PC will only send 1492 byte packets maximum (because the
> destination interface is only 1492), or
> (b) the PC will send packets up to 1500 bytes in size, but the router
> will split the packets before sending them on
>
> I have been assuming (a) is correct.

I suspect the answer is some variation on:

c) Since the two systems are in the same broadcast domain, with no 
intervening router to perform PathMTU discovery, the PC will send IP 
datagrams up to 1500 bytes, which likely as not will be dropped by the 
"router" as being too large before it even gets to IP on the router.

I would expect that only if your "router" has a 1500 byte MTU on the 
interface facing the PC, and a 1492 byte MTU on the interface facing the 
"internet" would you see the PathMTU discovery activity which would 
cause the PC to adjust the effective MTU it was using to match 1492. 
Only if the IPv4 DF (Don't Fragment) bit is clear should the "router" 
split the packets.

rick jones

> Thanks in advance.
>
> --
> Lloyd
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html


From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: Pre-routing re-write
Date: Fri, 23 Oct 2009 15:35:17 +0200
Message-ID: <4AE1B115.7090007@unipex.it>
References: <20091014231016.GA4580@retriever.dyndns.org> <4AD8555A.1080301@unipex.it> <20091017034303.GB27400@retriever.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20091017034303.GB27400@retriever.dyndns.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kevin Bailey <ke-linux@retriever.dyndns.org>
Cc: netfilter@vger.kernel.org

Kevin Bailey wrote:

(sorry for late reply, I was so busy)

> On Fri, Oct 16, 2009 at 01:13:30PM +0200, Michele Petrazzo - Unipex 
> wrote:
>> Sorry, but this can be possible. The gw for a network class must be
>>  inside the _same_ class!
> 
> The gateway of 192.168.10.2 is quite reachable from 192.168.10.1.
> 

 From your first email I didn't understand this

>> Where the packet starts? If you use nat + output you are saying to 
>> the kernel to do a thing when a packet are generated locally. Are 
>> you the gateway for another network (lan)? However, It's not so 
>> well explained what you want to achieve.
> 
> The packet will be originated locally. I was just asking if it was 
> possible for a packet that got re-written to be routed beforehand.

I continue to not understand what you want to do, however, for me no.
The packet has to pass all the chains and table and cannot re-enter
inside the kernel flow

Michele

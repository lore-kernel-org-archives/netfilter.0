From: Ed W <lists@wildgooses.com>
Subject: Re: High accuracy bandwidth accounting?
Date: Thu, 12 May 2011 23:17:13 +0100
Message-ID: <4DCC5C69.1020305@wildgooses.com>
References: <4DC7F632.9020105@wildgooses.com>	 <1304977533.1921.305.camel@andybev-desktop> <4DCA9D96.90002@wildgooses.com> <1305158473.1921.358.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1305158473.1921.358.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: Netfilter <netfilter@vger.kernel.org>

On 12/05/2011 01:01, Andrew Beverley wrote:
> On Wed, 2011-05-11 at 15:30 +0100, Ed W wrote:
>> On 09/05/2011 22:45, Andrew Beverley wrote:
>>> I wrote a similar patch for Squid (released in V3.2), which allows
>>> packets to be marked before Squid, and Squid to reapply the mark on
>>> retransmission. Marks can also be applied for locally cached files. If
>>> it helps the patch is at:
>>>
>>> http://bazaar.launchpad.net/~squid/squid/3-trunk/revision/10925
>>
>>
>> Did you find any better way to read the packet mark than using
>> conntrack?  I see that's how you are doing it in the patch you reference?
>>
> 
> No, I think that's the only/best way of doing it (you can't read it from
> a socket). That's the advice I got from the netfilter developers anyway,
> and it doesn't get much better than that.

I guess a feature request that the nf_mark is copied down to the "socket
mark" for arriving packets is going to be met with a "lets see your
patch"?  Did you do any investigation to see where such code might be
fitted - or even if it's a good idea?

Cheers

Ed W

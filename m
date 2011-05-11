From: Ed W <lists@wildgooses.com>
Subject: Re: High accuracy bandwidth accounting?
Date: Wed, 11 May 2011 15:30:46 +0100
Message-ID: <4DCA9D96.90002@wildgooses.com>
References: <4DC7F632.9020105@wildgooses.com> <1304977533.1921.305.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1304977533.1921.305.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: Netfilter <netfilter@vger.kernel.org>

On 09/05/2011 22:45, Andrew Beverley wrote:
> I wrote a similar patch for Squid (released in V3.2), which allows
> packets to be marked before Squid, and Squid to reapply the mark on
> retransmission. Marks can also be applied for locally cached files. If
> it helps the patch is at:
> 
> http://bazaar.launchpad.net/~squid/squid/3-trunk/revision/10925


Did you find any better way to read the packet mark than using
conntrack?  I see that's how you are doing it in the patch you reference?

Thanks

Ed W

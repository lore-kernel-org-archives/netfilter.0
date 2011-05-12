From: Andrew Beverley <andy@andybev.com>
Subject: Re: High accuracy bandwidth accounting?
Date: Thu, 12 May 2011 01:01:13 +0100
Message-ID: <1305158473.1921.358.camel@andybev-desktop>
References: <4DC7F632.9020105@wildgooses.com>
	 <1304977533.1921.305.camel@andybev-desktop> <4DCA9D96.90002@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1305158474; bh=F1/uvG0JS6ASqlKN4tw/XQ1S6SEF3Ouos8J+P
	ywKMGw=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=st4YSVud
	OX05s1/tSmOgfVqt+felE6MmTY3DG37bppolFu/mGmFjCbJY9qscs/1LOTQvX/nWLrM
	AxIB9LGZUED/cqGFze7RjIqUUH7QqlqjLNOYD8VgVYYTuz2EUXto1ncF0bNJH37vveW
	D8B2gYaWMVbpPHYTVe4IlEpqGCvGs=
In-Reply-To: <4DCA9D96.90002@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ed W <lists@wildgooses.com>
Cc: Netfilter <netfilter@vger.kernel.org>

On Wed, 2011-05-11 at 15:30 +0100, Ed W wrote:
> On 09/05/2011 22:45, Andrew Beverley wrote:
> > I wrote a similar patch for Squid (released in V3.2), which allows
> > packets to be marked before Squid, and Squid to reapply the mark on
> > retransmission. Marks can also be applied for locally cached files. If
> > it helps the patch is at:
> > 
> > http://bazaar.launchpad.net/~squid/squid/3-trunk/revision/10925
> 
> 
> Did you find any better way to read the packet mark than using
> conntrack?  I see that's how you are doing it in the patch you reference?
> 

No, I think that's the only/best way of doing it (you can't read it from
a socket). That's the advice I got from the netfilter developers anyway,
and it doesn't get much better than that.

Andy



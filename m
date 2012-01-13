From: Andrew Beverley <andy@andybev.com>
Subject: Re: Dual WAN set-up
Date: Fri, 13 Jan 2012 07:18:01 +0000
Message-ID: <1326439081.2182.8.camel@andrew-desktop>
References: <201201121651.18887.dyioulos@onpointfc.com>
	 <1326407319.2182.2.camel@andrew-desktop>
	 <201201121748.51479.dyioulos@onpointfc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1326439083;
	bh=bEyKvBSVNEWEvf13FpcmoKXgsQ8FdUw8jO9NyBMp3qs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=d5mkDYvpRH+nfDVU6xqo/+MqkOCYlSrkzyp/+1olLoesflZaZhcvUQH4bn2Iodt0m
	 WvF7w6OaegyWuZO+MVXLG8t+kZyTg28EXg94ZM0DvsxQ1KAolz09aoQABubq1mExcf
	 7Y6TJ7eRYpyMSQqRaDMJDtZqyfoqce1/ob8TUV4s=
In-Reply-To: <201201121748.51479.dyioulos@onpointfc.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dimitri Yioulos <dyioulos@onpointfc.com>
Cc: netfilter@vger.kernel.org

On Thu, 2012-01-12 at 17:48 -0500, Dimitri Yioulos wrote:
> > > Now, I need to add a second WAN (provided by a second
> > > provider). I need it to serve specific boxes in the DMZ, both
> > > inbound and outbound.  Currently, all boxes in the DMZ are
> > > served by the single WAN connection.  I'm not sure what other
> > > information I need to provide you, but I'm hoping you all can
> > > help with very specific instructions or a very detailed
> > > how-to
> >
> > If you check the list archives there's been a few discussions
> > on this recently (search for load balancing).
> >
> > One way of doing it is marking each connection and balancing
> > those, as described in this excellent web page:
> >
> > http://www.sysresccd.org/Sysresccd-Networking-EN-Iptables-and-n
> >etfilter-load-balancing-using-connmark
> >
> 
> Thank, Andy.  I'll give it a read.  I'm not sure I'm after load 
> balancing, though, but rather dedicating one WAN to a specific 
> set of machines, if that's even possible.

Ah, sorry, you did say that, I just misread your email (and original
diagram of course!)

>   Also, I've seen 
> how-to's on the NET, but all assume that you're starting fresh, 
> and adding two WAN connections.  I already have one in place, and 
> working fine.

Well that should be pretty easy to be honest. What Lloyd wrote looks
pretty spot-on, and is the way that I would approach this problem.

Andy



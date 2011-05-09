From: Andrew Beverley <andy@andybev.com>
Subject: Re: High accuracy bandwidth accounting?
Date: Mon, 09 May 2011 23:16:48 +0100
Message-ID: <1304979408.1921.309.camel@andybev-desktop>
References: <4DC7F632.9020105@wildgooses.com>
	 <1304977533.1921.305.camel@andybev-desktop>
	 <4DC8658B.4050204@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1304979409; bh=2IUeGhOCYoG7lpGSBhss+M8q878xdGAsVISaQ
	DM4q+I=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=jZFYZxBI
	PiX4C7JSKpYnKFuX8qhtjX7wZzqCdzpnqOiOYCqlm9L4c+DmNQ8sqa0ua6fkdqRvi2A
	nsgQZCsvvJNnpQpRsjtbuTODId3+scZL8XOZ20eGbE2ucW8fzcRzkar9IViL5uJzrOW
	o7F60BY4MvvL4CTUTaLIM0Ks6Ek48=
In-Reply-To: <4DC8658B.4050204@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ed W <lists@wildgooses.com>
Cc: Netfilter <netfilter@vger.kernel.org>

On Mon, 2011-05-09 at 23:07 +0100, Ed W wrote:
> On 09/05/2011 22:45, Andrew Beverley wrote:
> 
> > I wrote a similar patch for Squid (released in V3.2), which allows
> > packets to be marked before Squid, and Squid to reapply the mark on
> > retransmission. Marks can also be applied for locally cached files. If
> > it helps the patch is at:
> > 
> > http://bazaar.launchpad.net/~squid/squid/3-trunk/revision/10925
> 
> Well that just happens to be a perfect example of how to implement that
> mark copying for my various proxies!  Thanks
> 

No problem. If you write any patches for publicly available software
then please get them included upstream - would be very useful!

Andy



From: Alessandro Vesely <vesely@tana.it>
Subject: Re: libnetfilte_queue guide
Date: Fri, 07 May 2010 12:40:11 +0200
Message-ID: <4BE3EE0B.10601@tana.it>
References: <h2ie61979141005070222of28ec785xbd68a16c8e3e737a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1273228810; bh=hWzYJo609I1h0QYOEwoB4hNj0POQ126ndsXoUoAPjpw=;
	l=651;
	h=Message-ID:Date:From:MIME-Version:To:CC:References:In-Reply-To:
	 Content-Transfer-Encoding;
	b=DW1GfY9g16LIOXzxrUWZPsTTv1W9xPZ5YVxn3hq7fAnerCn8Kdg8TD55xUTCDMZUM
	 TmSnSzs5mXRrrFf0wTdWwJtJeM/O5sSB4xYP0yG9kkSiiY/GdzbHFDFBK+wN+1sNzZ
	 qGDr4blajUDyHFoUq86mQJUlplC/RDor5FKTs8AI=
In-Reply-To: <h2ie61979141005070222of28ec785xbd68a16c8e3e737a@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: vishesh kumar <linuxtovishesh@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

On 07/May/10 11:22, vishesh kumar wrote:
> Dear all
>    I am new to libnetfilter_queue , i want to develop some project on
> it. I am not unable about how to use it. Can anyone guide me that
> where i can some docs related to libnetfilter_queue.

Some oldish posts are linked from the bottom of tjkopena's wiki 
Netfilter Queue Notes [1]. Not much. Interactions with iptables is not 
illustrated. <rant>And if you'll get into troubles it seems unlikely 
this list will offer any support (e.g. recent posts by Deborah and 
me).</rant> Good luck!

[1] 
http://gicl.cs.drexel.edu/people/tjkopena/wiki/pmwiki.php?n=SWAT.NetfilterQueueNotes

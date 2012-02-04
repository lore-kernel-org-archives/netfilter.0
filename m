From: Andrew Beverley <andy@andybev.com>
Subject: Re: Hanging outgoing connections while incoming are OK
Date: Sat, 04 Feb 2012 23:27:49 +0000
Message-ID: <1328398069.18690.75.camel@andrew-desktop>
References: <CACP6TAgii5i3rjuZHZaC=23ZN_FqFyXcigCj9MMcYkGXYgk-1A@mail.gmail.com>
	 <1328031477.2018.12.camel@andy-laptop>
	 <CACP6TAghHWG2zHfGkPuac2o-qZbuwQHXqddyhUGx3Lwvuch5SA@mail.gmail.com>
	 <1328122709.1891.11.camel@andy-laptop>
	 <CACP6TAiwyGXZqYHG40TrsEaKr7sAKKAO+A5Z7a=DMVcf3iO4ng@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CACP6TAiwyGXZqYHG40TrsEaKr7sAKKAO+A5Z7a=DMVcf3iO4ng@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1328398070;
	bh=c9CtmHeBpOjlVksoXtZdI2Pfr26RfodvVsMpZ/EuLRo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=BvtqdJ2oZ9qWAeZIXGKMc8Ii+FOX86mlN/JWJDoy9g/f79TXVSpvTTDLKxmMzw6k5
	 jdjVdF6bj2BScx4ncxLwUtQtxqgW7q159JVGEaZO9nCmnToAmoLg5m+J1Rsg8ws/EJ
	 ogcjeAVXIXSO3u+N+6k3Jy1KFmOZQK4GmwTssVhE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Guido Anzuoni <ganzuoni@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, 2012-02-02 at 08:48 +0100, Guido Anzuoni wrote:
> The much more specific question is: in order to correctly perform SNAT
> and DNAT, is it necessary to bind the referenced addresses
> to some interface ?

Well, I can't see why you'd want to SNAT to an IP address that isn't
assigned to the interface in question? I don't know whether it would
work or not though.

As for DNAT, the destination address wouldn't necessarily be on the same
machine, so the answer is no.

Unless I'm misunderstanding your question?

Andy



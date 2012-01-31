From: Andrew Beverley <andy@andybev.com>
Subject: Re: Hanging outgoing connections while incoming are OK
Date: Tue, 31 Jan 2012 17:37:57 +0000
Message-ID: <1328031477.2018.12.camel@andy-laptop>
References: <CACP6TAgii5i3rjuZHZaC=23ZN_FqFyXcigCj9MMcYkGXYgk-1A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CACP6TAgii5i3rjuZHZaC=23ZN_FqFyXcigCj9MMcYkGXYgk-1A@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1328031589;
	bh=h9F1e0Np2ey2NpHrpWx2VbnOUsOD+EiqayFP104rMZ8=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Mime-Version:Content-Transfer-Encoding;
	b=CU8qkcsMMylfD8Ig5lZLLKesX0ZeqbQ6btf6nC/uw1/HQ6Zoed03HAjBlp9Ja0Hti
	 AjiXtiDDUfVaBBnJS7JBLvHi2JVovYxTAbpry/AD+HmELwu9TBtluPLob25K4WblE8
	 1eSg7KJcULppfFvEC+E6JN3wJ4Kx71QOmjR3mfDU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Guido Anzuoni <ganzuoni@gmail.com>
Cc: netfilter@vger.kernel.org

On Sat, 2012-01-28 at 09:39 +0100, Guido Anzuoni wrote:
...
> fw default gateway: 10.254.254.2
> fw eth0: 10.254.254.1, PUB_IP_OUTGOING, PUB_IP_OUTGOING
...
> My doubt is about eth0 configuration where I bind multiple addresses,
> an internal one and all the public assigned by the ISP.
> Is it a correct setup ?

Unless I'm misunderstanding something, this does seem like a strange set
up. Why not just have the one IP address on eth0? Do the Cisco routers
also have an external IP address? Are these 2 completely independent WAN
links? If so, how is traffic shared between them?

Sorry for all the questions, but I'm not entirely understanding your set
up and what you are trying to achieve.

Andy



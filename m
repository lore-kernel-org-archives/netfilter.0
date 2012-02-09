From: Andrew Beverley <andy@andybev.com>
Subject: Re: iptables udp 1195 MASQUERADE
Date: Thu, 09 Feb 2012 20:48:44 +0000
Message-ID: <1328820524.18690.236.camel@andrew-desktop>
References: <16986089.2736.1328591540466.JavaMail.root@ixer.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <16986089.2736.1328591540466.JavaMail.root@ixer.mx>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1328820527;
	bh=QWJrCX1ikoLABitzzVYjHo6YeCzb7O/1O9APMz1ZNAU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=fhwf5q50eM+8ZcYR4cVRj05/g7qlKfeExbNuKfBT8VFZXel82fMP8mzcT/DV6QCHC
	 iK5VwCqv8GIcVVite1kVsH6BC4e7o3GeDJGALeo5/acneDqPPm/lt3FPux0E8rKsCb
	 T0M4935X4mBZTA4HIywhdHT1/Iw3VbGC/qRfDt+M=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ehuerta@ixer.mx
Cc: netfilter@vger.kernel.org

On Mon, 2012-02-06 at 23:12 -0600, Enrique Huerta de la Fuente wrote:
> Apply the rule: "iptables -t nat -I POSTROUTING -o ppp0 -j MASQUERADE",
> this masks the port 22 (tcp) but not the 1195 (udp), because I can
> connect via ssh.

What do you mean by "masks"? What are you expecting the MASQUERADE
target to do? From the little information I've seen, it looks like you
are sending packets from a single interface from the local machine, in
which case the MASQUERADE will have no effect anyway.

> It seems the problem is that does not mask the port 1195 (udp).
> 

MASQUERADE works fine with UDP whenever I have used it.

Andy



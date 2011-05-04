From: Andrew Beverley <andy@andybev.com>
Subject: Re: Starter iptables scripts
Date: Thu, 05 May 2011 00:19:28 +0100
Message-ID: <1304551168.32212.36.camel@andybev-desktop>
References: <8762pqax4j.fsf@newsguy.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1304551169; bh=q7Y62WWYFaU745IHFnZ6ThnlCYvp2SjxzmPMf
	GZjqVk=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=cWcD8P6w
	D2IENnS0e0O2+3dxQqvgEkT57BKCGRFLFE7c1CMqCr5J3nwiXPkmyPStPNF4movu9uv
	K2jVOCuX8yiB2Fdd2HKjjIfMfW5/ingek5jVVMD8m8L0GlztN8bxWDg1KjY0seYeTU0
	avG+nXYAsX87wB+F+xIN2VfKAV3ik=
In-Reply-To: <8762pqax4j.fsf@newsguy.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Harry Putnam <reader@newsguy.com>
Cc: netfilter@vger.kernel.org

On Wed, 2011-05-04 at 18:01 -0500, Harry Putnam wrote:
> Setup: Running Gentoo Linux
>        Iptables and many related parts compiled into kernel
> 
> Can anyone offer well used and vouched for URLs to iptables scripts
> for a starter firewall setup?
> 

There's plenty of stuff out there if you Google, but if you tell us
exactly what you want to achieve then we will suggest something.

A good starting point for a basic firewall is to block all incoming
unrelated requests, but let everything out. Not particularly
comprehensive, but it may suit your needs:

iptables -A INPUT -i $ext_IF -m state \
	--state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i $ext_IF -j DROP

You may also want to do FORWARD if you use this as a gateway:

iptables -A FORWARD -i $ext_IF -m state \
	--state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $ext_IF -j DROP


Andy





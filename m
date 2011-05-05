From: Andrew Beverley <andy@andybev.com>
Subject: Re: Starter iptables scripts
Date: Thu, 05 May 2011 07:03:46 +0100
Message-ID: <1304575426.32212.39.camel@andybev-desktop>
References: <8762pqax4j.fsf@newsguy.com>
	 <1304551168.32212.36.camel@andybev-desktop>
	 <alpine.LNX.2.01.1105050137510.16932@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1304575427; bh=e9yCcncvZFtn0GAWN1PoNetVeqPQOq4UVNrSk
	LnR28k=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=CFyMkile
	uI7WKuubOcr9HYMYKsdqfoZpnZYUoaCPfnfma/ONvZb0J4oKLYcWq3AF9jakrYXLVBk
	LtDSEk4GJO+/FgjntAmRnmRoV/OiSnAHEWqqEq/fYnqRZ6HdAPl7XelmqOGTUOU6In0
	hSyP/VhCOQ6kszMd92l/enO+/2QLA=
In-Reply-To: <alpine.LNX.2.01.1105050137510.16932@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Harry Putnam <reader@newsguy.com>, netfilter@vger.kernel.org

On Thu, 2011-05-05 at 01:41 +0200, Jan Engelhardt wrote:
> 
> -m conntrack --ctstate ... it is these days.
> 

Thanks Jan. I should have known that, having had it pointed out to me
once already on this list :)

Andy



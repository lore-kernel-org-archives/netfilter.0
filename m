From: Andrew Beverley <andy@andybev.com>
Subject: Re: Routing locally generated traffic on fwmark
Date: Thu, 29 Sep 2011 18:46:11 +0100
Message-ID: <1317318371.26402.292.camel@andybev-desktop>
References: <1317248412.26402.39.camel@andybev-desktop>
	 <1317279076.26402.52.camel@andybev-desktop>
	 <alpine.LNX.2.01.1109291224580.18982@frira.zrqbmnf.qr>
	 <1317317318.26402.271.camel@andybev-desktop>
	 <alpine.LNX.2.01.1109291934450.25670@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1317318372;
	bh=/8fr2wDrc2Zaha2f3WGarRMcXmjPhmULg7D6otk5Y+8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=NGmQi+bI4EypLVm2o6W9FRMw0XFvhmKJ32RJwaUbRGAYxnWlvQSdW/UVdpM1O32zL
	 1zx52+20TfcIU5Tvc9mFUJlfHMJI224BXftuGOGvyaB4S7YQkM8XhGDsDzVa7IquQ2
	 hhETvI83Lcx1r4HDUOsRkqwx+Ju87CBnZwsjiteE=
In-Reply-To: <alpine.LNX.2.01.1109291934450.25670@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org, Pandu Poluan <pandu@poluan.info>

On Thu, 2011-09-29 at 19:35 +0200, Jan Engelhardt wrote:
> On Thursday 2011-09-29 19:28, Andrew Beverley wrote:
> 
> >On Thu, 2011-09-29 at 12:28 +0200, Jan Engelhardt wrote:
> >> On Thursday 2011-09-29 08:51, Andrew Beverley wrote:
> >> >> iptables -A OUTPUT -t mangle -d 89.16.176.81 -j MARK --set-mark 0x800
> >> >> ip rule add fwmark 0x800/0xffff table T2
> >> >> ip route add table T2 default dev ppp1 via 94.30.127.76
> >> >
> >> >I've also added the following, which makes no difference:
> >> >
> >> >iptables -t nat -A POSTROUTING -o ppp1 \
> >> >	-j SNAT --to-source 109.224.134.110
> >> 
> >> Of course it makes no difference, because SNAT is applied after routing.
> >> ("POST" "ROUTING", see?)
> >
> >Yes, but in my case the SNAT still needed applying. The problem was that
> >although the packets were being routed via the second interface, they
> >were still being sent from the original IP address of the first
> >interface. Therefore, packets were being returned to the first
> >interface, making it look as if the second interface wasn't being used.
> 
> Well, that's why one should use tcpdump -i ethX, rather than tcpdump -i 
> any :-)

Yep, I learn something every time ;-)



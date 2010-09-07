From: Thomas Jacob <jacob@internet24.de>
Subject: Re: OpenVPN throttling problem
Date: Tue, 07 Sep 2010 17:05:46 +0200
Message-ID: <1283871946.32608.212.camel@enterprise.ims-firmen.de>
References: <BAY145-ds40063ED1096C32DC63795F3710@phx.gbl>
	 <1283857776.32608.39.camel@enterprise.ims-firmen.de>
	 <BAY145-ds21DEA1A44DBD89BF0401BCF3710@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BAY145-ds21DEA1A44DBD89BF0401BCF3710@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: J Webster <webster_jack@hotmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 2010-09-07 at 10:25 -0400, J Webster wrote:
> If the path MTU were not 1500 then why would the proxy server work without 
> video stuttering issues but the VPN have stuttering?

Because OpenVPN seems to prevent the normal path MTU algorithms
from working in some instances, so the dynamic MSS/MTU
calculations cannot happen. Anyway, a proxy server
doesn't forward TCP packets in the way OpenVPN does,
it opens a new TCP connection and just relays the Web data stream,
so it's really quite a different thing.

> I would have thought most broadband connections were not limited in that 
> way?

PPPoE DSL is, for instance.

> I did try some MTU setting before of 1400, 1460, 1300 and the difference was 
> minimal.

It's not enough to just configure that in OpenVPN, all the other
components (client NIC, gateway NICs, server NIC, intermediate router
NICs) also have their own MTU (hence the path MTU discovering
solution).

> Not sure what else to try or how to troubleshoot. I suppose I could follow 
> the traffic but not sure if it would help resolve the throttling issue?

Have you tried MSS clamping yet?

http://lartc.org/howto/lartc.cookbook.mtu-mss.html


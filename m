From: raido <raido@elin.ttu.ee>
Subject: Re: DNAT forwarding problems
Date: Mon, 9 Aug 2004 05:45:56 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408090545.56296.raido@elin.ttu.ee>
References: <411166D5.30105@galacticasoftware.com> <200408051525.38235.raido@elin.ttu.ee> <41126680.2060403@galacticasoftware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <41126680.2060403@galacticasoftware.com>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: Adam Majer <adamm@galacticasoftware.com>

>
> The problem appears to be that the rp_filter ate the packets. It thought
> that these packets were rogue packets. Anyway, when I disabled
> rp_filter, the packets starting flowing but then there was the problem
> of reply packets being sent out from a wrong interface. 
It seems our configurations go here apart. I don't have IP addresses bound to 
box, so, I don't have rp_filter either.  Turning off rp_filter for "all"  
didn't change a thing.
Thanks anyway and great you got your configuration to work.

Raido


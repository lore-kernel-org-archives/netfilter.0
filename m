From: Johan Ankarloo <johan.ankarloo@volvo.com>
Subject: Re: DNAT/SNAT and logging
Date: Mon, 19 Jan 2004 16:37:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074526637.2457.30.camel@ankarloo.got.volvo.net>
References: <1074524662.2456.23.camel@ankarloo.got.volvo.net>
	 <400BF600.9060005@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <400BF600.9060005@Loudoun-Fairfax.com>
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

On Mon, 2004-01-19 at 16:21, Jeffrey Laramie wrote:
> Johan Ankarloo wrote:
> 
> >Hi
> >
> >Does anyone know how to log a DNAT/SNAT connection? When logging a NAT
> >connection you also want to know the origin source/destination/port of
> >that packet. Is that possible?
> >
> >  
> >
> 
> Sure. The easiest way to do it is to add a matching log rule just before 
> the nat rule:
> 
> iptables -t nat -A POSTROUTING -o $Net_Interface -j LOG --log-prefix 
> "SNAT: "
> iptables -t nat -A POSTROUTING -o $Net_Interface -j SNAT --to $Net_IP
> 
> Jeff

The problem is when doing this is that you doesn't get the original 
source/destination or the translating adress. If you look at the logs
you can't see all the information that you need to be able to debug any
problem or to be able to track that connection back to the user.

What i was looking for was a way to have more information in the logs 
from that specific connection. The information that needs to be there is:

OriginSource OriginSPort OriginDestination OriginDPort
TranslatedSource TranslatedSPORT TranslatedDest TranslatedDPort

Regards

Johan



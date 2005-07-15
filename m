From: =?ISO-8859-15?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: DNS and NAT
Date: Fri, 15 Jul 2005 10:53:17 +0200
Message-ID: <42D7797D.2050203@mnemon.de>
References: <BAY17-F66FBC4C2BEA443DA8F48A80D10@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY17-F66FBC4C2BEA443DA8F48A80D10@phx.gbl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Suzana Lojic-Skoric schrieb:

> I don't think proxy can help because it is just caching the web pages,
> it does not change the IP addresses. I'll check if tunneling can help,
> if not then I'll have to change iptables to inspect DNS answer and
> replace the IP in the payload.

No. Introducing a proxy at the right location, is much more than just
caching web sites. It means significant changes to at least to the IP
headers.

Wether a proxy helps you or not depends totally on where you place the
proxy. If you place it on the nat box (like primero said) or between
this nasty dropping box and the nat box, everything is probably fine.
The requests will then go to 10.x.x.x and the answers will originate
from 10.x.x.x. The e.g. google address of 216.239.39.99 is within the
*data* part of the 4th packet - not in the headers (headers are
src=10.y.y.y dst=10.x.x.x). As long as the nasty dropping box doesn't
scan the packets payload for proxy requests and the like and drops them,
everything should work.

If, on the other side, it is only possible to place the proxy between
the clients and this nasty dropping box, you're out of luck and a proxy
helps nothing at all. But as far as I understood - and you provided
information - you have access to the nat box. So, this should not be the
case.

BTW, would you please be so kind and provide sufficient information
about your problem in the first posting (introducing this nasty box
changes the whole situation) ? This way people who want to help you do
not have to feel like the "Oracle of Delphi" ;) Thanks.

Have a nice time,

Joerg



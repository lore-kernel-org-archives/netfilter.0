From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Port forwarding or NAT?
Date: Wed, 15 Sep 2004 01:47:50 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409150147.50672.Alistair@nerdnet.ca>
References: <01ef01c49a5f$51824900$6300a8c0@93egeater>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <01ef01c49a5f$51824900$6300a8c0@93egeater>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On September 14, 2004 09:32 am, Eric Geater 9/01/04 wrote:
> I have one crazy machine at our home office that must communicate on
> port 6847 to an outside company.  This one machine went through our old
> proxy server until it died last week.  We're using IPTABLES through
> rc.firewall-2.4 on a Linux proxy, but it doesn't seem to be allowing
> this communication to occur.
>
> Would this be handled through port forwarding or NAT?  I was under the
> impression that our firewall was set up to allow all traffic, initated
> from the LAN, through.  This apparently isn't the case, however.
>
> Eric

	Not knowing what the application that is communicating in this manner is, 
will make suggestions likely off the mark.

	if you are using the proxy server to handle *outgoing* connections using its 
INSIDE ip address, you need to accept packets from the LAN in INPUT chain, 
coming to the proxy.  You will then need to let packets OUT to the internet 
from the proxy to the internet through the OUTPUT chain.  You might well get 
away with appropriate ESTABLISHED RELATED rules to allow tarffic back, but it 
is possible that you will require additional rules to let traffic in from the 
other end.  I would hope that the proxy is smart enouh to handle NATTING the 
packets to the outside IP.

	if the proxy is accepting connections from the internet and proxying them to 
the LAN, you need to accept packets from the other end in via INPUT and allow 
packets to the internal box through OUTPUT,  again, an appropriate 
ESTABLISHED, RELATED rule *should* handle traffic on the return trip.  

	Since it sounds like the proxy and firewall are the same box, the FORWARD 
chain isnt likely to be involved here.  Thus letting all traffic from LAN 
through to internet will not work here.  You have to let the traffic from the 
LAN client INTO the firewall to get to the proxy.

	Alistair Tonner


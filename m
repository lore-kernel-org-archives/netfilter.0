From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: Special routing for incoming pop3-requests
Date: Fri, 5 Sep 2003 21:24:34 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.56.0309052121450.4129@space.comunit.de>
References: <3F58BB42.20306@gmx.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F58BB42.20306@gmx.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kirchhoff <kirchy@gmx.de>
Cc: netfilter@lists.netfilter.org

On Fri, 5 Sep 2003, Jan Kirchhoff wrote:

> I am new to this List and I'm not really sure if this is really an
> iptables-issue, but I think iptables is the tool I need for this:

nope, you need policy routing

> How do I get to work (with iptables-rules on server1?), that all packets
> from server1 port 110 that have a destination other than the LAN go out
> on fw2 but all other traffic goes to fw1?
> I need a special route based on source-ip and source-port. I do not want
> to rewrite the destination ip (which would not help since its already
> right) but have influence on the routing to the next gateway.

have a look at http://lartc.org/howto/lartc.rpdb.html

c'ya
sven

-- 

The Internet treats censorship as a routing problem, and routes around it.
(John Gilmore on http://www.cygnus.com/~gnu/)


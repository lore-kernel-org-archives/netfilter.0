From: Nox <pheusion@snet.net>
Subject: Re: n00b question.....   How to get details on active connections
Date: Sat, 20 Sep 2003 12:09:10 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064074150.782.594.camel@shaolin.gridlocksecurity.com>
References: <021a01c37f57$adb6b360$0501a8c0@gndn.subspace.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <021a01c37f57$adb6b360$0501a8c0@gndn.subspace.net.au>
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
To: paul.gibson@subspace.net.au
Cc: netfilter@lists.netfilter.org

On Sat, 2003-09-20 at 05:15, Paul Gibson wrote:
> Hello,
> 
> 	I know this is a n00b question but how can I get details of active
> connections, eg what inside address/pc is connected to what outside address
> ???

Do you mean connections through the Firewall?
Something like /proc/net/ip_conntrack will tell you the active
connections. (might be /proc/net/ipv4/ip_conntrack on your box)

If you mean just the box your on, something like a netstat will do that

Hope that helps

Nox
GenMicro Systems



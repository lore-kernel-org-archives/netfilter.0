From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: iptables -L command
Date: Thu, 22 Jun 2006 15:19:30 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0606221518550.28760@mercury.sdinet.de>
References: <3720.10.0.1.96.1150908419.squirrel@www.di.ubi.pt>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3720.10.0.1.96.1150908419.squirrel@www.di.ubi.pt>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "David Alexandre M. de Carvalho" <david@di.ubi.pt>
Cc: netfilter@lists.netfilter.org

On Wed, 21 Jun 2006, David Alexandre M. de Carvalho wrote:

> How can I do something equivalent to "ipchains -L -M" ?
> I want to see active masq/nat rules.
> iptables -t nat -L is not enough. I need to see active connections.

cat /proc/net/ip_conntrack

c'ya
sven

-- 

The Internet treats censorship as a routing problem, and routes around it.
(John Gilmore on http://www.cygnus.com/~gnu/)


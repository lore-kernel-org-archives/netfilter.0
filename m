From: Eric Leblond <eric@inl.fr>
Subject: Re: How to get "real time" kernel updates from iptables
Date: Mon, 14 Mar 2005 23:32:40 +0100
Message-ID: <1110839560.7535.4.camel@localhost.localdomain>
References: <4235AECA.80305@bigpond.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <4235AECA.80305@bigpond.net.au>
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
To: I & L Fogg <il.fogg@bigpond.net.au>
Cc: netfilter@lists.netfilter.org

Hi,

For an Netfilter based authenticating firewall, you may have a look to
NuFW : http://www.nufw.org/

It is authenticating connections (Netfilter meaning) individually and it
is not doing an IP==address association. Thus it even work on multiusers
systems.

BR,
-- 
Eric Leblond <eric@inl.fr>



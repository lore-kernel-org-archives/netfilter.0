From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ICMP traffic + iproute + tunnel problems
Date: Wed, 19 May 2004 22:33:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405192233.27254.Antony@Soft-Solutions.co.uk>
References: <20040519211105.GH1003@dreamflow.nl>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040519211105.GH1003@dreamflow.nl>
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

On Wednesday 19 May 2004 10:11 pm, Bart Matthaei wrote:

> Hi All,
>
> I have the following problem:
>
> I have a tunnel between my home router and my colocated machine.
> I use source routing (iproute) to route all traffic coming from my home
> network (public ipspace) over the tunnel.
>
> Everything works fine. But when a user traceroutes a host in my home
> network, or sends traffic to an unreachable host, all ICMP replies are
> coming from the ip address of my cable connection (eth0), which is still
> the default route on the home router itself.

I don't see that the result could be any different, since the source of the 
packets going back to the external address really is your cable connection on 
eth0 - not an internal address which can be used to match any source-routing 
rule.

If someone pings (or telnets, or whatever) an unreachable host on your network 
(or should that be an unreachable host not on your network...?), then the 
host itself obviously cannot send back a response - it is the upstream router 
which does this, and the source address of the response it sends is that of 
its own external interface.

Maybe you should block incoming traceroutes (ie don't send back TTL exceeded 
ICMP responses), and be selective about what other ICMP responses you allow 
back (such as host / port / network unreachable)?

Regards,

Antony.

-- 
Bill Gates has personally assured the Spanish Academy that he will never allow 
the upside-down question mark to disappear from Microsoft word-processing 
programs, which must be reassuring for millions of Spanish-speaking people, 
though just a piddling afterthought as far as he's concerned.

 - Lynne Truss, "Eats, Shoots and Leaves"

                                                     Please reply to the list;
                                                           please don't CC me.



From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: ICMP: What should be blocked?
Date: Wed, 5 Mar 2003 11:20:12 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0303051106580.15761@dns.toxicfilms.tv>
References: <3E65A2C5.3030007@mega-bucks.co.jp>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E65A2C5.3030007@mega-bucks.co.jp>
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
To: Jean-Christian Imbeault <jc@mega-bucks.co.jp>
Cc: netfilter@lists.netfilter.org

Hi,

in my opinion icmp is the easiest to set up for.

1) Allow all ICMP that is related to connections issued by the protected net
2) Allow echo requests if you wish.
3) Block all other by default.

-p icmp -m state --state RELATED -j ACCEPT

> One question I have not been able to find an answer to though, should I
> block ICMP messages of type 11 (TTL exceeded)?
Only if they are really responses to packets sent by the router or your
protected hosts. Otherwise they may be inverse mapping attempts and should
be blocked. Of course it is only possible to filter with the -m state.


> Also if anyone knows of a good resource that explains what ICMP messages
> I should block (why and how :) could they let me know?
www.sys-security.com/archive/papers/ICMP_Scanning_v3.0.pdf
And other articles by Ofir Arkin about ICMP.

> I understand that it of course depends on my level of paranoia
> and how friendly I want to be to the rest of the net, but I get the
> feeling from my readings that the are some ICMP messages that just
> should not be let through a firewall ....
Paranoia? No, just be statefull. Allow what is required by the undergoing
connections, disallow what is not.

That is the easiest way to protect yourself from inverse mapping, stealing
routes with icmp redirects, OS fingerprinting. This way you do not need
explicit rules for eg. timestamp requests, etc. (which are recommended to
be blocked), they will just not pass through the stateful mechanism of
iptables.

The statefulness of iptables is _very_ often not used by users, especially
by ipchains users. It makes everything go smoother, make rulesets simpler,
and chain parsing faster.

Regards,
Maciej Soltysiak



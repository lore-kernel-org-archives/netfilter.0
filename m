From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: will port forwarding work here?
Date: Fri, 14 Jan 2005 11:11:40 -0500 (EST)
Message-ID: <61884.142.169.215.10.1105719100.squirrel@142.169.215.10>
References: <20050114153508.GA1189@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050114153508.GA1189@tranquility.scriptkitchen.com>
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
To: Payal Rathod <payal-netfilter@scriptkitchen.com>
Cc: netfilter@lists.netfilter.org

On Fri, January 14, 2005 10:35 am, Payal Rathod said:
> Hi,

Hi!

> Is it possible to write some kind of rule on 192.168.0.10 which will
> *properly* redirect traffic from 192.168.0.10:3128 to
> 192.168.0.11:3128 for those clients.  A friend on chat suggested (he
> was not sure),
>
> iptables -A PREROUTING -t nat -s 192.168.0.10 --dport 3128 \
>  -j DNAT --to-destination 192.168.0.11
>
> Is there anything else missing?

Yes, see NATing on the same network from the Rusty's NAT howto.

Also, please note this will broke HTTP 1.0 which really hates NAT.

What I suggest is configuring both squid in HTTP accel mode (transparent)
and unconfigure your client's browser so they attempt to reach the
world wide web by themself.

Then, make your router silently redirecting packets to whatever the squid
you want.

Read http://www.tldp.org/HOWTO/TransparentProxy.html
Chapter 6 is what you need, I guess.

>
> With warm regards,
> -Payal
>

HTH,

Samuel




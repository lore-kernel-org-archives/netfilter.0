From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Iptables, SNAT/MASQ,  Multiple gateways (fwd)
Date: Mon, 30 Sep 2002 00:28:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020929232812.NJRO20346.mta02-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0209291602330.16046-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0209291602330.16046-100000@localhost.localdomain>
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

On Monday 30 September 2002 12:12 am, Simon Matthews wrote:

> I have a dual-homed firewall. It has 2 Internet connections, provided by
> different ISPs (each with an associated IP address). The 2 Internet
> connections are connected to the same physical interface.

Why ???

> I am using the iproute2 tools to configure the 2 internet connections, so
> both connections are associated with "eth0" (and not an 'eth0:x' style
> device name).
>
> The iproute2 tools are used to ensure that:
> 1. I have a 5:1 ratio of the gateway usage.
> 2. The outgoing packets have the correct source address for the gateway
> they will use.
>
> Now this will work for packets coming from the local host. But packets
> that are forwarded from the LAN behind the firewall will come in, and
> during the routing stage, they will be assigned a gateway to use.
>
> Now, since the gateway is already defined, how do I make MASQ/SNAT work so
> that it set the appropriate source address for the gateway?

Can you use the MARK match ?

I know it's possible to set a MARK on packets using the mangle table, and 
then use the MARK in iproute2 to send them the right way, but I'm not so sure 
about doing it the other way around - setting the MARK with iproute2 so that 
you can read it in the nat table and set the source address.

> Or will MASQ just work properly -- setting the
> source address according to the gateway that the packet will use?

No.   MASQUERADE will not know which of the two addresses on eth0 you're 
thinking about, so it would use the same one for every packet.

Antony.

-- 

If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.


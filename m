From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: static IP, different gateway & dns
Date: Thu, 24 Oct 2002 10:54:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210240954.g9O9sbL04022@vulcan.rissington.net>
References: <006301c27a57$f29f8840$0f01a8c0@Inspiron2100>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006301c27a57$f29f8840$0f01a8c0@Inspiron2100>
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

On Wednesday 23 October 2002 6:49 am, Clayton Check wrote:

> Hi,
>
> Can iptables NAT or handle nodes that have static IP address not on the
> same subnet as the iptable box, also with different gateway configuration
> and different DNS config?

Yes, netfilter can NAT anything which passes through it.   It doesn't care 
what the original or translated addresses are.

> Overview
> A linux box with iptable acts as a gateway to connect several clients to
> the Internet. However, the clients behind this gateway have static IP
> addresses and different gateway and dns configuration. Lets assume that
> changing their network configurations are not possible.
>
> Can iptables handle this sort of networking?
>
>                              |--- 192.168.1.12 (gw: 192.168.1.1)
>
> ---- eth0 (iptables) eth1 ---|--- 192.168.10.25 (gw: 192.168.10.1)
>                   10.0.0.1/8 |
>
>                              |--- 202.145.23.25 (gw: 202.145.0.5)
>                              |
>                              |--- 10.0.0.16 (gw: 10.0.0.1)

If you can get the packets to pass through netfilter, it will do the NAT for 
you.

My feeling about the network setup you've described above is that the packets 
you're interested in won't be routed through the netfilter box, therefore it 
won't be able to do anything with them.

Antony.

-- 

Perfection in design is achieved not when there is nothing left to add,
but rather when there is nothing left to take away.

 - Antoine de Saint-Exupery


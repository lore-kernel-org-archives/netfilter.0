From: Johan Cimen <c99jcn@cs.umu.se>
Subject: Re: iptables newbie
Date: Sat, 27 Dec 2003 22:26:12 +0100 (MET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.58.0312272218070.8166@peppar.cs.umu.se>
References: <Pine.GSO.4.58.0312271424260.10965@peppar.cs.umu.se>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.58.0312271424260.10965@peppar.cs.umu.se>
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
To: netfilter@lists.netfilter.org

Hi!

I am answering my own question.

Using:
iptables -t mangle -A OUTPUT -o $IFACE -p UDP --dport 7001 -j TOS
--set-tos 0x10

can be viewed using:
iptables -t mangle -L

This will also show POSTROUTING AND PREROUTING chains.

If a iptable command is not properly written it will answere: No
chain/target/match by that name, so do it as it shall be done. :)

Thanks all for your support. I am still a newbie. :)

-Johan-

On Sat, 27 Dec 2003, Johan Cimen wrote:

> Hi!
>
> I am an iptables newbie and this is what I want do do with iptables:
> 1. I want to ulog incomming packets at PREROUTING, incomming at specific
> ports with UDP protocol.
> 2. I am going to generate UDP packets from my local station, from specific
> ports.
> 3. I want to set TOS and TTL fields of my packets matching specific ports
> at OUTPORT or POSTROUTING.
>
> Problem that I have is:
> 1. I cannot use:
>    iptables -t mangle -A OUTPUT -o $IFACE -p UDP --dport 7001 -j TOS
> --set-tos 0x10
>    Using iptables -L shows nothing under OUTPUT headline.
>    I cannot use tables at all.
> 2. I cannot use (just an example, nothing to do with what i want to do):
>    iptables -A POSTROUTING -o $IFACE -p UDP --dport 7001
>    iptables says: No chain/target/match by that name
>    Above iptable command works for INPUT, FORWARD and OUTPUT chains.
>
> Question is:
> 1. Have I missed something in my kernel configurations?
> 2. Have I missed something in building chains and targets?
> 3. I need help!
>
> -Johan-



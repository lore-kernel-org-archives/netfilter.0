From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: Fwd: Security in Virtual machine with DNAT
Date: Fri, 24 May 2013 14:32:28 +0530
Message-ID: <519F2CA4.7040205@atc.tcs.com>
References: <519DCEDC.9030704@bersol.info> <519DD30C.70500@bersol.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <519DD30C.70500@bersol.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alberto <alberto@bersol.info>
Cc: netfilter@vger.kernel.org

Hi Alberto,

I think, you can remove the bridge and keep guests in a different 
network. Then use host firewall to DNAT the traffic (to hostIP:80) to 
Guest (guestIP:80). You can filter the traffic in the FORWARD chain (not 
INPUT).


Regards,
Vignesh

On 05/23/2013 01:57 PM, Alberto wrote:
> I have tried send in html format, with a graphic, but the list policy 
> has not permitted me.
>
> Sorry.
> This is the plain text from the message.
>
>
>
> -------- Mensaje original --------
> Asunto:     Security in Virtual machine with DNAT
> Fecha:     Thu, 23 May 2013 10:10:04 +0200
> De:     Alberto <alberto@bersol.info>
> Para:     netfilter@vger.kernel.org
>
>
>
> Hi Everybody,
>
> I have a Physical HOST (*/Server Fisico/*) connected to internet. It
> have 2 network cards, the first one (*/eth0/*) connected to the router
> and the Internet, another (/*eth1*/) is connected to LAN.
> /*eth1*/ is bridged to virtual machines network, and one of them
> (*/virtual1/*) have an HTTP Server. Everything is running correctly.
>
>
> Escenario
> I have IPTABLES Firewall running on the HOST with DNAT forwarding HTTP
> traffic to /*Virtual1*/. I have IPTABLES Rules in HOST, for block some
> IPs that give me problems, but these rules not protect to /*Virtual1*/.
> All HTTP traffic is forwarded to /*Virtual1*/, even the source IP is
> blocked for IPTABLES rules.
>
> I had an attack, and I couldn't block the HTTP traffic about
> /*Virtual1*/, the IPTABLES rules not affect it.
>
> What can I do for give security to Virtual machines?
> These are some rules:
>
>     _Chain PREROUTING (policy ACCEPT 97192 packets, 8175K bytes)_
>     pkts bytes target prot opt in out source destination
>     374 20884 DNAT tcp -- eth0 * 0.0.0.0/0 0.0.0.0/0 tcp dpt:80
>     to:Virtual1:80
>     2 104 DNAT tcp -- eth0 * 0.0.0.0/0 0.0.0.0/0 tcp dpt:443 
> to:Virtual1:443
>     ...
>
>     _Chain INPUT (policy DROP 39407 packets, 5120K bytes)_
>     pkts bytes target prot opt in out source destination
>     0 0 REJECT all -- * * 99.24.186.236 0.0.0.0/0 reject-with
>     icmp-port-unreachable
>     0 0 REJECT all -- * * 64.60.169.59 0.0.0.0/0 reject-with
>     icmp-port-unreachable
>     ...
>
>
> Thanks a lot
> Alberto
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: marking in output mangle with route lookup]
Date: Mon, 14 Jul 2003 22:27:25 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDEMKKNJDLAJDPNDPCDDMEAPNFAA.georgev@citadelcomputer.com.au>
References: <1058173141.2871.3.camel@drs0.manchotnetworks.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1058173141.2871.3.camel@drs0.manchotnetworks.net>
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
To: lartc@manchotnetworks.net, netfilter <netfilter@lists.netfilter.org>

I use a combination of PHP/MySQL/MRTG and a script which reads the output of
iptables rules I use to charge clients..
This works well for me and should the firewall require a reboot or
something, it doesn't lose the counters..

I've sent the scripts to a few people on the list, maybe they can forward a
copy for you as I'm not at work.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of
lartc@manchotnetworks.net
Sent: Monday, July 14, 2003 6:59 PM
To: netfilter
Subject: [RE: marking in output mangle with route lookup]


Hi Gerorge,

Tried ( and failed ) with ip assigning. bummer. :-(

Thanks for your sugesstions -- my actual iptables enrty will read:

iptables --append OUTPUT --table mangle --match owner \
  --uid-owner 500 --jump MARK --set-mark 0x2

(I reduced the entry for the post because I couldn't get the fwmark to
do a routing table lookup)

In general terms, I am generating traffic on this local box on behalf of
a network behind it -- the network behind gets billed for their traffic.
The match owner directive seemed a decent way to assign an ip that will
be correctly accounted for.

Do you know of another technique yielding the same result?

Ciao

Charles





On Sun, 2003-07-13 at 23:59, George Vieira wrote:
> Try using iproute2 ip assigning and not ip aliasing as I find
aliasing=evil for some things.
>
> ip addr add 192.168.1.101/24 dev eth1
>
> Also, have you tried using SNAT instead of iproute for a simple snat of
the source address?
>
> iptables -I POSTROUTING -o eth1 -t nat -s 192.168.1.1 -d 192.168.1.250 -j
SNAT --to 192.168.1.101
>
> Thanks,
> ____________________________________________
> George Vieira
> Systems Manager
>
> Citadel Computer Systems Pty Ltd
> http://www.citadelcomputer.com.au
>
> -----Original Message-----
> From: lartc@manchotnetworks.net [mailto:lartc@manchotnetworks.net]
> Sent: Sunday, July 13, 2003 5:40 PM
> To: netfilter
> Subject: marking in output mangle with route lookup
>
>
> hello all,
>
> i posted this to the lartc forum, and received no response, so i am
hopeful
> that someone here can advise.
>
> i have come accross a curious issue:
>
> +----------------------+            +---------------+
> | eth1   192.168.1.1   |------------| 192.168.1.250 |
> | eth1:1 192.168.1.101 |            |               |
> +----------------------+            +---------------+
>
>
> iptables --append OUTPUT --table mangle --jump MARK --set-mark 0x2
> ip rule add fwmark 0x2 table 2
> ip route add 192.168.1.0/24 dev eth1 src 192.168.1.101 table 2
> ip route flush cache
>
>
> telnet 192.168.1.250 ; and tcpdump gives src ip address as 192.168.1.1
>
>
> ip rule add to 192.168.1.250 table 2
> ip route flush cache
>
>
> telnet 192.168.1.250 ; and tcpdump gives src ip address as 192.168.1.101
>
>
>
> are there issues concerning the marking of OUTPUT packets generated on
> the local box that i should be aware of?
>
>
> many, many thanks
>
> charles
>
>
>
>








From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNAT hiding routers behind it
Date: Sat, 7 Aug 2004 08:37:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408070837.38949.Antony@Soft-Solutions.co.uk>
References: <4113BEF9.5090706@parknet.dk> <200408062356.16206.Antony@Soft-Solutions.co.uk> <411443B8.8090202@parknet.dk>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <411443B8.8090202@parknet.dk>
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

On Saturday 07 August 2004 3:51 am, Simon Lodal wrote:

> > My guess is that you have a MASQUERADE rule with no interface specified -
> > so packets get the source address of the firewall whether they're going
> > out or coming in?
>
> masquerading or snat (tried both, no difference):
> root@fw # iptables -t nat -A POSTROUTING -o eth0 -s 10.44.252.2 -j SNAT
> --to-source 10.44.8.10
>
> No other iptables rules are defined yet.
>
> simonl@pc $ traceroute -q1 -I 192.168.1.11
> traceroute to 192.168.1.11 (192.168.1.11), 30 hops max, 38 byte packets
>   1  10.44.252.1 (10.44.252.1)  4.297 ms
>   2  10.44.8.1 (10.44.8.1)  3.892 ms
>   3  192.168.44.1 (192.168.44.1)  4.826 ms
>   4  192.168.1.11 (192.168.1.11)  5.095 ms
>
> All good. Now for the fun (dnat to another host at similar distance):
> root@fw # iptables -t nat -A PREROUTING -i vmnet2 -s 10.44.252.2 -d
> 192.168.1.11 -j DNAT --to-destination 192.168.2.11
>
> simonl@pc $ traceroute -q1 -I 192.168.1.11
> traceroute to 192.168.1.11 (192.168.1.11), 30 hops max, 38 byte packets
>   1  10.44.252.1 (10.44.252.1)  1.854 ms
>   2  192.168.1.11 (192.168.1.11)  9.378 ms
>   3  192.168.1.11 (192.168.1.11)  17.237 ms
>   4  192.168.1.11 (192.168.1.11)  3.783 ms
>
> See?

Yes.   Strange.   I think I'd like to see the output of "traceroute -q1 -I 
192.168.2.11" (with or without the DNAT rule, shouldn't make any difference).

Also, can you put a packet sniffer such as ethereal on the link 10.44.8.10 - 
10.44.8.1 to see what packets are really leaving your firewall to the rest of 
the network?

Regards,

Antony.

-- 
"Reports that say that something hasn't happened are always interesting to me, 
because as we know, there are known knowns; there are things we know we know. 
We also know there are known unknowns; that is to say we know there are some 
things we do not know. But there are also unknown unknowns - the ones we 
don't know we don't know."

 - Donald Rumsfeld, US Secretary of Defence

                                                     Please reply to the list;
                                                           please don't CC me.



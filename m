From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: NETMAP nat target and strange traceroutes
Date: Wed, 30 Jun 2004 14:39:16 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406301421210.25868-100000@blackhole.kfki.hu>
References: <Pine.GSU.4.58.0406291347340.29256@adore.lightlink.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.GSU.4.58.0406291347340.29256@adore.lightlink.com>
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
To: Nick Taylor <nickt@lightlink.com>
Cc: netfilter@lists.netfilter.org

Hi Nick,

On Tue, 29 Jun 2004, Nick Taylor wrote:

[...]
> T3
> ---------> bond0 ---------> bond0rp ------> rp2 ----> customer
>        eth0    eth1      eth0     eth1
>
> bond0 has the following rules as a sample:
>
> iptables -t nat -A PREROUTING -d 216.7.11.208/28 -j NETMAP --to 10.23.18.0/28
> iptables -t nat -A POSTROUTING -s 10.23.18.0/28 -j NETMAP --to 216.7.11.208/28
>
> and bond0rp has the following for a complementary ruleset:
>
> iptables -t nat -A POSTROUTING -s 216.7.11.208/28 -j NETMAP --to 10.23.18.0/28
> iptables -t nat -A PREROUTING -d 10.23.18.0/28 -j NETMAP --to 216.7.11.208/28
>
> Now, this seems to work.  I can ping the machines behind my kludge, and I
> can pass data back and forth, at least for ftp and http.  However, if I do
> a traceroute from a machine which lives near bond0, I get the following
> very strange output:
>
> redhat/root: traceroute -n 216.7.11.209
> traceroute to 216.7.11.209 (216.7.11.209), 30 hops max, 40 byte packets
>  1  205.232.34.3  2.002 ms  1.62 ms  2.027 ms
>  2  207.127.235.1  3.679 ms  1.85 ms  3.426 ms
>  3  207.127.235.40  4.402 ms  5.382 ms  3.27 ms
>  4  216.7.11.209  3.616 ms  2.978 ms  13.848 ms
>  5  216.7.11.209  5.368 ms  23.634 ms  11.483 ms
>  6  207.127.233.33  34.556 ms  29.082 ms  20.548 ms
>  7  216.7.11.209  6.244 ms  6.158 ms  5.818 ms
>  8  216.7.11.209  8.091 ms *  9.082 ms
>
>
> ?!?!
>
> hops 4, 5, and 7 are driving me crazy!  I can only guess that the
> connection tracking is grabing hold of my nat, and somehow reverse mapping
> "automatically", but I can't figure out what I did wrong to deserve
> exactly that behaviour...

That's due to an unresolved minor problem in netfilter, which is hard
(or impossible) to fix without modifying the underlying IP stack. (You can
find long threads on it in the netfilter-devel archive).

The traceroute probe packets are specifically targeted UDP packets with
increasing TTL field values. When such a packet with TTL=1 reaches bond0,
the appropriate conntrack entry is prepared, NAT rule is attached to it -
and then the packet is dropped by the kernel, without leaving the stack.
Consequently the conntrack entry is destroyed, without adding it to the
conntrack hash table. Thus when the ICMP reply packet is sent by the
stack, conntrack cannot find the conntrack entry (with the NAT rule) to
which it really belongs to and treats it as a normal packet by looking up
a matching NAT rule, etc, etc.

Please note, the ICMP packets replying the traceroute packets going past
the firewall are handled properly. Just the traceroute packets hitting the
firewall itself, which are not.

Either accept it and ignore the problem or create special rules to handle
those packets.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary




From: "Jee J.Z." <jz105@york.ac.uk>
Subject: Re: chains in the same table
Date: Fri, 7 May 2004 15:01:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004601c4343b$da3a38a0$68892090@grouse>
References: <004c01c4334f$3f1329f0$cb0210ac@jz105><200405061147.35201.Antony@Soft-Solutions.co.uk><006001c433bd$3b278de0$68892090@grouse> <16539.37073.149335.706385@saint.heaven.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi Daniel, Antony and Dick,

You are quite right. I got things wrong and I understand now. Thank you for
your explainations.

Regards,
Jee

> Jee J.Z. writes:
> > I put the following rules on the PC2:
> >
> > iptables -F
> > iptables -F -t nat
> > iptables -I FORWARD -j QUEUE
> > iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to global_ip_2
> > iptables -t nat -A PREROUTING -i eth0 -j DNAT --to 192.168.0.2
> >
> > echo '1' >/proc/sys/net/ipv4/ip_forward
> >
> > Since I didn't put in the rules like "iptables -P INPUT DROP" and
> > "iptables -P OUTPUT DROP", I expect traffics that addressed to PC2 will
not
> > be passed on to the FORWARD chain, and therefore they will not be queued
to
> > userspace. However, it seems not the case. When I ftp or ping from PC1
to
> > PC2 (addressed to PC2), all the packets are queued to userspace and if
> > accepted from userspace are then DNATed to PC3. Could you explain this
to
> > me? Or am I missing something obvious?
>
> You have the order wrong.  Of the tables you add rules to, your packet
> hits the nat PREROUTING chain first.  In that chain your packet to PC2
> gets DNAT'd to 192.168.0.2 and is then no longer a packet to PC2, so
> routing sends it to the FORWARD chain.
>
> A way to help avoid mistakes is to fill tables in the order in which
> packets see them:
>
> iptables -t nat -A PREROUTING -i eth0 -j DNAT --to 192.168.0.2
> (routing happens here)
> iptables -I FORWARD -j QUEUE
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to global_ip_2
>
> These rules unconditionally DNAT all packets to 192.168.0.2, so they
> all go to the FORWARD chain and your QUEUE.  You can avoid having
> packets sent to PC2 from reaching your QUEUE simply by selecting
> against them in your DNAT rule:
>
> iptables -t nat -A PREROUTING -i eth0 ! -d global_ip_2 -j DNAT --to
192.168.0.2
>
> Then packets to PC2 will remain packets to PC2 and routing will send
> them to the INPUT chain rather than the FORWARD chain.
>
> --
> Dick St.Peters, stpeters@NetHeaven.com
>



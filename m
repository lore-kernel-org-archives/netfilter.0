From: "Jee J.Z." <jz105@york.ac.uk>
Subject: Re: chains in the same table
Date: Thu, 6 May 2004 23:55:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006001c433bd$3b278de0$68892090@grouse>
References: <004c01c4334f$3f1329f0$cb0210ac@jz105> <200405061147.35201.Antony@Soft-Solutions.co.uk>
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

Hi Antony, Amit, Frank, and Klemen,

Thank you all for your replies. Your answer actually is what I was expected.
However, I did an experiment which seems to show it is not the case, and
therefore I got confused.

My network structure is as follows:

 PC1
 (eth0:global_ip_1)
   |
   |
 (eth0:global_ip_2)
 PC2
 (eth1:192.168.0.1)
   |
   |
 (eth1:192.168.0.2)
 PC3

I put the following rules on the PC2:

iptables -F
iptables -F -t nat
iptables -I FORWARD -j QUEUE
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to global_ip_2
iptables -t nat -A PREROUTING -i eth0 -j DNAT --to 192.168.0.2

echo '1' >/proc/sys/net/ipv4/ip_forward

Since I didn't put in the rules like "iptables -P INPUT DROP" and
"iptables -P OUTPUT DROP", I expect traffics that addressed to PC2 will not
be passed on to the FORWARD chain, and therefore they will not be queued to
userspace. However, it seems not the case. When I ftp or ping from PC1 to
PC2 (addressed to PC2), all the packets are queued to userspace and if
accepted from userspace are then DNATed to PC3. Could you explain this to
me? Or am I missing something obvious?

Cheers,
Jee


> On Thursday 06 May 2004 10:48 am, Jee J.Z. wrote:
>
> > Hi all,
> >
> > I'm asking a basic question that in the same table (for example, the
filter
> > table), if a packet hit the INPUT chain while no rules are in the INPUT
> > chain and the default policy is ACCEPT, will the packet be passed on to
the
> > FORWARD chain? If accepted again, be passed on to the OUTPUT chain?
>
> Any single packet only traverses one of the above chains.
>
> If it's addressed *to* the machine, it goes through INPUT only.
>
> If it's addressed *from* the machine, it goes through OUTPUT only.
>
> If it's going *from* somewhere else *to* somewhere else (ie: being
routed), it
> goes through FORWARD only.
>
> (I guess there's an exception that loopback packets will go through both
> OUTPUT and INPUT, but that's unusual.)
>
> Regards,
>
> Antony.
>
> -- 
> Ramdisk is not an installation procedure.
>
>                                                      Please reply to the
list;
>                                                            please don't CC
me.
>
>
>



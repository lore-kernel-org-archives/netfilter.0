From: "Jee J.Z." <jz105@york.ac.uk>
Subject: Re: icmp echo reply && FORWARD chain
Date: Sun, 2 May 2004 16:29:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007b01c4305a$34258300$68892090@grouse>
References: <006701c43051$39130ad0$68892090@grouse> <200405021546.51594.Antony@Soft-Solutions.co.uk>
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

Hi Antony,

Sorry for the confusion.

> On Sunday 02 May 2004 3:24 pm, Jee J.Z. wrote:
>
> > Hi all,
> >
> > My rules on a gateway linux box (PC2) are set as follows:
> >
> > Internet(PC1 and so
on)-----------(eth0:global_ip)-PC2-(eth1:192.168.0.1)-------------Internal
> > networks(PC3(192.168.0.2) and so on...)
> >
> > iptables -F
> > iptables -F -t nat
> > iptables -I FORWARD -j QUEUE
> > iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to global_ip
> > iptables -t nat -A PREROUTING -i eth1 -j DNAT --to 192.168.0.2
>
> That is a weird-looking rule.   Where does IP 192.168.0.2 exist on the
above
> diagram?

It's the internal IP of PC3. I modified the diagram a little bit. Thank you.

Jee


> > ICMP echo request packets from PC1 or PC3 to PC2 can be caught by the
> > FORWARD chain queuing to userspace, however, ICMP echo reply (in
response
> > to ping request from PC2) packets from PC1 or PC3 to PC2 will be ignored
by
> > the FORWARD chain. Is this a reasonable phenomenon? Could anyone tell me
> > the reasons? Thanks a lot in advance!
> >
> > Cheers,
> > Jee
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



From: "David Leangen" <netfilter@leangen.net>
Subject: RE: Tracking down the source of proxy problem
Date: Mon, 1 May 2006 21:52:44 +0900
Message-ID: <DGEJKHJNFFKAGKLEMOPJIEAPCBAA.netfilter@leangen.net>
References: <002e01c66d19$d01d7800$0101000a@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002e01c66d19$d01d7800$0101000a@sterenborg.info>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Rob,

Thank you!

Your ideas helped me find the source of the problem.

Many, many thanks!!
Dave



> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org 
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Rob Sterenborg
> Sent: 1 May 2006 21:22
> To: netfilter@lists.netfilter.org
> Subject: RE: Tracking down the source of proxy problem
> 
> 
> >>> firewall iptables (in port number edited):
> >>> 
> >>>   *nat
> >>>   :PREROUTING ACCEPT [0:0]
> >>>   :POSTROUTING ACCEPT [0:0]
> >>>   :OUTPUT ACCEPT [0:0]
> >>>   -A PREROUTING -p tcp --dport ##INPORT## -j DNAT --to
> >>> 192.168.2.10:5432 
> >>>   -A PREROUTING -p udp --dport ##INPORT## -j DNAT --to
> >>> 192.168.2.10:5432 
> >>>   -A POSTROUTING -o ppp0 -j MASQUERADE
> >>>   COMMIT
> >> 
> >> These are only NAT rules. What about the FORWARD rules ?
> > 
> > Sorry, left them out because I didn't think they were relevant...
> > here they are (SOME_PORT means that there are similar lines for
> > various ports... but none are 5432 or related to Postgres, since this
> > proxy machine does not host the DB):
> > 
> > *filter
> >> INPUT DROP [0:0]
> >> FORWARD ACCEPT [0:0]
> 
> So you have policy ACCEPT and no rules in the FORWARD chain. The
> Postgres box should be receiving the NAT-ed packets.
> - Have you enabled forwarding ?
>   (echo 1 > /proc/sys/net/ipv4/ip_forward)
> - Did you check routing on both boxes ?
>   (Are packets routed to the Postgres box and are reply packets routed
> back to the firewall.)
> - Maybe you can add some LOG rules on both boxes to see something in
> syslog.
>   (Firewall: FORWARD chain, Postgress: INPUT chain)
> - Check with tcpdump (et al) on the Postgres box if any packets that you
> expect actually arrive.
> 
> 
> Gr,
> Rob
> 
> 
> 


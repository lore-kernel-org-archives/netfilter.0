From: Marek Zachara <marek.zachara@conexe.pl>
Subject: Re: NAT/POSTROUTING rules doesn't match packets
Date: Fri, 7 Oct 2005 21:33:37 +0200
Message-ID: <200510072133.37280.marek.zachara@conexe.pl>
References: <20051004070925.7E2783C65565@mailgate.informatik.haw-hamburg.de>
	<200510071407.58851.marek.zachara@conexe.pl>
	<Pine.LNX.4.61.0510072013130.17798@filer.marasystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510072013130.17798@filer.marasystems.com>
Content-Disposition: inline
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

On Friday 07 of October 2005 20:16, you wrote:
> On Fri, 7 Oct 2005, Marek Zachara wrote:
> > here is the conntrack entry:
> > irongate:~# cat /proc/net/ip_conntrack |grep 4569
> > udp      17 28 src=10.0.0.250 dst=83.16.54.250 sport=4569 dport=4569
> > [UNREPLIED] src=83.16.54.250 dst=10.0.0.250 sport=4569 dport=4569 use=1
>
> This connection is not NAT:ed..
>
> > the counter at iptables got only 8 packets, but the router has been up
> > for about 6 hours and these packets are being sent every few seconds:
> >
> > Chain POSTROUTING (policy ACCEPT 73434 packets, 3691K bytes)
> > pkts bytes target     prot opt in     out     source             
> > destination 8   704 SNAT       udp  --  *      eth1    0.0.0.0/0         
> >   0.0.0.0/0 udp dpt:4569 to:192.168.100.1
>
> And you are positively sure the data stream was not known to conntrack
> before you added the NAT rule?
>
> Unfortunately it is impossible to tell from an conntrack when it was
> created, and since this application is used fixed port numbers once the
> connection gets into conntrack it's very likely the conntrack may have
> been around for quite some time.. Unlike most client traffic where new
> source ports is selected in each connection attemt, making them classify
> as new conntrack entries.
>
Well, the router startup procedure is like this: 
1) boot up core system (eth0 built-in kernel and enabled as the router root is 
on nfs via eth0)
2) set up iptables rules
3) bring up eth1

so before step (3) any packets destined to internet shall be returned with 
'destination unreachable'. But i don't know if this could create the contrack 
entry. the IAX udp packets are being sent all the time, even before the 
router boots up - so its very likely such packet may hit the router before 
netfilter (and SNAT) is configured.
But from what i understand, the UDP NAT shall refresh every 180 seconds (?) so 
after 3 minutes the packets shall be nat-ed correctly. But maybe if there is 
a constant flow of packets it can sustain the contrack entry? But how to 
explain then that the rule has been hit 8 times within 6 hours? As far as i 
understand once this rule is hit, it shall then start to NAT packets 
correctly...?

Marek

P.S. Please let me know if you want me to set up some special test procedure 
to troubleshoot this issue.








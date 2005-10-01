From: Marek Zachara <marek.zachara@conexe.pl>
Subject: Re: NAT/POSTROUTING rules doesn't match packets
Date: Sat, 1 Oct 2005 21:31:32 +0200
Message-ID: <200510012131.32524.marek.zachara@conexe.pl>
References: <200510011806.52191.marek.zachara@conexe.pl>
	<200510012003.35387.marek.zachara@conexe.pl>
	<Pine.LNX.4.61.0510012011230.17163@filer.marasystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510012011230.17163@filer.marasystems.com>
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

On Saturday 01 of October 2005 20:18, you wrote:
> On Sat, 1 Oct 2005, Marek Zachara wrote:
> > irongate:~# tcpdump -ni eth1 udp port 4569
> > tcpdump: verbose output suppressed, use -v or -vv for full protocol
> > decode listening on eth1, link-type EN10MB (Ethernet), capture size 96
> > bytes 19:56:41.784463 IP 10.0.0.250.4569 > 84.16.64.240.4569: UDP,
> > length: 25 19:56:43.785641 IP 10.0.0.250.4569 > 84.16.64.240.4569: UDP,
> > length: 25
>
> Odd..
>
> > Any suggestions what i could be doing wrong?
>
> What does /proc/net/ip_conntrack say about the session?
>
>    grep 84.16.64.240 /proc/net/ip_conntrack
>
here is the entry:

udp      17 23 src=10.0.0.250 dst=84.16.64.240 sport=4569 dport=4569 
packets=13426 bytes=581092 [UNREPLIED] src=84.16.64.240 dst=10.0.0.250 
sport=4569 dport=4569 packets=0 bytes=0 mark=0 use=1

>
> And what timeouts is your kernel configured with?
>
>    cat /proc/sys/net/ipv4/netfilter/conntrack_udp_timeout
>    cat /proc/sys/net/ipv4/netfilter/conntrack_udp_timeout_stream
>
irongate:~# cat /proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout
30
irongate:~# cat /proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout_stream
180

but still the packets dont get SNAT-ed:

irongate:~# tcpdump -ni eth0 udp port 4569
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
21:26:22.239340 IP 10.0.0.250.4569 > 84.16.64.240.4569: UDP, length: 12

and the nat/POSTROUTING rule has been hit only once since router reboot approx 
2 hrs ago (the asterisk keeps sending about 1packet/5seconds) :

Chain POSTROUTING (policy ACCEPT 20148 packets, 1036K bytes)
 pkts bytes target     prot opt in     out     source               
destination
    1    53 SNAT       udp  --  *      eth1    0.0.0.0/0            0.0.0.0/0           
udp dpt:4569 to:192.168.100.1


any hints? :)

Marek




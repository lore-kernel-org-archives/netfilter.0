From: Frank Gruellich <frank@der-frank.org>
Subject: Re: Strange Entry
Date: Mon, 13 Jun 2005 15:09:15 +0200
Message-ID: <20050613130915.GH5254@der-frank.org>
References: <39745.82.152.178.234.1118493310.squirrel@webmail.*>
	<20050611143858.GG5254@der-frank.org>
	<15604.212.100.225.55.1118652269.squirrel@webmail.*>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <15604.212.100.225.55.1118652269.squirrel@webmail.*>
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
Content-Transfer-Encoding: 7bit
To: Jimmy <squid@oranged.to>
Cc: netfilter@lists.netfilter.org

* Jimmy <squid@oranged.to> 13. Jun 05:
> Hello Frank,

Hi,

*grmpf*  Please do NOT:
 + send me private mails,
 + top post,
 + wrap outputs.

And do:
 + post your network topology.  (I can do some brave guesses at this
   point: you have a single host with eth0 the external interface?)

> Chain INPUT (policy DROP 6037 packets, 716K bytes)
>  pkts bytes target     prot opt in     out     source              
> destination
>  192K   46M ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
>   531 40356 ACCEPT     icmp --  eth0   *       10.2.96.0/24         212.100.249.100
> 18624 1366K ACCEPT     tcp  --  eth0   *       0.0.0.0/0            212.100.249.100     tcp spts:1024:65535 dpt:768
> 12340  619K ACCEPT     tcp  --  eth0   *       0.0.0.0/0            212.100.249.100     tcp spts:1024:65535 flags:0x16/0x02 multiport dports 25,53,80,110,143

You're accepting incomming TCP connections to port 25 at eth0.

>   417 21204 ACCEPT     tcp  --  eth0   *       0.0.0.0/0            212.100.249.101     multiport dports 21,53,80,443 tcp flags:0x16/0x02
>     4   289 ACCEPT     udp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           udp dpt:53
> 32956 5392K ACCEPT     udp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           udp spt:53
>  129K   19M ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
>  6037  716K LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 4
>  6037  716K LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 4 prefix `Dropped: '
> 
> Chain OUTPUT (policy DROP 49 packets, 3499 bytes)
>  pkts bytes target     prot opt in     out     source              
> destination
>  192K   46M ACCEPT     all  --  *      lo      0.0.0.0/0            0.0.0.0/0
>   531 40356 ACCEPT     icmp --  *      *       0.0.0.0/0            10.2.96.0/24
>   888  154K ACCEPT     tcp  --  *      eth0    0.0.0.0/0            0.0.0.0/0           multiport dports 21,22,25,53,43,80,110,143,443,6667,6668

And you accept any outgoing TCP connection to eth0 at port 25.

>     3   436 ACCEPT     udp  --  *      eth0    212.100.249.100      0.0.0.0/0           udp spt:53
>     1   161 ACCEPT     udp  --  *      eth0    212.100.249.101      0.0.0.0/0           udp spt:53
> 33490 2732K ACCEPT     udp  --  *      eth0    0.0.0.0/0            0.0.0.0/0           multiport dports 53
>  187K  117M ACCEPT     tcp  --  *      eth0    0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED

And you accept all RELATED traffic throug eth0.

>    49  3499 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 4
>    49  3499 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 4 prefix `Dropped Out Rule: '
> 
> Any help would be greatly appreciated.

From this point of view you shoudn't have these log messages.  These
packets would be ACCEPTed due to the RELATED match.  Your logged FIN
packet could not be set in relation to an existing connections and so
missed the RELATED rule somehow.  Once I had similar problems with a
squid: it seemed it always closed connections two times.  I never had a
detailed view at this phenomenon, but it looked similar to this.

HTH,
 Gruss vom Frank.
-- 
Sigmentation fault


From: BERTRAND =?iso-8859-1?Q?Jo=EBl?= <mt1@systella.fr>
Subject: Re: ROUTE target and --continue
Date: Tue, 22 Feb 2005 15:33:54 +0100
Message-ID: <20050222143354.GB17957@rayleigh.systella.fr>
References: <20050222105012.GA16180@rayleigh.systella.fr>
	<1109082245.6098.7.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1109082245.6098.7.camel@hubcap.ljm.dom>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

On Tue, Feb 22, 2005 at 09:24:05AM -0500, Jason Opperisano wrote:
>   iptables -t mangle -vnxL && iptables -t nat -vnxL && iptables -vnxL

	It's done ;-)

Root kant:[~] > iptables -t mangle -vnxL && iptables -t nat -vnxL &&
iptables -vnxL
Chain PREROUTING (policy ACCEPT 6735 packets, 3908450 bytes)
    pkts      bytes target     prot opt in     out     source destination
0        0 ROUTE      tcp  --  *      *       192.168.0.130
0.0.0.0/0           tcp spts:3000:3001 ROUTE oif:eth2 gw:192.168.1.254

Chain INPUT (policy ACCEPT 2664 packets, 560583 bytes)
    pkts      bytes target     prot opt in     out     source destination         

Chain FORWARD (policy ACCEPT 4015 packets, 3328763 bytes)
    pkts      bytes target     prot opt in     out     source destination         

Chain OUTPUT (policy ACCEPT 2546 packets, 1141725 bytes)
    pkts      bytes target     prot opt in     out     source destination         

Chain POSTROUTING (policy ACCEPT 6565 packets, 4471478 bytes)
    pkts      bytes target     prot opt in     out     source destination         
Chain PREROUTING (policy ACCEPT 205 packets, 31745 bytes)
    pkts      bytes target     prot opt in     out     source destination         
       0        0 DNAT       tcp  --  *      *       0.0.0.0/0 192.168.254.1       tcp dpt:8000 to:192.168.0.130:8080 
       7      420 DNAT       tcp  --  *      *       0.0.0.0/0 192.168.1.1         tcp dpt:3000 to:192.168.0.130:3000 
       0        0 DNAT       tcp  --  *      *       0.0.0.0/0 192.168.1.1         tcp dpt:3001 to:192.168.0.130:3001 
       0        0 DNAT       tcp  --  *      *       0.0.0.0/0 192.168.254.1       tcp dpt:2200 to:192.168.0.130:22 

Chain POSTROUTING (policy ACCEPT 39 packets, 3275 bytes)
    pkts      bytes target     prot opt in     out     source destination         
       0        0 MASQUERADE  all  --  *      eth2    192.168.0.0/24 0.0.0.0/0           
      47     2256 MASQUERADE  all  --  *      eth0    192.168.0.0/24 0.0.0.0/0           

Chain OUTPUT (policy ACCEPT 32 packets, 2855 bytes)
    pkts      bytes target     prot opt in     out     source destination         
Chain INPUT (policy DROP 52 packets, 6985 bytes)
    pkts      bytes target     prot opt in     out     source destination         
     239   244345 ACCEPT     all  --  lo     *       0.0.0.0/0 0.0.0.0/0           
    2367   307229 ACCEPT     all  --  *      *       0.0.0.0/0 192.168.254.1       
       6     2024 ACCEPT     all  --  *      *       0.0.0.0/0 192.168.0.128       
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0 192.168.1.1         tcp dpt:22 
       0        0 ACCEPT     all  --  *      *       192.168.1.254 0.0.0.0/0           

Chain FORWARD (policy ACCEPT 4015 packets, 3328763 bytes)
    pkts      bytes target     prot opt in     out     source destination         

Chain OUTPUT (policy ACCEPT 2547 packets, 1141873 bytes)
    pkts      bytes target     prot opt in     out     source destination         

	Regards,

	JKB


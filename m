From: Sebastian Docktor <sebi@tux-labor.de>
Subject: Re: Multi source/destination ip address
Date: Mon, 21 Feb 2005 19:05:01 +0100
Message-ID: <20050221180501.GA31847@gw.home.tux-labor.de>
References: <200502211533.19645.marcin.giedz@eulerhermes.pl>
	<1109001593.12544.2.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1109001593.12544.2.camel@nostromo.bgsecm.com>
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
To: netfilter@lists.netfilter.org

Hi,



On Mon, Feb 21, 2005 at 04:59:53PM +0100, Jose Maria Lopez Hernandez wrote:
> El lun, 21-02-2005 a las 15:33 +0100, Marcin Giedz escribi??:
> > Hello...
> > 
> 
> iptables -N MYDROPCHAIN
> iptables -A FORWARD -p tcp -port 80 -j MYDROPCHAIN
> iptables -A MYDROPCHAIN -d 192.168.131.0/24 -j RETURN
> iptables -A MYDROPCHAIN -d 192.168.110.0/24 -j RETURN
> iptables -A MYDROPCHAIN -j DROP
>

Do I really need the -j RETURN Target, an the -j DROP Target in the Chain?
Because I am using also User defined Chainces, and I am only using
chainces without -j DROP only with -j ACCEPT  and I don't use the -j
RETURN Target.


Chain OUTPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source destination         
40101 8406K ACCEPT     all  --  *      *       0.0.0.0/0 0.0.0.0/0           state RELATED,ESTABLISHED 
 2908  265K ping_TRNW  all  --  *      *       0.0.0.0/0 0.0.0.0/0           
 2895  265K all_tcp_ins_inet  all  --  *      *       0.0.0.0/0 0.0.0.0/0           
 2340  231K all_udp_ins_inet  all  --  *      *       0.0.0.0/0 0.0.0.0/0           
 1007  134K ping_to_inet  all  --  *      *       0.0.0.0/0 0.0.0.0/0           
 1005  134K lo_tcp_out  all  --  *      *       0.0.0.0/0 0.0.0.0/0           
  974  132K lo_udp_out  all  --  *      *       0.0.0.0/0 0.0.0.0/0           
  872  124K LOG        all  --  *      *       0.0.0.0/0 0.0.0.0/0           LOG flags 0 level 4 prefix `OUTPUT-DENY  ' 
  872  124K REJECT     all  --  *      *       0.0.0.0/0 0.0.0.0/0           reject-with icmp-port-unreachable 

Chain all_tcp_ins_inet (1 references)
 pkts bytes target     prot opt in     out     source	destination         
  555 33300 ACCEPT     tcp  --  *      ppp0    0.0.0.0/0	0.0.0.0/0           state NEW tcp 

Chain all_udp_ins_inet (1 references)
 pkts bytes target     prot opt in     out     source	destination         
 1333 97563 ACCEPT     udp  --  *      ppp0    0.0.0.0/0	0.0.0.0/0           state NEW udp 



> Regards.
> 
> -- 
> 
> Jose Maria Lopez Hernandez
> Director Tecnico de bgSEC
> jkerouac@bgsec.com
> bgSEC Seguridad y Consultoria de Sistemas Informaticos
> http://www.bgsec.com
> ESPA??A
> 
> The only people for me are the mad ones -- the ones who are mad to live,
> mad to talk, mad to be saved, desirous of everything at the same time,
> the ones who never yawn or say a commonplace thing, but burn, burn, burn
> like fabulous yellow Roman candles.
>                 -- Jack Kerouac, "On the Road"
> 
> 
> 

-- 
Sebastian Docktor <sebi@tux-labor.de>


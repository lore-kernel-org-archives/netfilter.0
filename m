From: Esteban <eribicic@sinectis.com>
Subject: Re: fwmarks
Date: 01 Mar 2003 21:00:56 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046563256.1685.76.camel@debian>
References: <Pine.LNX.4.30.0303020011020.24077-100000@king.klan.gda.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.30.0303020011020.24077-100000@king.klan.gda.pl>
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
To: Tomasz Wrona <lartc@eter.tym.pl>
Cc: netfilter@lists.netfilter.org

ive tryed and so on..

root@debian:~# find /proc/ -type f -iname "rp_filter"  -exec cat {} \;
0
0
0
0
0
root@debian:

it doesnt work!..
i see the accounting of paquets in iptables, so marking is working..

root@debian:~# ip route ls
172.0.0.0/24 dev eth0  proto kernel  scope link  src 172.0.0.82 
172.0.0.0/24 dev eth1  proto kernel  scope link  src 172.0.0.81 
default via 172.0.0.1 dev eth0 

but they keep on using the default route! (eth0) and not eth1!

root@debian:~# ip rule ls
0:      from all lookup local 
32761:  from all fwmark        2 lookup eth1 
32762:  from all fwmark        2 lookup eth1 
32763:  from all fwmark        d lookup eth1 
32764:  from all fwmark       13 lookup eth1 
32765:  from all to 198.133.219.25 lookup eth1 
32766:  from all lookup main 
32767:  from all lookup default 
root@debian:~# 
root@debian:~# ip route ls table eth1
172.0.0.1 dev eth1  scope link  src 172.0.0.81 
default via 172.0.0.1 dev eth1  src 172.0.0.81 
root@debian:~# 
root@debian:~#  iptables -t mangle -L -n -v
Chain PREROUTING (policy ACCEPT 11811 packets, 5080K bytes)
 pkts bytes target     prot opt in     out     source              
destination         
Chain INPUT (policy ACCEPT 10043 packets, 4859K bytes)
 pkts bytes target     prot opt in     out     source              
destination         
Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source              
destination         
Chain OUTPUT (policy ACCEPT 8362 packets, 1812K bytes)
 pkts bytes target     prot opt in     out     source              
destination         
  120  6287 MARK       tcp  --  *      *       0.0.0.0/0           
0.0.0.0/0          tcp dpt:80 MARK set 0x2 
  261 12430 MARK       tcp  --  *      *       0.0.0.0/0           
0.0.0.0/0          tcp dpt:110 MARK set 0xd 
Chain POSTROUTING (policy ACCEPT 8542 packets, 1832K bytes)
 pkts bytes target     prot opt in     out     source              
destination         
root@debian:~# 


thanks for helping me!! any idea?? 

On Sat, 2003-03-01 at 20:13, Tomasz Wrona wrote:
> On 1 Mar 2003, Esteban wrote:
> 
> > and then
> > echo 201 www.out >> /etc/iproute2/rt_tables
> > ip rule add fwmark 2 table www.out
> > ip route add default gw via 1.1.1.1 dev ppp0
> > ip route flush cache
> >
> > and does not work!.
> > if i create a rule like
> > ip rule add to 2.2.2.2 table www.out
> > ip route flush cache
> >
> > that does work!..
> 
> Set [I guess location but key is to turn of rpfilter when using
> policyrouting via fwmark]:
> echo "0" > /proc/sys/net/ipv4/conf/ppp0/rp_filter
> 
> Regards
> tw
> -- 
> 
> ----------------
>  ck.eter.tym.pl
> 
> "Never let shooling disturb Your education"
> 
> 




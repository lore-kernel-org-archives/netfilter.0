From: Martin <mylists@itcom.com.ar>
Subject: Re: load balance [OT?]
Date: Wed, 04 Jun 2008 10:06:55 -0300
Message-ID: <1212584815.2539.19001.camel@kr0sty.1.com.ar>
References: <1212434787.2539.16326.camel@kr0sty.1.com.ar>
	 <44140.84.123.239.190.1212532030.squirrel@www.arcoscom.com>
Reply-To: mylists@itcom.com.ar
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <44140.84.123.239.190.1212532030.squirrel@www.arcoscom.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux@arcoscom.com
Cc: netfilter@vger.kernel.org


On Wed, 2008-06-04 at 00:27 +0200, ArcosCom Linux User wrote:
> I was using the patch you commented along this thread but it overloads the
> routing tables.
> 
> Now I have this configuration:
> === REGLAS IPTABLES PARA EL ENRUTADO ===
> Chain PREROUTING (policy ACCEPT 21M packets, 16G bytes)
> num   pkts bytes target     prot opt in     out     source              
> destination
> 1      14M   11G M_TRAF_IN  all  --  *      *       0.0.0.0/0           
> 0.0.0.0/0
> 2      13M   10G M_IFACE    all  --  *      *       0.0.0.0/0           
> 0.0.0.0/0
> Chain M_IFACE (1 references)
> num   pkts bytes target     prot opt in     out     source              
> destination
> 1      12M 8196M CONNMARK   all  --  *      *       0.0.0.0/0           
> 0.0.0.0/0           MARK match 0x0/0xf000 CONNMARK restore
> 2    2581K 2331M RETURN     all  --  *      *       0.0.0.0/0           
> 0.0.0.0/0           MARK match !0x0/0xf000
> 3      11M 8158M M_IFACE_TRAF  all  --  *      *       0.0.0.0/0          
>  0.0.0.0/0           MARK match 0x0/0xf000
> 4    40242 2284K MARK       all  --  eth2   *       0.0.0.0/0           
> 0.0.0.0/0           MARK match 0x0/0xf000 state NEW MARK or 0x2000
> 5    40342 2381K MARK       all  --  eth3   *       0.0.0.0/0           
> 0.0.0.0/0           MARK match 0x0/0xf000 state NEW MARK or 0x8000
> 6    80584 4665K CONNMARK   all  --  *      *       0.0.0.0/0           
> 0.0.0.0/0           MARK match !0x0/0xf000 CONNMARK save
> 7      11M 8158M RETURN     all  --  *      *       0.0.0.0/0           
> 0.0.0.0/0
> Chain M_IFACE_TRAF (2 references)
> num   pkts bytes target     prot opt in     out     source              
> destination
> Chain FORWARD (policy ACCEPT 3292K packets, 1985M bytes)
> num   pkts bytes target     prot opt in     out     source              
> destination
> 1    1618K 1046M M_IFACE_OUT  all  --  *      *       0.0.0.0/0           
> 0.0.0.0/0
> Chain OUTPUT (policy ACCEPT 20M packets, 15G bytes)
> num   pkts bytes target     prot opt in     out     source              
> destination
> 1      13M 9867M M_IFACE_OUT  all  --  *      *       0.0.0.0/0           
> 0.0.0.0/0
> Chain M_IFACE_OUT (2 references)
> num   pkts bytes target     prot opt in     out     source              
> destination
> 1      13M 9885M CONNMARK   all  --  *      *       0.0.0.0/0           
> 0.0.0.0/0           MARK match 0x0/0xf000 CONNMARK restore
> 2    2342K 1180M RETURN     all  --  *      *       0.0.0.0/0           
> 0.0.0.0/0           MARK match !0x0/0xf000
> 3      12M 9733M M_IFACE_TRAF  all  --  *      *       0.0.0.0/0          
>  0.0.0.0/0           MARK match 0x0/0xf000
> 4    58815 3592K MARK       all  --  *      eth2    0.0.0.0/0           
> 0.0.0.0/0           MARK match 0x0/0xf000 state NEW MARK or 0x2000
> 5    59337 3615K MARK       all  --  *      eth3    0.0.0.0/0           
> 0.0.0.0/0           MARK match 0x0/0xf000 state NEW MARK or 0x8000
> 6     118K 7207K CONNMARK   all  --  *      *       0.0.0.0/0           
> 0.0.0.0/0           MARK match !0x0/0xf000 CONNMARK save
> 7      12M 9733M RETURN     all  --  *      *       0.0.0.0/0           
> 0.0.0.0/0
> === REGLAS DE ENRUTAMIENTO ===
> 0:      from all lookup local
> 50:     from all lookup main
> 100:    from all fwmark 0x2000/0x2000 lookup uno
> 101:    from all fwmark 0x8000/0x8000 lookup dos
> 150:    from 212.170.103.235 lookup uno
> 151:    from 212.59.210.142 lookup dos
> 200:    from all lookup defecto
> 32766:  from all lookup main
> 32767:  from all lookup default
> === TABLAS DE RUTAS ===
> === MAIN ===
> 212.170.103.192/26 dev eth2  proto kernel  scope link  src 212.170.103.235
> 192.168.3.0/24 dev zlan0  proto kernel  scope link  src 192.168.3.247
> 192.168.2.0/24 dev zlan0  proto kernel  scope link  src 192.168.2.247
> 192.168.1.0/24 dev zlan0  proto kernel  scope link  src 192.168.1.247
> 212.59.210.0/24 dev eth3  proto kernel  scope link  src 212.59.210.142
> 10.1.1.0/24 dev zlan0  proto kernel  scope link  src 10.1.1.6
> === eth2 TABLA 150 ===
> 212.170.103.192/26 dev eth2  scope link  src 212.170.103.235
> default via 212.170.103.193 dev eth2  src 212.170.103.235
> prohibit default  proto static  metric 1
> === eth3 TABLA 151 ===
> 212.59.210.0/24 dev eth3  scope link  src 212.59.210.142
> default via 212.59.210.1 dev eth3  src 212.59.210.142
> prohibit default  proto static  metric 1
> === TABLA 200 (defecto) ===
> default
>         nexthop via 212.170.103.193  dev eth2 weight 1
>         nexthop via 212.59.210.1  dev eth3 weight 1
> 
> 
> 
> Appears to work, but, for now, I'm having problems (last Centos 2.6.18
> kernel).
> 
> I expect this can help you a bit. Be care, I have some problem as you,
> with previous 2.6.18 centos kernel this configuration appeared to works
> fine, but with last 2.6.28 centos kernel I'm having troubles.
> 
> Regards
> 
[..]

Thanks for the advice and details.

I'll be patching -> compiling -> testing all day, so I'll post any
update if I find that the problem is one of those patches.


Cheers and happy birthday to me! :)


Martin


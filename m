From: Alistair Tonner <Alistair@alistairt.ath.cx>
Subject: Re: Internal ip exiting network on firewall external nic despight rule
Date: Fri, 20 Sep 2002 15:53:09 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020920195309.GC31302@Ajftl1.ajfthome.on.ca>
References: <000701c260d9$871a9070$0801a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000701c260d9$871a9070$0801a8c0@s3ac>; from rreid@studio3arc.com on Fri, Sep 20, 2002 at 15:11:30 -0400
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Rowan Reid <rreid@studio3arc.com>
Cc: 'Tom Eastep' <teastep@shorewall.net>, netfilter@lists.netfilter.org



	The question really is what device is on the other end of eth1.
	If this device could concievably misroute an internal packet, 
you
	need to look at the device with ip 192.168.1.105 (if its on 
your network)
	and make sure it hasn't mucked up its default gateway.

	if eth1 is *only* connected to the outside world you should 
just drop
	packets like this as martians... as that is what they are...
	echo 1> /proc/sys/net/ipv4/conf/eth1/log_martians
	will log the packet as just that.
	echo 1> /proc/sys/net/ipv4/conf/eth1/rp_filter 	will make the 
kernel verify the packet by reversed path.
	 
	Personally I have a rule in iptables that simply drops all known
	private segments coming in my outside interface.  period.

On 2002.09.20 15:11 Rowan Reid wrote:
> 
> > Rowan Reid wrote:
> >
> > >
> > > LOG FILE ###
> > > Sep 20 04:04:01 s3a-www kernel: IN=eth1 OUT=eth1 SRC=192.168.1.105
> 
> > > DST=216.99.233.76 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=61116 DF
> > > PROTO=TCP SPT=4380 DPT=110 WI NDOW=8760 RES=0x00 ACK URGP=0
> >
> > Note that IN and OUT both indicate eth1 -- do you perhaps
> > have both NICs
> > connected to the same hub/switch?
> >
> 
> Yes, however my Rules are such that eth1 (External) should regect and
> log external machines with an internal net address.
> # remote interface, claiming to be local machines, IP spoofing, get
> lost
> # $IPTABLES -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j
> drop-and-log-it
> Also all machines are configured such that the internal nic address
> 192.168.1.1 is the only gateway. Me detects a fish! My ifconfig output
> Is below.
> 
> eth0      Link encap:Ethernet  HWaddr 00:04:75:B1:3D:A9
>           inet addr:192.168.1.1  Bcast:192.168.1.255
> Mask:255.255.255.0
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:67496 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:88214 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:5813 txqueuelen:100
>           RX bytes:5334404 (5.0 Mb)  TX bytes:101576923 (96.8 Mb)
>           Interrupt:11 Base address:0x6100
> 
> eth1      Link encap:Ethernet  HWaddr 00:04:75:B1:3D:6C
>           inet addr:**.**.76.66  Bcast:65.45.76.71
> Mask:255.255.255.248
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:51089 errors:0 dropped:0 overruns:1 frame:0
>           TX packets:41940 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:10 txqueuelen:100
>           RX bytes:37129813 (35.4 Mb)  TX bytes:4338695 (4.1 Mb)
>           Interrupt:10 Base address:0x6200
> 
> lo        Link encap:Local Loopback
>           inet addr:127.0.0.1  Mask:255.0.0.0
>           UP LOOPBACK RUNNING  MTU:16436  Metric:1
>           RX packets:13 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:13 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:1374 (1.3 Kb)  TX bytes:1374 (1.3 Kb)
> 
> 
> 



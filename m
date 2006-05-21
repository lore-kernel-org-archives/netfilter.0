From: Antonio Di Bacco <antonio.dibacco@aruba.it>
Subject: Re: PtP not working
Date: Sun, 21 May 2006 14:38:00 +0200
Message-ID: <200605211438.00621.antonio.dibacco@aruba.it>
References: <200605201730.52334.antonio.dibacco@aruba.it>
	<44704D13.3060305@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44704D13.3060305@rtij.nl>
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
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org

Anyway I can have the same MAC address for both boxes on eth0.

On Sunday 21 May 2006 13:20, Martijn Lievaart wrote:
> Antonio Di Bacco wrote:
> >Anyone could explain this?
> >
> >Two linux systems connected:
> >
> >System A     <=========> System B
> >                   eth0                    eth0
> >
> >Each system ha the following config:
> >
> ># routing enabled
> >net.ipv4.ip_forward=1
> >
> >#ethernet with no address associated and NOARP set
> >eth0      Link encap:Ethernet  HWaddr 08:00:3E:26:24:65
> >          UP BROADCAST RUNNING NOARP MULTICAST  MTU:1500  Metric:1
> >          RX packets:1306 errors:0 dropped:0 overruns:0 frame:0
> >          TX packets:1325 errors:0 dropped:0 overruns:0 carrier:0
> >          collisions:0 txqueuelen:1000
> >          RX bytes:732864 (715.6 KiB)  TX bytes:61643 (60.1 KiB)
> >          Base address:0x3c00
> >
> ># Routing table
> >Kernel IP routing table
> >Destination     Gateway         Genmask         Flags Metric Ref    Use
> > Iface 10.10.10.10     *               255.255.255.255 UH    0      0     
> >   0 eth0
> >
> >
> >I'm on System A and try to ping 10.10.10.10 but no answer. Where is the
> >problem?
>
> Which system has 10.10.10.10? None. So how can any system answer? Even
> if there was a 10.10.10.10, you disabled the arp mechanism, so you can
> never find out where it is. Finaly, for the return packets exactly the
> same problem occurs.
>
> If you want to make a point to point connection over ethernet:
> - Either just configure a subnet there.
> - Or:
>   - Assign addresses to the interfaces (can be the same address as
> another interface on the same box)
>   - Create static arp addresses for the other box
>   - Create routes as above for the address of the other box
>
> I think you will still have to enable arp for this to work, in which
> case you can skip the static arp entries.
>
> HTH,
> M4


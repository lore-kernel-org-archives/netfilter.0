From: <netfilter@drbroyles.com>
Subject: Re: iptables or routing problem
Date: Wed, 22 Oct 2003 01:51:15 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00b101c39860$81a06240$73593a42@drbroyles.com>
References: <F22386C3FEB012449238672E38ED61E70A8D76@overlord.overturemedia.com> <008d01c3985f$1526df50$73593a42@drbroyles.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Fritz Mesedilla <fritz.mesedilla@overturemedia.com>
Cc: "[netfilter] Mailing List" <netfilter@lists.netfilter.org>

Fritz,
    Sorry, I forgot to mention that you would need to change the BROADCAST
to 192.168.10.255 and the NETWORK to 192.168.10.0.

Brandon Broyles

----- Original Message -----
From: <netfilter@drbroyles.com>
To: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
Cc: "[netfilter] Mailing List" <netfilter@lists.netfilter.org>
Sent: Wednesday, October 22, 2003 1:41 AM
Subject: Re: iptables or routing problem


> Fritz,
>     Change the IPADDR to be 192.168.10.? and the NETMASK to be
> 255.255.255.0.
>
> Brandon Broyles
>
> ----- Original Message -----
> From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
> To: <netfilter@drbroyles.com>
> Sent: Wednesday, October 22, 2003 1:38 AM
> Subject: RE: iptables or routing problem
>
>
>
> Sorry for being ignorant... but how do I limit the subnet of eth1 to
> 192.168.10.*/24?
>
> here is my current ifcfg-eth1:
> BOOTPROTO=none
> GATEWAY=192.168.10.240
> DEVICE=eth1
> MTU=1500
> NETMASK=255.255.0.0
> BROADCAST=192.168.255.255
> IPADDR=192.168.8.232
> NETWORK=192.168.0.0
> ONBOOT=yes
>
>
> fritz <www.mesedilla.com>
> ---
> + Basta Ikaw Lord
>
>
>
> > -----Original Message-----
> > From: netfilter@drbroyles.com [mailto:netfilter@drbroyles.com]
> > Sent: Wednesday, October 22, 2003 1:33 PM
> > To: Fritz Mesedilla
> > Cc: [netfilter] Mailing List
> > Subject: Re: iptables or routing problem
> >
> >
> > Fritz,
> >     eth1 is getting these packets because the destination MAC
> > address of
> > those packets match eth1's MAC address.  The subnets you have
> > defined for
> > eth0 and eth1 overlap, so you may still be experiencing ARP
> > problems.  Since
> > the default gateway you are using has an IP of 198.168.10.240, might I
> > suggest that you limit the subnet of eth1 to be
> > 198.168.10.*/24?  If you
> > make this change, you should be able to get your ARP problems
> > straitened
> > out.
> >
> > Brandon Broyles
> >
> > ----- Original Message -----
> > From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
> > To: <netfilter@lists.netfilter.org>
> > Sent: Wednesday, October 22, 2003 1:03 AM
> > Subject: iptables or routing problem
> >
> >
> >
> > I dunno if this is a routing problem or my iptables.
> >
> > route:
> > Kernel IP routing table
> > Destination     Gateway         Genmask         Flags Metric
> > Ref    Use
> > Iface
> > 192.168.9.0     *               255.255.255.0   U     0
> > 0        0 eth0
> > 192.168.0.0     *               255.255.0.0     U     0
> > 0        0 eth1
> > 127.0.0.0       *               255.0.0.0       U     0
> > 0        0 lo
> > default         192.168.10.240  0.0.0.0         UG    0
> > 0        0 eth1
> >
> >
> > ifconfig:
> > eth0      Link encap:Ethernet  HWaddr 00:02:55:EE:C3:91
> >           inet addr:192.168.9.1  Bcast:192.168.255.255
> > Mask:255.255.255.0
> >           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
> >           RX packets:377635 errors:0 dropped:0 overruns:0 frame:0
> >           TX packets:7192 errors:0 dropped:0 overruns:0 carrier:0
> >           collisions:0 txqueuelen:100
> >           RX bytes:216836627 (206.7 Mb)  TX bytes:808284 (789.3 Kb)
> >           Interrupt:10 Base address:0xa000
> >
> > eth1      Link encap:Ethernet  HWaddr 00:10:5A:D0:19:16
> >           inet addr:192.168.8.232  Bcast:192.168.255.255
> > Mask:255.255.0.0
> >           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
> >           RX packets:1914380 errors:0 dropped:0 overruns:0 frame:0
> >           TX packets:1522009 errors:0 dropped:0 overruns:0 carrier:1
> >           collisions:2946 txqueuelen:100
> >           RX bytes:480613108 (458.3 Mb)  TX bytes:1246359355
> > (1188.6 Mb)
> >           Interrupt:10 Base address:0xb800
> >
> > lo        Link encap:Local Loopback
> >           inet addr:127.0.0.1  Mask:255.0.0.0
> >           UP LOOPBACK RUNNING  MTU:16436  Metric:1
> >           RX packets:40969 errors:0 dropped:0 overruns:0 frame:0
> >           TX packets:40969 errors:0 dropped:0 overruns:0 carrier:0
> >           collisions:0 txqueuelen:0
> >           RX bytes:5714853 (5.4 Mb)  TX bytes:5714853 (5.4 Mb)
> >
> > iptables:
> > LOGGED: IN=eth1 OUT= MAC=00:10:5a:d0:19:16:00:09:6b:e2:31:d7:08:00
> > SRC=192.168.8.11 DST=192.168.9.1 LEN=48 TOS=0x00 PREC=0x00
> > TTL=128 ID=63630
> > DF PROTO=TCP SPT=2138 DPT=3128 WINDOW=64240 RES=0x00 SYN URGP=0
> > LOGGED: IN=eth1 OUT= MAC=00:10:5a:d0:19:16:00:09:6b:e2:31:d7:08:00
> > SRC=192.168.8.11 DST=192.168.9.1 LEN=48 TOS=0x00 PREC=0x00
> > TTL=128 ID=63746
> > DF PROTO=TCP SPT=2140 DPT=3128 WINDOW=64240 RES=0x00 SYN URGP=0
> > LOGGED: IN=eth1 OUT= MAC=00:10:5a:d0:19:16:00:09:6b:e2:31:d7:08:00
> > SRC=192.168.8.11 DST=192.168.9.1 LEN=48 TOS=0x00 PREC=0x00
> > TTL=128 ID=63825
> > DF PROTO=TCP SPT=2142 DPT=3128 WINDOW=64240 RES=0x00 SYN URGP=0
> >
> >
> > How come iptables still says eth1 is being used by
> > 192.168.9.1? This has
> > been my biggest problem. I hope to restrict in iptables that
> > eth0 is used by
> > 192.168.9.1 for security reasons.
> >
> > I have no forwarding or any routing settings yet with
> > iptables but a simple
> > logging just to find out if the network interfaces work properly.
> >
> >
> > fritz <www.mesedilla.com>
> > ---
> > + Basta Ikaw Lord
> >
> > ----------------------------------------------------------------------
> > This email and any files transmitted with it are confidential and
> > intended solely for the use of the individual or entity to whom they
> > are addressed. If you have received this email in error please notify
> > the sender immediately by e-mail and delete this e-mail from your
> > system. Please note that any views or opinions presented in this
> > email are solely those of the author and do not necessarily represent
> > those of the company. Finally, the recipient should check this email
> > and any attachments for the presence of viruses. The company accepts
> > no liability for any damage caused by any virus transmitted by this
> > email.
> >
> > Overture Media, Inc.
> > Direct Line: (632) 635-4785
> > Trunkline:   (632) 631-8971 Local 146
> > Fax: (632) 637-2206
> > Level 1 Summit Media Offices, Robinsons Galleria EDSA Cor.
> > Ortigas Ave.,
> > Quezon City 1100
> >
> >
> >
> >
>
> ----------------------------------------------------------------------
> This email and any files transmitted with it are confidential and
> intended solely for the use of the individual or entity to whom they
> are addressed. If you have received this email in error please notify
> the sender immediately by e-mail and delete this e-mail from your
> system. Please note that any views or opinions presented in this
> email are solely those of the author and do not necessarily represent
> those of the company. Finally, the recipient should check this email
> and any attachments for the presence of viruses. The company accepts
> no liability for any damage caused by any virus transmitted by this
> email.
>
> Overture Media, Inc.
> Direct Line: (632) 635-4785
> Trunkline:   (632) 631-8971 Local 146
> Fax: (632) 637-2206
> Level 1 Summit Media Offices, Robinsons Galleria EDSA Cor. Ortigas Ave.,
> Quezon City 1100
>
>
>
>



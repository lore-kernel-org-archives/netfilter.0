From: "Erik Ahlner" <whyz@home.se>
Subject: Re: Should i be worried?
Date: Wed, 29 Jan 2003 01:45:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003801c2c72f$aa18af50$0200a8c0@whyzpc>
References: <0B2759D401C1D211ACA500805FFE2C3F0860BE22@cmxserv3.hilton.com>
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
To: netfilter@lists.netfilter.org


----- Original Message -----
From: "Preston Wade" <Preston_Wade@hilton.com>
To: "'Erik Ahlner'" <whyz@home.se>; <netfilter@lists.netfilter.org>
Sent: Wednesday, January 29, 2003 12:30 AM
Subject: RE: Should i be worried?


> This rule would allow someone outside your firewall to route to your
> internal boxes.  I wouldn't accept all connection from the external
> interface to the internal interface.
>
> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT

you're right.. you reccon this would be better?
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state
ESTABLISHED,RELATED -j ACCEPT


> Also I wouldn't have a default policy of ACCEPT for the INPUT chain
either.
> $IPTABLES -P INPUT ACCEPT
>
>
> Anyway.... the log entry below is interesting because it shows that the
> packet came in on eth0 and went out eth0, but given the source and
> destination addresses I would think it would have came in on one interface
> and gone out a different.  The first two look like DNS queries based on
the
> DPT, but the source port is that of a NetBIOS service.  The last entry
looks
> like potentially a legitimate web request.
>
> Which interface is your outside?
> Can you show us the output of a netstat -nr?
>

eth0 is the nic to the outside..
and sure, here comes the output from netstat -nr!

Destination     Gateway         Genmask         Flags   MSS Window  irtt
Iface
130.236.146.0   0.0.0.0         255.255.255.0   U        40 0          0
eth0
192.168.0.0     0.0.0.0         255.255.255.0   U        40 0          0
eth1
127.0.0.0       0.0.0.0         255.0.0.0       U        40 0          0 lo
0.0.0.0         130.236.146.1   0.0.0.0         UG       40 0          0
eth0

thanks



From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: help bootp filters
Date: Mon, 16 Jun 2003 11:40:43 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030616154043.GC30628@cannon.eng.us.uu.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A019285@wardrive.citadelcomputer.com.au> <003901c33408$8b802640$0101a8c0@cerbere>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <003901c33408$8b802640$0101a8c0@cerbere>
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
Content-Transfer-Encoding: 7bit
To: Yoann <yoann.juet@ifrance.com>
Cc: George Vieira <georgev@citadelcomputer.com.au>, netfilter@lists.netfilter.org

If I recall correctly some DHCP servers operate on raw IP sockets
and bypass the normal path of the packet traversal. It takes the
requests off the wire and puts the replies on the wire. You can look
at the sources of your DHCP server to confirm this observation...

Ramin


> > Hi,
> >
> > I experiment trouble with netfilter/iptables on rh9. I configured a server
> with the following rules just to accept, for the moment, SSH sessions,
> everything else is dropped.
> >
> > $IPTABLES -P INPUT DROP
> > $IPTABLES -P FORWARD DROP
> > $IPTABLES -P OUTPUT DROP
> >
> > $IPTABLES -A INPUT -i $LO_IFACE -j ACCEPT
> > $IPTABLES -A OUTPUT -o $LO_IFACE -j ACCEPT
> >
> > $IPTABLES -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j
> ACCEPT
> > $IPTABLES -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j
> ACCEPT
> >
> > $IPTABLES -A INPUT -j LOG --log-level warning --log-prefix "DROP input
> packet died: "
> > $IPTABLES -A OUTPUT -j LOG --log-level warning --log-prefix "DROP output
> packet died: "
> >
> > It works fine, excepted for DHCP/BOOTP requests. In fact, the server
> (single interface with IP address 192.168.2.110) is also a DHCP server and
> responds to BOOTP requests as shown below :
> >
> > [root@pluton root]# tcpdump port 67 or 68
> > tcpdump: listening on eth0
> > 17:10:30.925605 0.0.0.0.bootpc > 255.255.255.255.bootps:  xid:0x9a499735
> flags:0x8000 [|bootp]
> > 17:10:31.005330 192.168.2.1.bootps > 255.255.255.255.bootpc:
> xid:0x9a499735 flags:0x8000 Y:192.168.2.110 S:192.168.2.1 ether
> 0:90:f5:c:80:a0 [|bootp] [tos 0x10]
> >
> > netfilter log messages are show below :
> >
> > Jun 12 17:28:29 pluton kernel: DROP input packet died: IN=eth0 OUT=
> MAC=ff:ff:ff:ff:ff:ff:00:90:f5:0c:80:a0:08:00 SRC=0.0.0.0
> DST=255.255.255.255 LEN=328 TOS=0x00 PREC=0x00 TTL=128 ID=55877 PROTO=UDP
> SPT=68 DPT=67 LEN=308
> > Jun 12 17:28:29 pluton kernel: DROP output packet died: IN= OUT=eth0
> SRC=192.168.2.1 DST=192.168.2.110 LEN=48 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF
> PROTO=ICMP TYPE=8 CODE=0 ID=63703 SEQ=0
> >
> > Can you explain me why a BOOTP response is sent even though such packets
> (seem to be) dropped by iptables rules ?
> >
> > Many thanks,
> > Regards,
> > Yoann.
> >
> >
> 
> 
> _____________________________________________________________________
> Envie de discuter en "live" avec vos amis ? T?l?charger MSN Messenger
> http://www.ifrance.com/_reloc/m la 1?re messagerie instantan?e de France
> 


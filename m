From: Zacky Ho <zackyho@yahoo.com>
Subject: Re: (no subject)
Date: Wed, 29 Dec 2004 22:56:48 -0800 (PST)
Message-ID: <20041230065648.84267.qmail@web41206.mail.yahoo.com>
References: <1104359539.7318.116.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1104359539.7318.116.camel@hubcap.ljm.dom>
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

Hi Jason,
Thanks a lot!
Since the script is provided by my friend, there are
some modification in the script. First is I use port
1080 for web access. Second is I will check with my
friend about TCP/UDP port. Third is I will modify the
log format for easy watching. Many thanks for your
advice! One more thing will need your supprt......

I Would like to introduce the detail about setting
Firewall at home. There is a Linux Box runnning RedHat
9 as a gateway/firewall. There are 2 network cards
installed in it. One is connected to ISP via cable
modem, which gets IP 222.166.46.146. Another network
card is connected to a switch and has static IP
192.168.123.254. I have register a domain name
"zackyho.no-ip.com" from no-ip.com. Using its provided
windows client update program, I see the real IP
reported back is "61.xxx.xxx.xxx". 
My Web server which runs Apache is installed in W2K
box which has static IP 192.168.123.222 and also
connect to the switch. I would like to provide
external access as http://zackyho.no-ip.com. Is there
any missing/mistakes in the script "rc.fireall.txt"
Please kindly adivse. Thanks in advance!
 
--- Jason Opperisano <opie@817west.com> wrote:

> On Wed, 2004-12-29 at 04:01, Zacky Ho wrote:
> > #
> > # allowed chain
> > #
> > 
> > $IPTABLES -A allowed -p TCP --syn -j ACCEPT
> > $IPTABLES -A allowed -p TCP -m state --state
> > ESTABLISHED,RELATED -j ACCEPT
> > $IPTABLES -A allowed -p TCP -j DROP
> > ## added 20040403 from Thomas
> > $IPTABLES -A allowed -p TCP -j LOG --log-prefix
> > "FW-DroppedAllow:"
> > ## added 20040403 from Thomas
> 
> your LOG rule needs to come *before* the DROP rule
> in order for it to
> ever log anything.
> 
> > #
> > # TCP rules
> > #
> > 
> > $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 21
> -j
> > allowed
> > $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22
> -j
> > allowed
> > $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 80
> -j
> > allowed
> > $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 113
> -j
> > allowed
> > #apache
> > $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 80
> -j
> > allowed
> > $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport
> 8888 -j
> > allowed
> > $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport
> 1080 -j
> > allowed
> > ### added 2004 12 28
> > #$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport
> 139 -j
> > allowed
> > ###
> > # 
> > $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport
> 1580 -j
> > allowed
> > $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 113
> -j
> > allowed
> > # winmx
> > #$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport
> 6699
> > -j allowed
> > # MTS
> > $IPTABLES -A tcp_packets -p TCP -s 0/0 --dport
> 5080 -j
> > allowed
> > ## added 2003 08 25
> > $IPTABLES -A tcp_packets -p TCP -j LOG
> --log-prefix
> > "FW-DroppedTCP: "
> > ## added 2003 08 25
> 
> um--you're jumping to "tcp_packets" from INPUT.  do
> you really run *all*
> these services on your firewall?  and do you really
> want *all* these
> services exposed to the Internet?  i sure hope not. 
> and port 80 is in
> there twice.
> 
> > #
> > # UDP ports
> > #
> > 
> > $IPTABLES -A udp_packets -p UDP -s 0/0
> --source-port
> > 53 -j ACCEPT
> > #if [ $DHCP == "yes" ] ; then
> > # $IPTABLES -A udp_packets -p UDP -s $DHCP_SERVER
> > --sport 67 \
> > # --dport 68 -j ACCEPT
> > #fi
> > 
> > #$IPTABLES -A udp_packets -p UDP -s 0/0
> > --destination-port 53 -j ACCEPT
> > #$IPTABLES -A udp_packets -p UDP -s 0/0
> > --destination-port 123 -j ACCEPT
> > $IPTABLES -A udp_packets -p UDP -s 0/0 --dport 20
> -j
> > ACCEPT
> > $IPTABLES -A udp_packets -p UDP -s 0/0 --dport 21
> -j
> > ACCEPT
> > $IPTABLES -A udp_packets -p UDP -s 0/0 --dport 22
> -j
> > ACCEPT
> > $IPTABLES -A udp_packets -p UDP -s 0/0 --dport 23
> -j
> > ACCEPT
> 
> um--what UDP services are ports 20-23?
> 
> <snip>
> 
> > #
> > # 4.1.5 FORWARD chain
> > #
> > 
> > #
> > # Bad TCP packets we don't want
> > #
> > ## Added 20040403 from Thomas
> > $IPTABLES -A FORWARD -i $LAN_IFACE -p UDP  \
> > --destination-port 135:139 -j LOG --log-prefix
> > "FW-Dropped_135-139: "
> > $IPTABLES -A FORWARD -i $LAN_IFACE -p UDP  \
> > --destination-port 135:139 -j DROP
> > ## Added 20040403 from Thomas
> > 
> > $IPTABLES -A FORWARD -p tcp -j bad_tcp_packets
> > 
> > #
> > # Accept the packets we actually want to forward
> > #
> > 
> > $IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
> > $IPTABLES -A FORWARD -m state --state
> > ESTABLISHED,RELATED -j ACCEPT
> 
> somewhere in here you want:
> 
>   $IPTABLES -A FORWARD -i $INET_IFACE -o $LAN_IFACE
> -p tcp --syn \
>     -d 192.168.123.222 --dport 1080 -j ACCEPT
> 
> > #
> > # Log weird packets that don't match the above.
> > #
> > 
> > $IPTABLES -A FORWARD -m limit --limit 3/minute
> > --limit-burst 3 -j LOG \
> > --log-level DEBUG --log-prefix "IPT FORWARD packet
> > died: "
> > 
> > #
> > # 4.1.6 OUTPUT chain
> > #
> > 
> > #
> > # Bad TCP packets we don't want.
> > #
> > 
> > $IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets
> > 
> > #
> > # Special OUTPUT rules to decide which IP's to
> allow.
> > #
> > 
> > $IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
> > $IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
> > $IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT
> > 
> > #
> > # Log weird packets that don't match the above.
> > #
> > 
> > $IPTABLES -A OUTPUT -m limit --limit 3/minute
> > --limit-burst 3 -j LOG \
> > --log-level DEBUG --log-prefix "IPT OUTPUT packet
> > died: "
> > 
> > ######
> > # 4.2 nat table
> > #
> > 
> > #
> > # 4.2.1 Set policies
> > #
> > 
> > #
> > # 4.2.2 Create user specified chains
> > #
> > 
> > #
> > # 4.2.3 Create content in user specified chains
> > #
> > 
> > #
> > # 4.2.4 PREROUTING chain
> > #
> > 
> > #
> 
=== message truncated ===



		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - Easier than ever with enhanced search. Learn more.
http://info.mail.yahoo.com/mail_250


From: Danny <dineshg@hostway.com>
Subject: Re: Watched a DDoS attack for hours and couldn't do much :S
Date: Mon, 27 Nov 2006 13:33:39 +0530
Message-ID: <456A9BDB.4030605@hostway.com>
References: <1164609380.21896.14.camel@srv1.iihs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1164609380.21896.14.camel@srv1.iihs.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: admin@antiproxy.com, netfilter@lists.netfilter.org

Hey !

also : what does 'netstat -s -t' show ?


Danny

AntiProxy wrote:
> Dear all,
>
>
> One of my servers was hit by a DDoS attack earlier today,
> and the pattern was different to these i've seen before.
>
> netstat doesn't show any TCP or UDP connections in any state.
>
> however, TCPDUMP shows the following (i'm posting a few lines of
> millions): 
> 00:51:08.279876 IP 199.28.0.228.1136 > My.Victim.IP.1060: S 3605427625:3605427625(0) win 16384 <mss 1460,nop,[bad opt]>
> 00:51:08.279905 IP My.Victim.IP.1060 > 199.28.0.228.1136: R 0:0(0) ack 3605427626 win 0
> 00:51:08.279945 IP 202.227.64.177.1027 > My.Victim.IP.1277: S 361765779:361765779(0) win 16384 <mss 1460,nop,[bad opt]>
> 00:51:08.279977 IP My.Victim.IP.1277 > 202.227.64.177.1027: R 0:0(0) ack 361765780 win 0
> 00:51:08.280014 IP 205.22.254.231.1080 > My.Victim.IP.1036: S 1599573484:1599573484(0) win 16384 <mss 1460,nop,[bad opt]>
> 00:51:08.280043 IP My.Victim.IP.1036 > 205.22.254.231.1080: R 0:0(0) ack 1599573485 win 0
> 00:51:08.280082 IP 202.238.89.100.1137 > My.Victim.IP.1158: S 3844747271:3844747271(0) win 16384 <mss 1460,nop,[bad opt]>
> 00:51:08.280111 IP My.Victim.IP.1158 > 202.238.89.100.1137: R 0:0(0) ack 3844747272 win 0
> 00:51:08.280152 IP 210.16.241.153.1074 > My.Victim.IP.1273: S 2749255844:2749255844(0) win 16384 <mss 1460,nop,[bad opt]>
> 00:51:08.280182 IP My.Victim.IP.1273 > 210.16.241.153.1074: R 0:0(0) ack 2749255845 win 0
> 00:51:08.280220 IP 202.37.165.2.1143 > My.Victim.IP.1106: S 1963715017:1963715017(0) win 16384 <mss 1460,nop,[bad opt]>
> 00:51:08.280250 IP My.Victim.IP.1106 > 202.37.165.2.1143: R 0:0(0) ack 1963715018 win 0
> 00:51:08.280289 IP 211.225.4.65.1043 > My.Victim.IP.1031: S 1558151020:1558151020(0) win 16384 <mss 1460,nop,[bad opt]>
> 00:51:08.280426 IP 199.75.254.153.1258 > My.Victim.IP.1026: S 1190926252:1190926252(0) win 16384 <mss 1460,nop,[bad opt]>
> 00:51:08.280496 IP 199.250.149.61.1099 > My.Victim.IP.1111: S 2527588092:2527588092(0) win 16384 <mss 1460,nop,[bad opt]>
> 00:51:08.280633 IP 210.155.122.67.1078 > My.Victim.IP.1248: S 1669627316:1669627316(0) win 16384 <mss 1460,nop,[bad opt]>
> 00:51:08.280710 IP 199.43.54.188.1144 > My.Victim.IP.1167: S 4133488145:4133488145(0) win 16384 <mss 1460,nop,[bad opt]>
> 00:51:08.280908 IP 211.231.52.59.1100 > My.Victim.IP.1107: S 3438491552:3438491552(0) win 16384 <mss 1460,nop,[bad opt]>
> 00:51:08.280976 IP 198.0.6.165.1172 > My.Victim.IP.1036: S 1294249773:1294249773(0) win 16384 <mss 1460,nop,[bad opt]>
> 00:51:08.281114 IP 211.86.244.159.1268 > My.Victim.IP.1186: S 3158078860:3158078860(0) win 16384 <mss 1460,nop,[bad opt]>
> 00:51:08.281189 IP 210.137.244.254 > My.Victim.IP: icmp 36: time exceeded in-transit
> 00:51:08.281265 IP 202.93.103.38 > My.Victim.IP: icmp 36: 202.93.103.38 tcp port 1046 unreachable
> 00:51:08.281334 IP 129.228.28.125.1135 > My.Victim.IP.1068: S 4066000806:4066000806(0) win 16384 <mss 1460,nop,[bad opt]>
>
> what does it tell you?
>
> the only thing that shows up in my syslog is the following:
> Nov 27 05:52:30 iihs kernel: martian source My.Victim.IP from 0.0.0.0, on dev eth0
> Nov 27 05:52:30 iihs kernel: ll header: 00:50:fc:29:94:2d:00:14:f2:89:bb:1c:08:00
> Nov 27 05:52:32 iihs kernel: martian source My.Victim.IP from 0.0.0.0, on dev eth0
> Nov 27 05:52:32 iihs kernel: ll header: 00:50:fc:29:94:2d:00:14:f2:89:bb:1c:08:00
> Nov 27 05:52:39 iihs kernel: martian source My.Victim.IP from 0.0.0.0, on dev eth0
>
> although my IPTABLES script should have logged the DDoS..
>
> following is a snippet of my IPTables script:
>
> $IPTABLES -F
> $IPTABLES -F -t nat
> $IPTABLES -F -t mangle
> $IPTABLES -F -t filter
> $IPTABLES -X SRC_FILTER
> $IPTABLES -N SRC_FILTER
> $IPTABLES -A INPUT -m state --state INVALID -j DROP
> $IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A INPUT -m state --state NEW -p TCP --tcp-flags ! ALL SYN -j DROP
>
> # had this bit from before.. i just noticed it's in the FORWARD chain, so i doubt it does anything in my setup
> $IPTABLES -A FORWARD -p tcp --syn -m limit --limit 1/s -j ACCEPT
> $IPTABLES -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s -j ACCEPT
> $IPTABLES -A FORWARD -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT
> $IPTABLES -A FORWARD -d 216.133.73.152/32 -p tcp --syn -m limit --limit 20/minute -j ACCEPT
>
> #i added this yesterday during an attack, but it didn't do anything:
> $IPTABLES -X syn-flood
> $IPTABLES -N syn-flood
> $IPTABLES -A syn-flood -m limit --limit 10/second --limit-burst 15 -j RETURN
> $IPTABLES -A syn-flood -j LOG --log-prefix "SYN flood: "
> $IPTABLES -A syn-flood -j DROP
>
> The system has one NIC with 24 virtual interfaces (24 IPs)
> no NAT is being done, the public IPs are assigned directly to the interfaces.
>
> it runs Debian Sarge (Stable), 2.6.8-2-k7 kernel, IPTables v1.2.11-10 debian package
>
> any help would really be appreciated!
>
> Regards,
>
> AntiProxy
>
>
>
>   



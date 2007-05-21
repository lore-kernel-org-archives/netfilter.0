From: Pat Riehecky <prieheck@iwu.edu>
Subject: Conntrack rule timeout problem
Date: Mon, 21 May 2007 11:34:10 -0500
Message-ID: <1179765250.12001.18.camel@thales.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

I seem to be capturing way more packets than I intend (or even expect!).
I am running squid and have the firewall rules below running on it.  For
some reason I am capturing hundreds of packets that I don't think should
be caught.

I have increased the timeouts in /proc/ (via sysctl) to fix this, but no
dice.  Anyone have any idea why the sample packet below would be
captured?  It is getting picked up by either the 
-A INPUT -p tcp -m tcp ! --syn -m conntrack --ctstate INVALID -j DROP
but sometimes the
-A INPUT -p tcp -m tcp ! --syn -m state --state NEW -j DROP

The packet looks to have been requested by squid, it is coming on port
80...  I also seem to be having the same behavior on the squid side
where the FIN/ACK packets are being caught by the conntrack rule...

I know I have something wrong, just what exactly is eluding me...

Any help would be helpful!

--- sample capture A ---
IN=eth0 OUT= MAC=00:0a:e9:6b:9e:ba:00:10:80:ec:37:5f:08:00
SRC=199.239.137.245 DST=XXX.YYY.ZZZ.AAA LEN=64 TOS=0x00 PREC=0x00 TTL=56
ID=620 DF PROTO=TCP SPT=80 DPT=60338 WINDOW=37260 RES=0x00 ACK URGP=0

--sample capture B ---
IN=eth0 OUT= MAC=00:0a:a9:60:9e:ba:00:10:80:ec:37:5f:08:00
SRC=222.28.249.164 DST=XXX.YYY.ZZZ.AAA LEN=40 TOS=0x00 PREC=0x00 TTL=109
ID=34912 DF PROTO=TCP SPT=1802 DPT=3128 WINDOW=65535 RES=0x00 ACK FIN
URGP=0

--- sysctl.conf ---
net.ipv4.netfilter.ip_conntrack_tcp_be_liberal=0
net.ipv4.netfilter.ip_conntrack_udp_timeout = 20
net.ipv4.netfilter.ip_conntrack_udp_timeout_stream = 95
net.ipv4.netfilter.ip_conntrack_generic_timeout=650
net.ipv4.netfilter.ip_conntrack_tcp_timeout_close=20
net.ipv4.netfilter.ip_conntrack_tcp_timeout_close_wait=180

--- rules ---
-A INPUT -i lo -j ACCEPT
-A INPUT -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m state
--state NEW -j DROP
-A INPUT -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m conntrack
--ctstate INVALID -j DROP
-A INPUT -p tcp -m tcp --tcp-flags SYN,ACK SYN,ACK -m state --state NEW
-j REJECT --reject-with tcp-reset
-A INPUT -p icmp -m icmp --icmp-type 8 -m limit --limit 4/sec
--limit-burst 9 -j ACCEPT
-A INPUT -p icmp -m icmp --icmp-type 8 -j DROP
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -m state --state NEW -j ACCEPT
-A INPUT -p tcp -m tcp --dport 113 -j REJECT --reject-with tcp-reset
-A INPUT -p tcp -m tcp --dport 80 -m state --state NEW -j ACCEPT
-A INPUT -p tcp -m tcp --dport 3128 -m state --state NEW -j ACCEPT
-A INPUT -j DROP
-A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A OUTPUT -o lo -j ACCEPT
-A OUTPUT -s 255.0.0.0/255.0.0.0 -j DROP
-A OUTPUT -s 0.0.0.0/255.0.0.0 -j DROP
-A OUTPUT -s 192.168.0.0/255.255.0.0 -j DROP
-A OUTPUT -p icmp -m icmp --icmp-type 8 -m limit --limit 9/sec
--limit-burst 15 -j ACCEPT
-A OUTPUT -p icmp -m icmp --icmp-type 8 -j DROP
-A OUTPUT -p tcp -m tcp --dport 53 -m state --state NEW -j ACCEPT
-A OUTPUT -p udp -m udp --dport 53 -m state --state NEW -j ACCEPT
-A OUTPUT -p tcp -m multiport --dports 80,443 -m state --state NEW -j
ACCEPT
-A OUTPUT -j DROP



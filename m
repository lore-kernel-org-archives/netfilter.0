From: Czezz <czezz@o2.pl>
Subject: DNAT what am i doing wrong ???
Date: Sat, 18 Oct 2003 12:14:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1782916143.20031018121452@o2.pl>
Reply-To: Czezz <czezz@o2.pl>
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

Hello everyone,

here is description of my situation:

my host is behind NAT server (Linux 2.4.x). By default, INPUT and
FORWARD is DROP. OUTPUT is ACCEPT.
There are maden some rules that allow to send/receive mail and for
PROXY server traffic.

Anyway, I want to connect to some server in the external net (
internet). Thatx to command:

   iptables -A FORWARD -i eth1 -j LOG --log-prefix "IPT:UnhandledForward:"

I found in syslog lines like this:

   Oct 16 19:05:59 slack kernel: IPT:UnhandledForward:IN=eth1 OUT=ppp0 SRC=192.168.1.251 DST=62.111.129.3 LEN=36 TOS=0x00 PREC=0x00 TTL=127 ID=17885 PROTO=UDP SPT=23083 DPT=13073 LEN=16
   Oct 16 19:07:44 slack kernel: IPT:UnhandledForward:IN=eth1 OUT=ppp0 SRC=192.168.1.251 DST=62.111.129.3 LEN=36 TOS=0x00 PREC=0x00 TTL=127 ID=18107 PROTO=UDP SPT=23083 DPT=13073 LEN=16
   Oct 16 19:10:27 slack kernel: IPT:UnhandledForward:IN=eth1 OUT=ppp0 SRC=192.168.1.251 DST=62.111.129.3 LEN=36 TOS=0x00 PREC=0x00 TTL=127 ID=18888 PROTO=UDP SPT=23083 DPT=13073 LEN=16
   Oct 16 19:11:08 slack kernel: IPT:UnhandledForward:IN=eth1 OUT=ppp0 SRC=192.168.1.251 DST=62.111.129.3 LEN=36 TOS=0x00 PREC=0x00 TTL=127 ID=19078 PROTO=UDP SPT=23083 DPT=13073 LEN=16

...so why in this situation I tryed to just FORWARD ports: SPT=23083
and DPT=13073. Unfortunately it wont work :(.

This is what I added:

   iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
   iptables -A FORWARD -i eth1 -p udp -m multiport --dport 13073,23083 -j ACCEPT

Dont know realy why it didnt work( maybe someone can explain me that,
because I use similar construction for SMTP and POP3 and it works
perfect)

Anyway i tryed to make DNAT.

I added the following lines:

   iptables -t nat -A PREROUTING -p tcp -i ppp0 --dport 13073 -j DNAT --to 192.168.1.251:23083
   iptables -A FORWARD -p tcp -d 192.168.1.251 --dport 23083 -j ACCEPT
   iptables -t nat -A PREROUTING -p udp -i ppp0 --dport 13073 -j DNAT --to-destination 192.168.1.251:23083
   iptables -A FORWARD -p udp -d 192.168.1.251 --dport 23083 -j ACCEPT

...and this method failed too :(

Can anyone give me an hand how to resolve this problem - i will be in
debt forever.

PS.

Please say if any of my description is not understood

-- 
Best regards,



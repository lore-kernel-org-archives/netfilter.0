From: Guillaume Tamboise <gtamboise@gmail.com>
Subject: Outgoing TCP RST packets dropped
Date: Tue, 09 Dec 2008 09:00:49 +0100
Message-ID: <493E25B1.6010901@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I am running netfilter on Debian etchnhalf (kernel 2.6.24 on AMD64) to 
protect the server it is running on.
The server is not too busy: maximum 400 established connections, 6 
FIN_WAIT, 15000 TIME_WAIT, 40 SYN_SENT, 5000 UDP connections, 15000 assured.

My output chain ends with an explicit drop/log for each protocol:

-A OUTPUT -o eth+ -p tcp -j LOG --log-prefix "IPTABLES TCP-OUT: "
-A OUTPUT -o eth+ -p tcp -j DROP

I am observing fairly large number of outgoing TCP RST packets that are 
dropped:
kernel: IPTABLES TCP-OUT: IN= OUT=eth0 SRC=X.X.X.X DST=Y.Y.Y.Y LEN=40 
TOS=0x08 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=80 D
PT=45360 WINDOW=0 RES=0x00 RST URGP=0

In the past couple of weeks, we are talking 12,300 packets dropped, 
11,000 of them being RST packets (we also had 1,300 ACK packets dropped).
They mostly concern the HTTP service running on the server, some of them 
concern the SMTP service.

This server is a drop-in replacement for a Debian Sarge (kernel 2.6.8k7) 
with exactly the same firewall rule set and netfilter settings.
The main change is that the 10 Mbps interface got turned into a 100 Mbps 
interface, and the platform changed from k7 to AMD64.
The 2.6.8k7 kernel on the old server did not exhibit the issue of 
dropping outgoing RST or ACK packets.

On the old server, I had to tweak the netfilter parameters. I reached 
those settings, that were good at the time, and that I originally used 
as is on the new server:

/bin/echo 960 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_close
/bin/echo 2400 > 
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_close_wait
/bin/echo 960 > 
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_time_wait
/bin/echo 3600 > 
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_fin_wait
/bin/echo 120 > 
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_last_ack
/bin/echo 180 > /proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout
/bin/echo 1440 > 
/proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout_stream
/bin/echo 131072 > /proc/sys/net/ipv4/ip_conntrack_max


Looking around on this mailing-list, I tried these changes one by one, 
without success:

- Upgrade from 2.6.18-6-amd64 to 2.6.24-etchnhalf.1-amd64
- Switch on ip_conntrack_tcp_be_liberal
- options nf_conntrack hashsize=16384
/proc/sys/net/ipv4/netfilter/ip_conntrack_max at 131072
/proc/sys/net/ipv4/netfilter/ip_conntrack_buckets at 16384


Would anybody have an idea on where I should be looking at now?



Thanks & Regards,

Guillaume

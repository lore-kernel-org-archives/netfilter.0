From: "Manikandan" <manikandan@manikandan.org>
Subject: ACK,RST getting dropped in the firewall.
Date: Wed, 23 Jun 2004 16:36:12 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GHEILNONPACCGBGKBEKKKEAMCHAA.manikandan@manikandan.org>
Reply-To: <manikandan@manikandan.org>
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
To: Netfilter <netfilter@lists.netfilter.org>

Hi Friends,

I am running a stateful firewall in Redhat linux 9 with iptables. I accept
connections, which are ESTABLISHED, RELATED to come inside my LAN and
firewall. I am seeing packets getting dropped which are actually RST packets
of web traffic.  My firewall also blocks incoming connections which are syn
but not new.

My log file is getting filled like this.

Jun 23 16:42:43 javagreen kernel: New not syn:IN=eth0 OUT=
MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=202.138.101.5
DST=202.138.22.218 LEN=1500 TOS=0x00 PREC=0x00 TTL=122 ID=51601 DF PROTO=TCP
SPT=80 DPT=2162 WINDOW=64574 RES=0x00 ACK URGP=0
Jun 23 16:42:43 javagreen kernel: New not syn:IN=eth0 OUT=
MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=202.138.101.5
DST=202.138.22.218 LEN=1500 TOS=0x00 PREC=0x00 TTL=122 ID=51601 DF PROTO=TCP
SPT=80 DPT=2162 WINDOW=64574 RES=0x00 ACK URGP=0
Jun 23 16:43:22 javagreen kernel: IPT INPUT packet died: IN=eth1 OUT=
MAC=ff:ff:ff:ff:ff:ff:00:0d:60:40:99:db:08:00 SRC=0.0.0.0 DST=255.255.22.255
LEN=340 TOS=0x00 PREC=0x00 TTL=128 ID=0 PROTO=UDP SPT=68 DPT=67 LEN=320
Jun 23 16:43:26 javagreen kernel: IPT INPUT packet died: IN=eth0 OUT=
MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=4.78.20.2
DST=202.138.22.218 LEN=84 TOS=0x00 PREC=0x00 TTL=41 ID=0 DF PROTO=ICMP
TYPE=8 CODE=0 ID=58217 SEQ=55219
Jun 23 16:43:26 javagreen kernel: IPT INPUT packet died: IN=eth0 OUT=
MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=166.90.213.130
DST=202.138.22.218 LEN=84 TOS=0x00 PREC=0x00 TTL=41 ID=0 DF PROTO=ICMP
TYPE=8 CODE=0 ID=8475 SEQ=60480

Jun 23 16:49:07 javagreen kernel: New not syn:IN=eth0 OUT=
MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=202.138.101.5
DST=202.138.22.218 LEN=1500 TOS=0x00 PREC=0x00 TTL=122 ID=29723 DF PROTO=TCP
SPT=80 DPT=2193 WINDOW=65073 RES=0x00 ACK URGP=0
Jun 23 16:49:07 javagreen kernel: New not syn:IN=eth0 OUT=
MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=202.138.101.5
DST=202.138.22.218 LEN=1500 TOS=0x00 PREC=0x00 TTL=122 ID=29723 DF PROTO=TCP
SPT=80 DPT=2193 WINDOW=65073 RES=0x00 ACK URGP=0
Jun 23 16:49:07 javagreen kernel: New not syn:IN=eth0 OUT=
MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=202.138.101.5
DST=202.138.22.218 LEN=1500 TOS=0x00 PREC=0x00 TTL=122 ID=29748 DF PROTO=TCP
SPT=80 DPT=2194 WINDOW=65063 RES=0x00 ACK URGP=0
Jun 23 16:49:07 javagreen kernel: New not syn:IN=eth0 OUT=
MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=202.138.101.5
DST=202.138.22.218 LEN=1500 TOS=0x00 PREC=0x00 TTL=122 ID=29748 DF PROTO=TCP
SPT=80 DPT=2194 WINDOW=65063 RES=0x00 ACK URGP=0
Jun 23 16:49:08 javagreen kernel: New not syn:IN=eth0 OUT=
MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=202.138.101.5
DST=202.138.22.218 LEN=1500 TOS=0x00 PREC=0x00 TTL=122 ID=30132 DF PROTO=TCP
SPT=80 DPT=2192 WINDOW=64507 RES=0x00 ACK URGP=0
Jun 23 16:49:08 javagreen kernel: New not syn:IN=eth0 OUT=
MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=202.138.101.5
DST=202.138.22.218 LEN=1500 TOS=0x00 PREC=0x00 TTL=122 ID=30132 DF PROTO=TCP
SPT=80 DPT=2192 WINDOW=64507 RES=0x00 ACK URGP=0



All the packets come from web sites that have recently been visited and
appear to be the closing down of the TCP connection. It seems that the
netfilter connection tracking is clearing up the connection before it
actually gets closed. netstat on the client machine for the connection shows
the connection in the state CLOSE_WAIT. So far I have only been
seeing these logs for http connections on port 80 and on port 135.


Could someone help me in this?

Thanks in advance.

Regards,
Manikandan.



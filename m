From: "Alexander Noack" <alex@gauss-gymnasium.dyndns.org>
Subject: ip_nat_pptp Problems
Date: Tue, 28 Jan 2003 17:35:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NFBBLIMCOLBEDAIPJPDMAELBCGAA.alex@gauss.euv-frankfurt-o.de>
Reply-To: <alexander.noack@web.de>
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

Hello everybody,

I have the following setup:
Win98 Client -> Linux-2.4.20 Masq-GW -> poptop-1.1.2 (Linux 2.4.20 -
this is a Masq-GW for another network)

I recently upgraded from 2.2.20 to 2.4.20.
The same setup with v2.2 worked, while v2.4 Kernel doesn't.
Everything else, e.g. ip_nat_h323, is working perfect (thanks
Netfilter-Team!).

I have tried the patch-o-matic as of January 7 and applied the
subsequent patch by Philip Craig.
iptables is version 1.2.7a and has been recompiled to suit the
patch-o-matic version.


When I connect, I'm told that username and password are being checked,
but then after some time (30sec) I get the MS-Error:650.

cat /proc/net/ip_conntrack gives me the following connections

tcp      6 431979 ESTABLISHED src=192.168.17.6 dst=139.30.XXX.XXX
sport=2294 dport=1723 src=139.30.XXX.XXX dst=62.226.78.120 sport=1723
dport=2294 [ASSURED] use=3 mark=0
gre      47 597 timeout=600, stream_timeout=432000 src=192.168.17.6
dst=139.30.XXX.XXX version=1 protocol=0x880b srckey=0x0 dstkey=0x0
[UNREPLIED] src=139.30.XXX.XXX dst=62.226.78.120 version=1
protocol=0x880b srckey=0x0 dstkey=0x0 use=1 mark=0
gre      47 599 timeout=600, stream_timeout=432000 src=139.30.XXX.XXX
dst=62.226.78.120 version=1 protocol=0x880b srckey=0x0 dstkey=0x8f6
[UNREPLIED] src=192.168.17.6 dst=139.30.XXX.XXX version=1
protocol=0x880b srckey=0x8f6 dstkey=0x0 use=1 mark=0


if the ip_conntrack_proto_gre is NOT loaded, the output on the server
side is
cat /proc/net/ipconntrack

unknown  47 599 src=139.30.XXX.XXX dst=62.226.78.120 src=62.226.78.120
dst=139.30.XXX.XXX use=1
tcp      6 431990 ESTABLISHED src=62.226.78.120 dst=139.30.XXX.XXX
sport=2309 dport=1723 src=139.30.XXX.XXX dst=62.226.78.120 sport=1723
dport=2309 [ASSURED] use=1


if the ip_conntrack_proto_gre is loaded, the output on the server side
is
cat /proc/net/ipconntrack

gre      47 500 timeout=0, stream_timeout=0 src=139.30.XXX.XXX
dst=62.226.78.120 version=0 protocol=0x0000 srckey=0x0 dstkey=0x0
src=62.226.78.120 dst=139.30.XXX.XXX version=0 protocol=0x0000
srckey=0x0 dstkey=0x0 use=1
gre      47 431998 timeout=600, stream_timeout=432000
src=139.30.XXX.XXX dst=62.226.78.120 version=1 protocol=0x880b
srckey=0x0 dstkey=0x909 src=62.226.78.120 dst=139.30.XXX.XXX version=1
protocol=0x880b srckey=0x909 dstkey=0x0 [ASSURED] use=1
tcp      6 431982 ESTABLISHED src=62.226.78.120 dst=139.30.XXX.XXX
sport=2313 dport=1723 src=139.30.XXX.XXX dst=62.226.78.120 sport=1723
dport=2313 [ASSURED] use=2
EXPECTING: - use=1 proto=47 src=62.226.78.120 dst=139.30.XXX.XXX
version=1 protocol=0x880b srckey=0x909 dstkey=0x0


the output on the server side in any cas is

Jan 28 17:29:13 aiesec pptpd[1905]: MGR: Launching /usr/sbin/pptpctrl
to handle client
Jan 28 17:29:13 aiesec pptpd[1905]: CTRL: local address =
192.168.16.253
Jan 28 17:29:13 aiesec pptpd[1905]: CTRL: remote address =
192.168.16.251
Jan 28 17:29:13 aiesec pptpd[1905]: CTRL: pppd speed = 115200
Jan 28 17:29:13 aiesec pptpd[1905]: CTRL: pppd options file =
/etc/ppp/peers/pptpd
Jan 28 17:29:13 aiesec pptpd[1905]: CTRL: Client 62.226.78.120 control
connection started
Jan 28 17:29:13 aiesec pptpd[1905]: CTRL: Received PPTP Control Message
(type: 1)
Jan 28 17:29:13 aiesec pptpd[1905]: CTRL: Made a START CTRL CONN RPLY
packet
Jan 28 17:29:13 aiesec pptpd[1905]: CTRL: I wrote 156 bytes to the
client.
Jan 28 17:29:13 aiesec pptpd[1905]: CTRL: Sent packet to client
Jan 28 17:29:13 aiesec pptpd[1905]: CTRL: Received PPTP Control Message
(type: 7)
Jan 28 17:29:13 aiesec pptpd[1905]: CTRL: 0 min_bps, 0 max_bps, 32
window size
Jan 28 17:29:13 aiesec pptpd[1905]: CTRL: Made a OUT CALL RPLY packet
Jan 28 17:29:13 aiesec pptpd[1905]: CTRL: Starting call (launching
pppd, opening GRE)
Jan 28 17:29:13 aiesec pptpd[1905]: CTRL: pty_fd = 5
Jan 28 17:29:13 aiesec pptpd[1905]: CTRL: tty_fd = 6
Jan 28 17:29:13 aiesec pptpd[1906]: CTRL (PPPD Launcher): Connection
speed = 115200
Jan 28 17:29:13 aiesec pptpd[1906]: CTRL (PPPD Launcher): local address
= 192.168.16.253
Jan 28 17:29:13 aiesec pptpd[1906]: CTRL (PPPD Launcher): remote
address = 192.168.16.251
Jan 28 17:29:13 aiesec pptpd[1905]: CTRL: I wrote 32 bytes to the
client.
Jan 28 17:29:13 aiesec pptpd[1905]: CTRL: Sent packet to client
Jan 28 17:29:14 aiesec pppd[1906]: pppd 2.4.1 started by root, uid 0
Jan 28 17:29:14 aiesec pppd[1906]: Using interface ppp0
Jan 28 17:29:14 aiesec pppd[1906]: Connect: ppp0 <--> /dev/pts/1
Jan 28 17:29:14 aiesec pptpd[1905]: Buffering out-of-order packet; got
1 after 4294967295
Jan 28 17:29:17 aiesec pptpd[1905]: Packet reorder timeout waiting for
0
Jan 28 17:29:17 aiesec pptpd[1905]: Buffering out-of-order packet; got
2 after 0
Jan 28 17:29:44 aiesec pptpd[1905]: CTRL: Received PPTP Control Message
(type: 12)
Jan 28 17:29:44 aiesec pptpd[1905]: CTRL: Made a CALL DISCONNECT RPLY
packet
Jan 28 17:29:44 aiesec pptpd[1905]: CTRL: Received CALL CLR request
(closing call)
Jan 28 17:29:44 aiesec pptpd[1905]: CTRL: I wrote 148 bytes to the
client.
Jan 28 17:29:44 aiesec pptpd[1905]: CTRL: Sent packet to client
Jan 28 17:29:44 aiesec pppd[1906]: Modem hangup
Jan 28 17:29:44 aiesec pppd[1906]: Connection terminated.
Jan 28 17:29:44 aiesec pppd[1906]: Exit.
Jan 28 17:29:49 aiesec pptpd[1905]: GRE: read error: Bad file
descriptor
Jan 28 17:29:49 aiesec pptpd[1905]: CTRL: PTY read or GRE write failed
(pty,gre)=(-1,-1)
Jan 28 17:29:49 aiesec pptpd[1905]: CTRL: Client 62.226.78.120 control
connection finished
Jan 28 17:29:49 aiesec pptpd[1905]: CTRL: Exiting now
Jan 28 17:29:49 aiesec pptpd[1768]: MGR: Reaped child 1905



- Alexander Noack
- Vitus-Bering-Str. 3
- 18106 Rostock
- Germany
-
-Tel: +49 (381) 12839893
-Fax: +49 (381) 12839901
-Web: www.gaussdivision.de



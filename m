From: Marcel de Boer <marceldb@preciamolen.nl>
Subject: ICMP redirects for DNAT since 2.4.23?
Date: Tue, 16 Dec 2003 10:36:20 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0312161024010.827@white.shark.demon.nl>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello all!

I have recently upgraded the kernel of the office firewall machine from
2.4.18 to 2.4.23 with IPSec patches, but since that update I keep getting
the following messages in my log, which did not occur in the old kernel:

Dec 16 07:01:56 xxxxx kernel: IN= OUT=eth0 SRC=192.168.3.3 DST=192.168.3.4
LEN=76 TOS=0x00 PREC=0xC0 TTL=64 ID=19508 PROTO=ICMP TYPE=5 CODE=1
GATEWAY=192.168.3.85 [SRC=192.168.3.4 DST=192.168.3.85 LEN=48 TOS=0x00
PREC=0x00 TTL=64 ID=0 DF PROTO=TCP SPT=3128 DPT=1270 WINDOW=5840 RES=0x00
ACK SYN URGP=0 ]

In this message, 192.168.3.3 is the internal interface of the firewall
(eth0), 192.168.3.4 is a server running a transparent proxy (on port 3128)
and 192.168.3.85 is one of the clients (the error occurs with multiple
clients).

The setup we use is the following: an outgoing port 80 request is first
DNATted to port 3128 of the proxy server, which then is SNATted to the
internal interface of the firewall to prevent the proxy server from
directly replying to the client.

The setup appears to be still working, but since the upgrade the firewall
tries to send ICMP Host Redirect messages (Type 5, code 1) to both the
client and the proxy server. These messages do not reach their targets
(the firewall only logs the packets it drops). Does anybody have any idea
what is causing this?

Kind regards,
	Marcel de Boer

PS. Please Cc: to my address, because I am not on the list. Thank you!


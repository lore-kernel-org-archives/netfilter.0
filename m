From: tfischer@abh.de
Subject: UDP in PREROUTING mangle
Date: Wed,  9 Apr 2003 12:01:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049882465.3e93ef6202375@www.intranet.abh.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: Netfilter ML <netfilter@lists.netfilter.org>

Hi,

I've setup a routing based only on fwmarks with iproute 2 and discovered a
Problem with UDP Packets. I mark the packets in the PREROTUING Chain, that works
great for tcp, but for UDP Packets i have to mark them in the POSTROUTING Chain
also. It seems that the UDP Packets "loose" their mark somewhere.

iptables -A PREROUTING -t mangle -p udp -s xxx.xxx.xxx.xxx -d 0/0 -j MARK
--set-mark 1

doesn't work.

iptables -A PREROUTING -t mangle -p udp -s xxx.xxx.xxx.xxx -d 0/0 -j MARK
--set-mark 1
iptables -A POSTROUTING -t mangle -p udp -s xxx.xxx.xxx.xxx -d 0/0 -j MARK
--set-mark 1

works.

Greets,

Tom Fischer



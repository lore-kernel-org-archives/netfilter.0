From: Mohammad Farooq <mohammadfarooq@tango-networks.com>
Subject: Pleeeeeeeease help: question about ip_queue
Date: Tue, 10 Oct 2006 09:41:58 -0500
Message-ID: <1160491318.4059.18.camel@mfarooq-1.tango-networks.com>
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

Hi,

I hope someone familiar with ip_queue can clarify the functioning of the
ip_queue. I wrote a simple test program, what all it does read packets
from the queue, hold a packet and accept it later. Here is the logic:

read message from the ip_queue
save message id
read message from the ip_queue
accept current message
read message from the ip_queue
accept current message
read message from the ip_queue
accept current message
read message from the ip_queue
accept current message
read message from the ip_queue
accept current message
**accept saved message using the saved message id
accept current message
read message from the ip_queue
accept current message

When I accept the saved message, it just disappears. My question is, can
we hold packets and accept them sometimes in the future? Thanks.

MF

Note: here is my iptable rules:
iptables -t nat -A PREROUTING -p udp -s 192.168.82.140 -d 192.168.75.51
--dport 7862 -j DNAT --to 192.168.82.140:7862
iptables -t nat -A POSTROUTING -p udp -s 192.168.82.140 -d
192.168.82.140 --dport 7862 -j SNAT --to 192.168.75.51:7862

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -A FORWARD -p udp -j QUEUE




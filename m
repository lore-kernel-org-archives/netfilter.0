From: Chinh Nguyen <cnguyen@certicom.com>
Subject: TCP packet in Transport Mode over NAT fails checksum because skb->sp
 is NULL
Date: Fri, 03 Feb 2006 15:26:10 -0500
Message-ID: <43E3BC62.6090901@certicom.com>
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

If this isn't the right forum for this question, please redirect me to the right
one.

I'm using Racoon on 2 linux machine, with one peer behind NAT (kernel 2.6.12 and
2.6.16-rc1 - although I don't think it matters). After negotiating IPSec
Transport Mode over NAT (ie, UDP-encap ESP), I can ping and send udp traffic
between the 2 machines. However, TCP connections do not occur.

My Tcp stats show bad segments for every ESP-encrypted TCP SYN, suggesting that
it is a checksum problem.

Tcp:
    ...
    2 bad segments received.
    4 resets sent

I know it's a checksum issue because the NAT gateway is rewriting the IP header.
However, bad UDP checksums seem to be ignored.

Digging into the kernel source, I found the following (kernel 2.6.16-rc1)
1. In function esp_post_input, skb->ip_summed set to ignore checksum if we are
in encap && transport mode.

2. esp_post_input is called in function __xfrm_policy_check if skb->sp != NULL.

By putting some printk into my kernel source, I see that encrypted UDP packets
have skp->sp != NULL, thus allowing skb->ip_summed to be ignored but not TCP
packets.

UDP:
Feb  3 14:27:10 localhost kernel: [17179793.432000] esp_input begin
Feb  3 14:27:10 localhost kernel: [17179793.432000] esp_input end
Feb  3 14:27:10 localhost kernel: [17179793.432000] skb->sp != NULL? = 1
Feb  3 14:27:10 localhost kernel: [17179793.432000] esp_post_input begin
Feb  3 14:27:10 localhost kernel: [17179793.432000] props.mode = 0, ip_summed =
2 (CHECKSUM_UNNECESSARY)

TCP:
Feb  3 14:27:17 localhost kernel: [17179800.324000] esp_input begin
Feb  3 14:27:17 localhost kernel: [17179800.324000] esp_input encap block
Feb  3 14:27:17 localhost kernel: [17179800.324000] esp_input decap_type block
Feb  3 14:27:17 localhost kernel: [17179800.324000] esp_input end
Feb  3 14:27:18 localhost kernel: [17179800.732000] skb->sp != NULL? = 0

If anyone know why this is happening, it would be helpful.

This last piece of information may or may not have any bearing on this problem.
Racoon generates the wrong SP for the machine in front of NAT. It uses SP of
RacoonIP-privateIP and vice versa. However, transport should be between Racoon
and NAT. Therefore, I have to manually add SP of RacoonIP-NatIP and vice versa.
This allows for pings and UDP traffic to work correctly. Otherwise, upon
receiving encrypted traffic, the reply will go back out in the clear because the
destination is NAT but policy is for RacoonIP-privateIP.

Chinh



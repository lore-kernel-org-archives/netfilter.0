From: "Jee J.Z." <jz105@york.ac.uk>
Subject: icmp echo reply && FORWARD chain
Date: Sun, 2 May 2004 15:24:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006701c43051$39130ad0$68892090@grouse>
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

Hi all,

My rules on a gateway linux box (PC2) are set as follows:

Internet(PC1 and so on)-----------(eth0)-PC2-(eth1)-------------Internal
networks(PC3 and so on...)

iptables -F
iptables -F -t nat
iptables -I FORWARD -j QUEUE
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to global_ip
iptables -t nat -A PREROUTING -i eth1 -j DNAT --to 192.168.0.2

ICMP echo request packets from PC1 or PC3 to PC2 can be caught by the
FORWARD chain queuing to userspace, however, ICMP echo reply (in response to
ping request from PC2) packets from PC1 or PC3 to PC2 will be ignored by the
FORWARD chain. Is this a reasonable phenomenon? Could anyone tell me the
reasons? Thanks a lot in advance!

Cheers,
Jee



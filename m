From: xiao shao <shao@tela.cs.tuat.ac.jp>
Subject: help about libipq
Date: Mon, 25 Nov 2002 20:49:33 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021125114931.C658C79004@btrans.tela.cs.tuat.ac.jp>
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
To: netfilter_user <netfilter@lists.netfilter.org>

I am programming with libipq and I got such a problem.

First I get a packet via NETLINK socket
ipq_packet_msg_t *m = ipq_get_packet(packet);
unsigned char *payload = m->payload;
and this works well


then I send this packet to another program by usual AF_UNIX socket
write(sockfd, m, sizeof(ipq_packet_msg_t));
write(sockfd, payload, m->data_len);
and this works well, too


at last, I recerive this packet in another propram and try to
reinject it into kernel
read(sockfd, &m, sizeof(m));
read(sockfd, payload, m.data_len);
rval = ipq_set_verdict(h, m.packet_id, user_verdict, m.data_len,
						payload);

and this does not work well. Although it seems that the packet has 
been reinjected into the kernel, the packet is never sent out of my 
computer. I do this test with a ping packet. (iptables -A OUTPUT
-p icmp -j QUEUE) And I did not catch this ping packet through the
ether interface by a packet captuer.

Excuse me for the poor English, and thanks for your help. 


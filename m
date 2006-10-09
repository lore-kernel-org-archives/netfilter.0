From: Mohammad Farooq <mohammadfarooq@tango-networks.com>
Subject: Is timestamp_sec in ipq_packet_msg_t used?
Date: Mon, 09 Oct 2006 16:55:08 -0500
Message-ID: <1160430908.28977.213.camel@mfarooq-1.tango-networks.com>
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

Hi all,

I just wrote a test program which reads the packets from the QUEUE and
accepts them. When I printed the timestamp_sec and timestamp_usec they
are set to zero. Are these fields used? My iptables rule is:

iptables -A FORWARD -p udp -j QUEUE

Thanks.

MF



From: Mattia Martinello <m.martinello@iol.it>
Subject: Ports
Date: Mon, 09 Sep 2002 19:30:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D7CDA9B.1070706@iol.it>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Could I allow a packet to transit in the FORWARD chain (under 
masquerading) from some host (or any host) to a host on a port?

iptables -A FORWARD -p tcp -s 0.0.0.0/0 -d 192.168.2.101 -dport 80 -j ACCEPT

don't work (only one -d is allowed). What can I do?

Thank you very much
Bye
Mattia



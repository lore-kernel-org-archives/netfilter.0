From: Sapient2003 <sapient@qwest.net>
Subject: UDP and ICMP traceroute
Date: Wed, 12 Mar 2003 17:48:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E6FB954.8080708@qwest.net>
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
To: netfilter@lists.netfilter.org

I am trying to have iptables pick out traceroute packets. Windows uses 
ICMP for it's traceroute, so I use this:

iptables -t filter -A INPUT -p icmp -s 0/0 -d 10.0.0.1 --icmp-type 
time-exceeded -j QUEUE

Linux, however, uses both ICMP and UDP... How can I tell iptables to 
look for UDP traceroute packets?



From: Kenneth Porter <shiva@sewingwitch.com>
Subject: Matching UDP pattern
Date: Tue, 09 Nov 2004 05:04:12 -0800
Message-ID: <AEB529C38518F45851049FC0@[10.0.0.4]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Users <netfilter@lists.netfilter.org>

I need to identify a UDP packet with a particular fixed 5-byte payload 
arriving at a particular port, and signal userland when this packet is 
seen, identifying the IP address it came from. Can iptables do this, or 
perhaps tcpdump? What modules should I be looking at?


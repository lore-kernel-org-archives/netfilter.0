From: ms419@freezone.co.uk
Subject: Forwarding Multicast Traffic
Date: Sun, 8 Feb 2004 23:31:21 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F5200854-5AD1-11D8-87C2-000A95C71776@freezone.co.uk>
Mime-Version: 1.0 (Apple Message framework v612)
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

Two machines communicate with one another using multicast - mDNS - when 
they are on the same network segment. When they are on separate network 
segments, however - though they can connect to one another across a 
router - they can't communicate using multicast. I presume that this is 
because the router isn't forwarding multicast traffic to other network 
segments? The router is running Linux kernel version 2.4.23 and 
iptables. How can I configure iptables to forward multicast traffic to 
other network segments?

Thanks very much,

Jack



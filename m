From: ro0ot <ro0ot@phreaker.net>
Subject: Neighbour table overflow
Date: Wed, 05 Jan 2005 08:42:32 +0800
Message-ID: <41DB37F8.6020709@phreaker.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I had setup my bridge (br0) as below: -

ifconfig eth0 0.0.0.0
ifconfig eth5 0.0.0.0

brctl addbr br0

brctl addif br0 eth0
brctl addif br0 eth5

brctl stp br0 on

ifconfig br0 192.168.1.1 netmask 255.255.255.0 broadcast 192.168.1.255

I had my firewall scripts setup correctly.

Once I connect both the interface (eth0 and eth5) to my network.  I 
can't ping to my router (connect to eth0) or ping to my other IP 
addresses (connect to eth5).  I check around and found out some messages 
pops up in /var/log/syslog file as below: -

Jan  2 10:44:22 fw01 kernel: ipt_tcpmss_target: bad length (64 bytes)
Jan  2 10:44:32 fw01 last message repeated 11 times
Jan  2 12:27:08 fw01 kernel: Neighbour table overflow.
Jan  2 12:27:11 fw01 last message repeated 9 times
Jan  2 12:27:13 fw01 kernel: NET: 10 messages suppressed.
Jan  2 12:27:13 fw01 kernel: Neighbour table overflow.
Jan  2 12:27:18 fw01 kernel: NET: 27 messages suppressed.
Jan  2 12:27:18 fw01 kernel: Neighbour table overflow.

Once I disconnect the cable from the eth5 interface, I can ping to my 
router.  I try to reconnect the cable back to the eth5 interface and run 
a ping to my router.  As the result, I can't ping the router and the 
similar messages pops up in the /var/log/syslog file.

How can I resolve this issue?

Regards,
ro0ot






From: jon@gorillacon.com
Subject: Can netfilter bypass routing table?
Date: Sun, 28 May 2006 09:05:46 -0700
Message-ID: <200605281605.k4SG5ke08025@zool.gorillacon.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have a linux machine with two interfaces eth0 and eth1.
I am interested in sending a packet to address 1.2.3.4.
I want the packet to go out eth0 if it is being sent by ProcessA.
I want the packet to go out eth1 if is being sent by ProcessB.

Is this possible to do with iptables?


I see that CONFIG_NF_IP_OWNER has the ability to identify packets by process.
I don't understand how to use iptables to change the interface.

Any advice cheerfully accepted,
Thanks,
-jon


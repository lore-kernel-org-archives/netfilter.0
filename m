From: Baskaran Mohandass <baski@foundrynet.com>
Subject: SNAT issue for locally generated UDP packet
Date: Tue, 14 Jun 2005 13:01:56 -0700
Message-ID: <42AF37B4.8080000@foundrynet.com>
Reply-To: baski@foundrynet.com
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

Hi all,

      I am trying to source nat the packet generated locally using 
iptables. Machine is running Fedora core2 and one of the interface 
address is 5.5.5.7.  Sip server sends a packet with source port 5060 and 
ip address 5.5.5.7. I want to change the IP address and the source port 
when it goes out. Reading the IPtables manual only rule i can think of is
iptables -t nat -A POSTROUTING --protocol udp --source-port 5060  -j 
SNAT --to-source 5.5.5.7:1024-32000.
[root@sipserver2 ~]# uname -a
Linux sipserver2.baski.com 2.6.9-1.667 #1 Tue Nov 2 14:41:25 EST 2004 
i686 i686 i386 GNU/Linux
Unfortunately it does not work. IPtables also says that locally 
generated packets are modified in the output chain and there is not NAT 
capability in there. I went through all the messages in the archive for 
SNAT and OUTPUT, So I would really appreciate any help on this. If there 
is any patch available for this I am ready to try.

Thanks and Regards
..baski


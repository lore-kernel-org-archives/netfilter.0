From: Brian Atkins <batkins@tlcdelivers.com>
Subject: Natting IPs hanging
Date: Fri, 13 May 2005 13:04:31 -0700
Message-ID: <4285084F.1020500@tlcdelivers.com>
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

Greetings:

I'm in the process of building my first dedicated firewall using 
iptables/netfilter (v 1.2.11) on Gentoo Linux (2.6.11 kernel).  I want 
to enable the natting of IPs, but I am having trouble getting the rules 
to take.  Essentially, I would like to take a specific group of IPs 
(servers) and nat them specifically to an internal ip address.  The 
remainder of the internal IPs (workstations - dhcp) should be natted 
outbound within a range of IPs.

Based on the docs on Netfilter.org and the man pages, I decided to start 
off with the following:

iptables -t nat -A PREROUTING -i eth0 -d 141.xxx.xxx.xxx -j DNAT 
--to-destination 10.xxx.xxx.xxx

But, when I try to run the command, it just hangs. After a while, I can 
break out of it with CTL-C.

What gives?  Am I missing something?

-- 
Brian



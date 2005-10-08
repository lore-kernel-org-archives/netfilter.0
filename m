From: sureshmadhu <smadhu@e-consystems.com>
Subject: getting userspace iptables
Date: Sat, 08 Oct 2005 10:50:30 +0530
Message-ID: <4347571E.8020906@e-consystems.com>
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

hi,
     I am confusing about how to get userspace iptables for linux kernel 
version 2.4 and compiling that iptables. I want to add the following 
rule in the chain.

iptables -t mangle -A OUTPUT -o! "eth0" -m random --average 50 -j ACCEPT

But the random matching is not available in normal linux kernels. So I 
am in need of using userspace iptables.

can anybody help me to solve this problem?

Suresh Madhu D
Project Trainee
e-consystems
chennai




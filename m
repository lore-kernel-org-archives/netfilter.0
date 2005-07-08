From: Rafael Dreher <dreher@interage.com.br>
Subject: Unable to add rule on Chain with 28 characters.
Date: Fri, 08 Jul 2005 16:00:23 -0300
Message-ID: <42CECD47.5050003@interage.com.br>
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

I'm trying do add a rule on a user-defined chain, on the NAT table, with 28 characters.

The chain have bee added without any problem, but when I add the rule, iptables says that it's unable do find the chain.

If I reduce the chain to 25 characters, it works. I'm trying to migrate a set of rules form iptables-1.2.11 to 1.3.1,
and I don't want to rewrite the rules.

Someone can help me?

My iptables version: 1.3.1
My kernel version: 2.4.31

POM-Patches:

CLASSIFY
SAME
comment
NETMAP
iprange
quota
time
IPMARK
ROUTE
account
h323-conntrack-nat
ipp2p
l7-filter-pom-1.4
mms-conntrack-nat
msnp-conntrack-nat
pptp-conntrack-nat
quake3-conntrack-nat
string
mport

Thanks in advance.

-- 
Rafael Dreher

-:: Red Hat Certified Engineer ::-
-:: Nr: 807303498507617 ::-
http://www.redhat.com/training/certification/verify


From: <jay@esuna.co.uk>
Subject: ipt_owner and ICMP
Date: Sat, 18 Mar 2006 18:34:40 -0000
Message-ID: <004801c64aba$9e81b170$0301a8c0@asp>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I'm currently using the ipt_owner module to enforce stronger outgoing packet
filtering on certain daemons. I create a custom chain with the stronger
rules and use '-m owner' to jump packets into the chain.

This works fine for UDP and TCP, but my outgoing ICMP packets never match
the rule. I understand why incoming ICMP should fail to match, but why are
outgoing packets missing the filter?

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
acctboth   all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere
apache-output  all  --  anywhere             anywhere            OWNER UID
match
 iptest

Chain apache-output (1 references)
target     prot opt source               destination
DROP       icmp --  anywhere             anywhere

(nothing in the acctboth chain causes a jump)

Any ideas?

-- 
Jay L.T. Cornwall, http://www.esuna.co.uk/~jay/
PhD Student
Imperial College London



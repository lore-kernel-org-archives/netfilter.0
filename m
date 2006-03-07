From: Joerg Hartmann <J.Hartmann@reinarts.de>
Subject: problem with IPSEC-patches for 2.6.15 kernel
Date: Tue, 07 Mar 2006 17:20:01 +0100
Message-ID: <440DB2B1.9030601@reinarts.de>
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

Hello,

i tried to patch iptables-1.3.5 and kernel 2.6.15.5 with 
patch-o-matic-ng-20060303 to get ipsec-01 ... ipsec-04 patches into the 
kernel.

Unfortunately i got errors for the ipsec-01 ... 04 patches:

"patchlets/ipsec-01-output-hooks has dependency on nf_reset, but 
nf_reset is not known"

Goggle was no help on this topic. Does someone know how to resolve this 
problem ?

regards
               Joerg


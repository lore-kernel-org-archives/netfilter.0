From: Jason Schott <jschott@marmot.com>
Subject: batch mode with the policy patch
Date: Mon, 20 Jun 2005 08:27:35 -0700
Message-ID: <42B6E067.3040805@marmot.com>
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

I was wondering how to use POM in batch mode with the policy patch in 
extra? There seems to be no *.patch file rfore this one.
KERNEL_DIR=/usr/src/linux IPTABLES_DIR=/usr/src/iptables-1.3.1 ./runme 
extra/policy

did not work

policy patch:
    Author: Patrick McHardy, <kaber@trash.net>
    Status: Testing

This patch adds the policy match to netfilter.

The policy match is used to match the IPsec policy
used for handling a packet.



From: Rob Carlson <rcarlson@kitchenandassociates.com>
Subject: Alternatives to --check option
Date: Mon, 18 Sep 2006 16:09:07 -0400
Message-ID: <450EFCE3.9030704@kitchenandassociates.com>
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

I'm sorry if this has been discussed before, but I'll ask any way.


I know that there isn't a -C (--check) option in iptables because of 
stateful firewalling, but is there any method of testing one's iptables 
logic?

For example-- I'm blocking a set of addresses (from port 22-25 with 
IPSET); within that set I am trying to specifically allow traffic from a 
subset before the block applies.

Is there any way of being able to tell how iptables is handling a 
package from a particular address short of actually sending something 
from said address?

Thanks,
-- 
Rob Carlson, Systems and Network Administrator
Kitchen & Associates Architectural Services, PA
Architecture - Planning - Interior Design
856.854.1880






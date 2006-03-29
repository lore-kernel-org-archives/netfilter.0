From: Mr Ritter <netfilter@candlefire.org>
Subject: packets skipping DNAT rules
Date: Wed, 29 Mar 2006 11:05:57 -0700
Message-ID: <442ACC85.1060807@candlefire.org>
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

I have some rules in the PREROUTING of the nat table that perform a DNAT 
however, on a very consistent basis the rules doesn't get applied and 
the packet ends up in the filter table without the destination modified. 
95% of the time it works, 5% it doesn't. I can't put a finger on whats 
causing it, or see anything in particular about the packets that fail to 
DNAT. Any suggestions on how to resolve this?

--
Ritter



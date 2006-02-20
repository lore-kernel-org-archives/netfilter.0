From: Clist <clist@uah.es>
Subject: avoid conntrack
Date: Mon, 20 Feb 2006 14:30:35 +0100
Message-ID: <200602201430.35996.clist@uah.es>
Reply-To: clist@uah.es
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi list,

It is needed to do '-j NOTRACK'  in order to avoid conntracking for some 
packets, or i can simply DROP packets on the raw table so they do not reach 
other netfilter tables and so it is not conntracking for those packets..?


Now and simply do
*raw 
-A PREROUTING <some criteria> -j DROP

do i need to do
-A PREROUTING <some criteria> -j NOTRACK
-A PREROUTING <some criteria> -j DROP

Thanks...
-- 
---------------------------------------------
Clister UAH
---------------------------------------------


From: Alexey Toptygin <alexeyt@freeshell.org>
Subject: netfilter vs ipsec vs iproute2
Date: Fri, 3 Sep 2004 16:59:56 +0000 (UTC)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <Pine.NEB.4.60.0409031652150.16739@xm.freeshell.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I've more-or-less gleaned from Rusty's guides how netfilter interacts with 
advanced routing and traffic control. Is there any documentation on how 
the new 2.6 ipsec implementation interacts with all of that?

Specifically, where are the policy decisions made? I'm assuming all 'in' 
policies are processed in one place and all 'out' policies are processed 
in one other place. Where are those places WRT routing decisions and 
netfilter hooks?
 			Alexey


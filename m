From: xavier renaut <list.netfilter=W+vduneg5OqcvWdFBKKxig@public.gmane.org>
Subject: printing the owner cmd and uid in iptables logs
Date: Wed, 16 Jul 2003 11:03:44 -0400
Sender: netfilter-admin=wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Message-ID: <20030716150344.GA3305@natch.8d.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter=wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>


Hi, 

i'd like to print the owner cmd and uid in my logs,
so that i'll be able to track more easily  software
on my box....

is there a way to do it with stock iptables ?

(-j LOG prints a lot of things, but not the owner cmd/uid)

do i need a better logging alternative (ulog ?) ?


thanks


-- 
xavier renaut, 514 906 1212 x226  


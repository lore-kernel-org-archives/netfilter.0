From: bmcdowell@coxhealthplans.com
Subject: Redirect to Honeypot?
Date: Tue, 11 Nov 2003 15:57:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <94930-2200311211205755548@coxhealthplans.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org


Does anyone on the list have a recomendation as to how one might use
iptables to redirect traffic to a honeypot?  I have a few ideas, but
I'd really like to hear from someone who has a solution they like (or
even an idea they like).  Thanks in advance.

To clarify just a bit:

I'd like to be able to redirect packets instead of dropping them. 
I'd also like to be able to do this as a catch-all rule at the end of
my input and forward chains.  The overall idea is to combine randomly
dropping packets, tarpitting, and live honeypot responses (from
different OS'es) in an effort to utterly stump recon efforts.  In my
head, I have visions of Linux boxes reporting they're running IIS 5
and Crays running (x app), etc.

In my testing so far, I've found that combining randomly dropping
packets and tarpitting to be extremely effective at slowing normal
NMap scans.  In some cases, scan time was increased to well over two
hours.  Now I'd like to introduce live ports into that mix.  This
way, a positive hit on a live port would not necessarily have to be
one of my production boxes.  In fact, it probably isn't...

Thanks again,

Bob



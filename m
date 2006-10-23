From: Alan Ezust <alan.ezust@presinet.com>
Subject: understanding how conntrack works
Date: Mon, 23 Oct 2006 11:19:12 -0700
Message-ID: <200610231119.13034.alan.ezust@presinet.com>
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

Greetings all, I'm exploring the kernel source trying to understand better how 
the conntrack facility works. I had a couple of questions which I hope 
someone more familiar with the code can answer...

Q: Where in the code does a table entry get added to the conntrack table? 
nf_conntrack_put doesn't seem to contain much code related to that.

Q: Where in the code is the conntrack data lines being written, and using what 
mechanism? (kprintf? procfs?)

I did some ctags jumping and keep coming to the nf_conntrack_put function, 
which I expected to contain the code. Instead it only contains a

<pre>
// ip_conntrack.h:
static inline void
ip_conntrack_put(struct ip_conntrack *ct)
{
	IP_NF_ASSERT(ct);
	nf_conntrack_put(&ct->ct_general);
}

// skbuff.h:
#ifdef CONFIG_NETFILTER
static inline void nf_conntrack_put(struct nf_conntrack *nfct)
{
	if (nfct && atomic_dec_and_test(&nfct->use))
		nfct->destroy(nfct);
}
</pre>

The "destroy" call is an indirect function call, which appears to be a call 
(most of the time) to nf_conntrack_core.c:541
<pre>
static void destroy_conntrack(struct nf_conntrack *nfct)
</pre>

I hope the table updating and kprintf lines are not embedded within the 
destroy code?

Q: What is "master"?

It seems that conntrack data has a concept called "master". When a connection 
is "destroyed", a call to the "master" destroy is also made. What is the 
relationship between the nf_conntrack and the master of an nf_conntrack 
(appears to be a tree or a linked list). It seems to be an ownership 
relationship.




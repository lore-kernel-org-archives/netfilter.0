From: Worik <worik@noggon.co.nz>
Subject: MASQUERADE and QUEUE target.  Can they be used together?
Date: 27 Apr 2003 14:28:20 +1200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051410500.29656.66.camel@stolberg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Friends

I have about a weeks experience now with iptables, and am having a ball
with it.  But I have run into a brick wall.

I am using a MASQUERADE target for machines on my lan.

I want to pipe all packets that are masqueraded through  my user space
process.

So my rules are...

 iptables -t nat -L POSTROUTING
Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
MASQUERADE  all  --  anywhere             anywhere           
QUEUE      all  --  192.168.0.0/24       anywhere           


Problem is that I the QUEUE never sees the packets.  But nowhaere in the
docs that I can find does it state that if a MASQUERADE target is
matched does processing in the chain stop.

Am I missing something?

My user space Queue process (using libipq) works, but I can only ACCEPT
(NF_ACCEPT) or DROP (NF_DROP via ipq_set_verdict()) packets, both of
which *do* stop processing in the chain, so reversing the order of the
rules will not work.

Questions:

Does a match on a rule with a MASQUERADE target stop processing in the
chain?

(If so) does a match on *any* rule stop processing in the chain?  LOG
doesn't, so the answer must be no.

Should I be using ULOG?  I am having difficulty tracking down any
documentation on ulogd (I have installed it from a Debian package, but
there is no indication of how to get data out of it.  I have a ULOG
target and there is nothing in  /var/log/ulogd*)








From: Fred Moyer <fred@redhotpenguin.com>
Subject: Setting skb->len
Date: Thu, 30 Aug 2007 15:12:54 -0700
Message-ID: <46D740E6.8030705@redhotpenguin.com>
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

Hi netfilter list,

This is my first post to this list, so if this question is better 
handled by a different list, or offtopic, please kindly inform me that 
is the case.  My C is a bit rusty also, so please forgive me if I'm 
asking something that is not clear.  In addition, this is my first 
netfilter module :-)

In a netfilter module I am working on I alter the packet data such that 
the length of the packet is reduced by an amount diff.  I then set 
skb->len via the following code:

   skb->len -= diff;

This worked fine with gcc 2.96 but when cross-compiling this module for 
OpenWrt with gcc 4.1.2 I get the following error:

   error: assignment of read-only member 'len'

Is there a function I can use to set skb->len or do I need to poke 
around the kernel code and modify this member to be read-write.  I 
accept the fact that what I'm doing is probably a hack, but I would like 
to get this module working first, then make it well coded second.

Thanks in advance for any advice,

Fred


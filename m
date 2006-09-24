From: Mike Wright <xktnniuymlla@mailinator.com>
Subject: ipset on 2.4.18-14
Date: Sun, 24 Sep 2006 10:21:50 -0700
Message-ID: <4516BEAE.3030708@mailinator.com>
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

Hi all,

I've been trying to add ipset support to a remote box running Redhat 8 
with kernel 2.4.18-14 and am having build problems.

The patches applied with no errors to the src build tree but "make" 
failed with a missing linux/jhash.h.  A google search on ipset, jhash 
and 2.4.18-14 found a patch with no --- and only +++ lines so I edited 
it and added it to the tree.

The build makes it farther but still fails within ip_set.c:

ip_set.c: In function `ip_set_unbindip':
ip_set.c:655: warning: implicit declaration of function 
`list_for_each_entry_safe'
ip_set.c:655: `list' undeclared (first use in this function)
ip_set.c:655: (Each undeclared identifier is reported only once
ip_set.c:655: for each function it appears in.)
ip_set.c:655: parse error before "__set_hash_del"
ip_set.c:683: parse error before "__set_hash_del_byid"

"FOREACH_HASH_RW_DO" seems to be what makes it unhappy.

there a few similar errors later in the same file, but that are all a 
result of "list" being undeclared.

I'm not a c programmer so I'm a bit lost here (and I'd really hate to 
bring the box in).  Does anybody know how to remedy this?

Thanks for any help,
Mike Wright :m)


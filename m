From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Deleting iptable-extended rule
Date: Fri, 6 Dec 2002 00:42:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021206004218.3bc66707.arnt@c2i.net>
References: <20021204225754.87915.qmail@web41308.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021204225754.87915.qmail@web41308.mail.yahoo.com>
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

On Wed, 4 Dec 2002 14:57:54 -0800 (PST), 
lists brk <brk_lists@yahoo.com> wrote in message 
<20021204225754.87915.qmail@web41308.mail.yahoo.com>:

> Hi!
> 
> I am using iptables-1.2.7a. I have extended iptables
> to do a coustom matching operation. The extension
> works fine when I use it while adding new rules,
> something like
> iptables -A INPUT -m coustom --ip-id -j DROP. 
> 
> I am able to delete the rule using the rule number,
> but I am not able to remove it using the rule specifed
> above but with -D option, something like
> iptables -D INPUT -m coustom --ip-id -j DROP
> 
> The error I get is:
> iptables: Bad rule (does a matching rule exist in that
> chain?)
> 
> I tried to debug it and found that iptables fails at
> 
> mptr = matchmask + sizeof(STRUCT_ENTRY);
> 	if (IPT_MATCH_ITERATE(a, match_different, a->elems,
> b->elems, &mptr))
> 	  return 0;
> 
> in is_same() found in file libiptc/libip4tc.c
> 
> Any ideas why this might be happening??

..custom spelling of "coustom" in your rule set?  ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.




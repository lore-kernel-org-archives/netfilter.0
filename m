From: Scott MacKay <scottmackay@yahoo.com>
Subject: Re: handle packets by libipq
Date: Fri, 6 Aug 2004 05:09:20 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040806120920.49351.qmail@web13910.mail.yahoo.com>
References: <20040806061445.88423.qmail@web41510.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040806061445.88423.qmail@web41510.mail.yahoo.com>
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

You re-inject using ipq_set_verdict.  Moving a packet
from ipv4 to ipv6...dunno.  ipv4 and ipv6 use 2
different interfaces ( ipq_create_handle(0, PF_INET)
vs  ipq_create_handle(0, PF_INET6) and 2 different
ip_queues (ip_queue.o, ip6_queue.o), so not sure if
you can.  More likely would need to drop from 1 and
regenerate on the other, but not sure on that one.

-Scott


--- Dan Nguyen <dnguyenanh@yahoo.com> wrote:

> Hi all,
> 
> I posted this in devel- mailling, but it seem is
> wrong place. So I
> post here to hope the helping.
> 
> I plan to use libipq to do the following:
> 1. capture all packet (both ipv4 and ipv6) on
> user-space.
> 2. Modify the captured packet (may tranlate even
> protocol, i.e
> replace ipv4 packet by ipv6 packet).
> 3. Reinject modified packet to kernel.
> 
> The 1st and 2nd tasks had solution by modify the
> libipq and use rfc.
> But I had not have solution in 3nd task.
> 
> Please help me to roadmap.
> 
> Thanks for your considering.
> Dan Nguyen
> PS: Sorry if I send to the wrong mailling.
> 
> 
> 
> 		
> __________________________________
> Do you Yahoo!?
> Yahoo! Mail Address AutoComplete - You start. We
> finish.
> http://promotions.yahoo.com/new_mail 
> 
> 



		
__________________________________
Do you Yahoo!?
Yahoo! Mail - 50x more storage than other providers!
http://promotions.yahoo.com/new_mail


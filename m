From: Thomas Heinz <creatix@hipac.org>
Subject: Re: how to block 10000's of addresses?
Date: Sun, 13 Oct 2002 19:42:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DA9B078.4020005@hipac.org>
References: <20021013065007.A15824@hamal.ipal.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi Phil

You wrote:
> I would like to know how best to block 10000's of addresses using
> netfilter.  Clearly I do not want to be placing 10000's of individual
> filter table entries in.

Do you know nf-hipac? Michael Bellion and I made an announcement
on the netfilter list some time ago.
It's a new framework which implements a packet filter that maintains
the semantics of linear lists of rules while the matching algorithm
is much more efficient than just matching rules sequentially.

nf-hipac is a registered sourceforge project: 
http://sourceforge.net/projects/nf-hipac/
You find some additional information (including a performance test)
on our homepage: http://www.hipac.org/
The missing documentation will be available soon (next week) but as
the userspace tool of nf-hipac uses the same syntax as iptables it
should not be a problem for you to cope with it. You don't even
have to recompile your kernel.

Finally, nf-hipac and iptables can be used at the same time. This might
be interesting for you if you need matches/targets which we do not yet
support. There is just one important thing to notice: the order in
which the packet filters are called. Currently,  the iptables filter
table is called before nf-hipac. If you need it the other way around
tell me and I'll send you a mini patch.


Regards,

Thomas



From: Filip Sneppe <filip.sneppe@cronos.be>
Subject: Re: /proc/net/ip_conntrack filling without ipt_conntrack.o loaded?
Date: 14 Jan 2003 14:43:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042551825.465.143.camel@xbox>
References: <20030114093711.GC9940@westend.com> 
	<20030114121232.GA3362@westend.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030114121232.GA3362@westend.com>
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
To: Christian Hammers <ch@westend.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2003-01-14 at 13:12, Christian Hammers wrote:
> Hello
> 
> I had ipt_conntrack.o loaded (see last mail) and then removed. But still
> my /proc/net/ip_conntrack got filled up.
> Then I did "echo '10000' > /proc/sys/net/ipv4/ip_conntrack_max" and it 
> still raised.
> Now, after waiting 10min or so the values are slightly falling (I had
> fear that it crashed when reaching 0xffff)..
> 
> Are the first two events signs for a bug or is it expected behaviour
> that somehow the conntrack code remains in the kernel even if the module
> has been removed?

You sure it's not due to a typo ? It's ip_conntrack.o, not
ipt_conntrack. After an rmmod, what does lsmod say ?

About the high nuber of tracked connections, are you
talking about /proc/net/ip_conntrack ?

Before thinking of a bug, you should get a clear view of
the type of traffic filling your connection tracking table.
broadcasts ? Are these primarily ESTABLISHED connections,
or UNREPLIED connections ? Are nimda infected IIS boxes
scanning the whole ipv4 address range through your machine ?
It takes only a couple of infected machines to generate a
lot of traffic.

So, what's the nature of the entries in /proc/net/ip_conntrack ?

Regards,
Filip
 




From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: TTL patch buggy?
Date: Wed, 7 Jan 2004 19:18:26 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401071918.26902.Antony@Soft-Solutions.co.uk>
References: <Pine.LNX.4.44.0401071709030.4717-100000@filer.marasystems.com> <1073502275.16972.10.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1073502275.16972.10.camel@jasiiitosh.nexusmgmt.com>
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

On Wednesday 07 January 2004 7:04 pm, John A. Sullivan III wrote:

> On Wed, 2004-01-07 at 11:16, Henrik Nordstrom wrote:
> >
> > The TTL target is dangerous in the sense that it allows the packet ttl to
> > be set freely with no restrictions. But if combined with a "-m ttl
> > --ttl-gt NEWVALUE" then you should be safe.
> >
> > Harald: What do you think about making the patch civilised and
> > restricting the TTL to be set to lower values only eleminating the need
> > of the above safeguard match? (simply change "new_ttl != iph->ttl" to
> > "new_ttl < iph->ttl")
> >
> > Regards
> > Henrik
>
> Thank you very much but could you please explain this a bit more.  Oskar
> Andreasson's tutorial explicitly mentions doing this, i.e., incrementing
> TTL and we thought it was a good idea.  We certainly want to change our
> ways if this is dangerous.  Here is the excerpt from the tutorial:
>
> The --ttl-inc option tells the TTL target to increment the Time To Live
> value with the value specified to the --ttl-inc option. This means that
> we should raise the TTL value with the value specified in the --ttl-inc
> option, and if we specified --ttl-inc 4, a packet entering with a TTL of
> 53 would leave the host with TTL 56. Note that the same thing goes here,
> as for the previous example of the --ttl-dec option, where the network
> code will automatically decrement the TTL value by 1, which it always
> does. This may be used to make our firewall a bit more stealthy to
> trace-routes among other things. By setting the TTL one value higher for
> all incoming packets, we effectively make the firewall hidden from
> trace-routes.

The whole point of the TTL field in IP headers in the first place was to avoid 
routing loops (small or large).

TTL gets decremented by every router a packet passes through, so that 
eventually after passing through some (larger than is reasonable for a normal 
journey) number of routers, the packet gets discarded.   In normal 
circumstances this does not happen, however when it does happen it is 
important that it happens correctly.

If you ever increase the value of TTL on a packet's journey through a router, 
then a routing loop involving that router will not be detected unless the 
number of other routers involved in the loop is at least as many as the 
amount you have increased the TTL by.

Therefore I would suggest that leaving TTL as it is (ie: not decrementing it, 
but not incrementing it either) on its way through a router is just about 
acceptable (and this will prevent the machien from showing up in traceroutes, 
which I understand is the requirement here?), but incrementing it so that its 
value on leaving a machine is any higher than it was on arriving at the 
machine is a Very Bad Idea(TM).

IMHO & YMMV, etc...

Antony.

-- 
This is not a rehearsal.
This is Real Life.

                                                     Please reply to the list;
                                                           please don't CC me.



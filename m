From: "Andrew Smith" <nfml@k1k2.com>
Subject: Re: 2.4.20-pre7: ip_conntrack: table full, dropping packet.
Date: Wed, 23 Oct 2002 10:15:50 +1000 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <38948.192.168.7.14.1035332150.squirrel@iw.k1k2.com>
References: <20021021215534.GB3039@naboo.club.berlin.ccc.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021021215534.GB3039@naboo.club.berlin.ccc.de>
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

> On Mon, Oct 21, 2002 at 08:16:44PM +0200, Stephan von Krawczynski
> wrote:
>> Hello all,
> 
> Hi Stephan. Don't know if you remember me, but we've met at some IN
> e.V. meetings in the past ;)
> 
>> After several days running kernel 2.4.20-pre7 I came across the
>> syslogged message:
>> 
>> kernel: ip_conntrack: table full, dropping packet.
>> 
>> This box runs about 10 rules for destination nat. My simple question:
>> is this a bug, or a need to tune something? If it is a bug, is there a
>> later kernel that has it fixed?
> 
> it's not about the number of NAT rules, but the number of connections
> going on through your machine.
> 
> the FAQ (to be found at www.netfilter.org) describes how to raise the
> number of connection tracking table entries.

Stephan,
The problem is that you will need to effectively allocate more memory
to iptables (increase the size of ip_conntrack_max)

If that is a problem, then you fall into a well known and much ignored
issue with iptables - connection timeout - that according to the
developers, is set to a value that will handle all possible networks
But funnily enough, as in your case, that isn't true, you must be
doing something wrong :-) :-) :-) like me :-)

Either increase ip_conntrack_max or modify the timeout constant for all
connections and recompile ... 

It would be good to be able to shorten the timeout for certain
services, but alas that won't happen unless you code/patch each release
yourself.

>> Regards,
>> Stephan

-- 
-Cheers
-Andrew

MS ... if only he hadn't been hang gliding!



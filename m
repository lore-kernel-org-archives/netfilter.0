From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Fairly complex multi-ISP firewall/router problem
Date: Fri, 2 Apr 2004 22:50:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404022250.54788.Antony@Soft-Solutions.co.uk>
References: <c4kjrg$lqm$1@gatekeeper.tmr.com> <1080941765.17616.61.camel@localhost>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1080941765.17616.61.camel@localhost>
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

On Friday 02 April 2004 10:36 pm, John A. Sullivan III wrote:

> On Fri, 2004-04-02 at 15:57, Bill Davidsen wrote:
> >
> > All I want to do is send packets out the interface which matches the
> > source IP, and I don't think there's any reasonable way to get there
> > without patches or BSD.
>
> Hmmm . . . I admit to not having tried this and only giving it five
> minute's thought but I'm not sure I see the problem.  Well, I see why
> one can't be guaranteed to send the packet out the same interface but
> I'm not sure why that is a problem.

Some ISPs block packets with source addresses not matching their own network 
range, as a contribution to blocking spoofed packets.

> In the case of an interface or ISP failure, I assume you would disable
> the interface which would eliminate the route.

That's not necessarily a difficult task (bringing it back up again afterwards 
is not entirely trivial, however), but if the problem can be solved without 
sending all outbound traffic across a single connection, and leaving the 
other one largely idle, it would be a better solution.

Regards,

Antony.

-- 
The idea that Bill Gates appeared like a knight in shining armour to lead all 
customers out of a mire of technological chaos neatly ignores the fact that 
it was he who, by peddling second-rate technology, led them into it in the 
first place.

 - Douglas Adams in The Guardian, 25th August 1995

                                                     Please reply to the list;
                                                           please don't CC me.



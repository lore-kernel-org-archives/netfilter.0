From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Questions on DNAT and pre/postrouting...
Date: Tue, 20 Jul 2004 22:15:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407202215.07675.Antony@Soft-Solutions.co.uk>
References: <Pine.LNX.4.44.0407201652340.20957-100000@signals10.bu.edu>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0407201652340.20957-100000@signals10.bu.edu>
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

On Tuesday 20 July 2004 10:02 pm, Jeffrey C Albro wrote:

> I understand how DNAT works in the prerouting change.  You change the
> destination and out the packet goes to the preferred server.  No problemo.
> But when the packet comes back, the failover box appears to SNAT the
> packet.  I've seen this referred as un-DNATing.

Correct.   If this did not happen then reply packets would not be routed 
correctly.

> It makes perfect sense that due to the client expecting packets back from
> the address it sent them to that this is required behavior, but can this be
> turned off or controlled?  I just found it odd that this happened with no
> iptables rules.

What do you mean - "this happened with no iptables rules"?   How are you doing 
DNAT with no iptables rules?

> What's up the the "no filtering" guideline for the PRE and POST routing
> chains?

PREROUTING and POSTROUTING chains have nat and mangle tables only; and things 
happen in the background (as you have already referred to above) in the nat 
and mangle tables.

Specifically, if you set any default policy other than ACCEPT on the nat or 
mangle tables, you will be very lucky if things work.

>  I'm doing it right now and it seems to work fine,

What are you doing?   What filtering rules do you have in the nat table (and 
why)?

> but WHY is this a problem, and how else would I do it?

Why is it a problem?   Hopefully explained above.

How else would you do it?   Put the filtering rules in the filtering tables, 
in the INPUT or FORWARD chains.

> It seems that it would result in a longer ruleset if I had to do this in the
> FORWARD chain.

So?

> Is lightning going to strike me down?

Who knows?  I think it depends mainly on where you live and how much time you 
spend outside :)

Regards,

Antony.

-- 
"I don't mind that he got rich, but I do mind that he peddles himself as the 
ultimate hacker and God's own gift to technology when his track record 
suggests that he wouldn't know a decent design idea or a well-written hunk of 
code if it bit him in the face. He's made his billions selling elaborately 
sugar-coated crap that runs like a pig on [sedatives], crashes at the drop of 
an electron, and has set the computing world back by at least a decade."

 - Eric S Raymond, about Bill Gates

                                                     Please reply to the list;
                                                           please don't CC me.



From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: safe default chain policies
Date: Fri, 2 Apr 2004 16:36:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404021636.30508.Antony@Soft-Solutions.co.uk>
References: <BAY16-F48j6fVCjmpp100021caf@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY16-F48j6fVCjmpp100021caf@hotmail.com>
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

On Friday 02 April 2004 4:21 pm, Philippe Anctil wrote:

> Hi Antony,
>
> I will leave the nat chains open. In fact I already did that yesterday. I
> really makes my life better.

I bet it does :)

> May I ask what are your arguments in favor of putting filter output and
> forward chains to drop?

Forward is easy - you do not want your machine forwarding any traffic other 
than what you've decided you want to allow, therefore you set the policy to 
DROP and then write ACCEPT rules for the traffic you want.

If you do it the other way around, and have a default ACCEPT policy with DROP 
rules to block the traffic you don't want, you might (a) forget something, 
(b) not know about something new, (c) make a mistake which stops your script 
loading the rules part-way through....  all sorts of reasons why the firewall 
would be insecure as a result.

Output is a little more questionable - some people say "the only applications 
which will generate packets are the ones I run, therefore I'm going to allow 
all traffic out of my system with a default ACCEPT policy on OUTPUT".

This is okay so long as you really are in control of your machine and you 
really do know what all the applications you run are going to get up to.

The secure attitude uses the same argument as for FORWARD - you block all 
traffic except that which you know you want and write ACCEPT rules for, and 
you can then be sure your machine isn't communicating in any other way than 
you want it to.

> As far as my understanding goes, the output chain is primarily important
> for traffic involving the firewall box itself.

No need for the work "primarily" there.   The OUTPUT chain is *only* for 
traffic coming from the firewall box itself.

> Once traffic passed the input chain, why wouldn't I want it to cross the
> output chain as well?

This suggests to me that you're not quite sure about how netfilter works:

INPUT is for packets coming in the the firewall and terminating there.
OUTPUT is for packets going out of the firewall (having originated on it).
FORWARD is for packets going through the firewall (either way).

One packet will go through only *one* of these chains.   No single packet will 
go through INPUT and FORWARD, or through INPUT and OUTPUT

> My reasoning is similar with the forward chain. If traffic is allowed
> through the input  chain, it is very likely it is allowed to cross the
> forward chain too.

See above.

> In other words, rules in OUTPUT and FORWARD appear redundant to me.

Take a look at one of the excellent diagrams which have been created to show 
how packets traverse the netfilter chains and tables.

Regards,

Antony.

-- 
If at first you don't succeed, destroy all the evidence that you tried.

                                                     Please reply to the list;
                                                           please don't CC me.



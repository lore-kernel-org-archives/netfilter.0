From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Bridge/VPN question.
Date: Wed, 23 Jun 2004 10:40:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406231040.40257.Antony@Soft-Solutions.co.uk>
References: <041201c45865$cb810cf0$c10da8c0@arvmobile> <200406231008.40635.Antony@Soft-Solutions.co.uk> <1087983028.7624.55.camel@dharmu.nsecure.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1087983028.7624.55.camel@dharmu.nsecure.net>
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

On Wednesday 23 June 2004 10:30 am, Dharmendra T. wrote:

> On Wed, 2004-06-23 at 14:38, Antony Stone wrote:
>
> > 1. You have a default DROP policy on FORWARD (good idea), and a rule
> > allowing packets to TCP port 25 on a specific server, but no rule
> > allowing replies back again.   Therefore no traffic gets *through* the
> > machine.
> >
> > 2. You have a default DROP policy on INPUT, and no rules in the INPUT
> > chain allowing anything at all, therefore no packets can get in (which
> > makes the rule in the OUTPUT chain allowing some packets out somewhat
> > pointless).
>
> Yes I agree. But these rules were given assuming that the user has given
> Required rulsets (Assuming means that the user can connect to the
> approved mail server. Please check the last mail to which I replied).

You said "Are there any other rules you have defined? If no, this may work:"

To me, that means that if the user does not have any other rules, then he 
should try these (the ones you posted).

I just wanted to avoid the original poster trying out a ruleset which could 
not possibly work (and if they were connected to the machine by SSH, would 
cut them off permanently, too).

Regards,

Antony.

-- 
You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

                                                     Please reply to the list;
                                                           please don't CC me.



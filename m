From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Help with ICMP Ruls
Date: Thu, 15 Jul 2004 20:32:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407152032.54234.Antony@Soft-Solutions.co.uk>
References: <20040715192110.11412.qmail@web40702.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040715192110.11412.qmail@web40702.mail.yahoo.com>
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

On Thursday 15 July 2004 8:21 pm, Real Cucumber wrote:

> > I would allow the firewall to send ICMP messages through its OUTPUT chain,
> > and if it can generate any connections from itself, then you should allow
> > them in through the INPUT chain as well, however you say you do not allow
> > outgoing connections (not even DNS??), so this may not be needed.
>
> The fedora box doesn't do dns or anything. It's sole purpose is a packet
> forwarding router that doesnt' allow any input or output, just forwards.
>
> That is why I'm not sure if I need ICMP supported on it or not, and not sure
> where do add the ICMP support (input, output, forward).

I would allow the machine to forward ICMP messages which are RELATED to the 
existing SSH sessions, so that means the rule should go in the FORWARD chain.

If you want more specific advice, please post the current ruleset.

Regards,

Antony.

-- 
In Heaven, the police are British, the chefs are Italian, the beer is Belgian, 
the mechanics are German, the lovers are French, the entertainment is 
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is American, 
the mechanics are French, the lovers are Swiss, the entertainment is Belgian, 
and everything is organised by the Italians.

                                                     Please reply to the list;
                                                           please don't CC me.



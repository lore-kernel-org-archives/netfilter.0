From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: wireless security
Date: Thu, 10 Jun 2004 14:28:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406101428.46072.Antony@Soft-Solutions.co.uk>
References: <0b5b01c44ee2$f2e7cef0$49caa8c0@caris.priv>
Reply-To: "netfilter" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0b5b01c44ee2$f2e7cef0$49caa8c0@caris.priv>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thursday 10 June 2004 1:03 pm, Peter Marshall wrote:

> Hi guys,
>
> I am sure someone has been faced with this problem, and I was just
> wondering what the possible solutions are.  A city wide free wireless
> network has just expanded to cover the area encompassing our building.  The
> provider of this is also the provider of our Internet (via fiber).  It was
> decided that it would be advantageous for some of our employees to be able
> to use this wireless network when we bring in clients etc.  This of course
> opens a large possibility of problems concerning crap getting onto our
> network (especially if they are connected to wireless and plugged into the
> network).
>
> We have made it a policy that a personal firewall be installed on all
> firewalls, and that at no time is a wireless card to be plugged into a
> laptop while connected to our LAN.  This of course does not do much for
> internal cards ....
>
> Is there anyway at all that I can firewall this ?  Or is there a way o
> prevent the two networks from being active at the same time .. I am at a
> bit of a loss here.

A firewall can only filter traffic which passes through it.   Therefore if you 
are worried about traffic from someone else's wireless client, routing 
through a wireless client on your premises, and thence getting in to your 
wired network, your firewall (currently positioned, I would guess, between 
your wired network and your Internet link) can do nothing to stop such 
traffic.   It doesn't come in to your network through the firewall, so the 
firewall can't stop it.

If you do enforce a policy that no machine is allowed to have simultaneous 
connections to the wireless and wired networks, as well as having a firewall 
on each wireless machine, you shouldn't have a problem, however I'd still 
think about putting an IDS of some sort (such as Snort) onto your internal 
network as a way of keeping an eye on any strange traffic which does turn up.

Regards,

Antony.

-- 
"It would appear we have reached the limits of what it is possible to achieve 
with computer technology, although one should be careful with such 
statements; they tend to sound pretty silly in five years."

 - John von Neumann (1949)

                                                     Please reply to the list;
                                                           please don't CC me.



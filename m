From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problem: ISA card & iptables (2.4.26) - disappearing packets
Date: Sun, 18 Jul 2004 11:40:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407181140.35100.Antony@Soft-Solutions.co.uk>
References: <40F8D503.3040608@polbox.com> <200407180939.37668.Antony@Soft-Solutions.co.uk> <40F8E16B.2020808@polbox.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40F8E16B.2020808@polbox.com>
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

On Saturday 17 July 2004 9:20 am, adderek wrote:

> > 1. I really can't see this is a netfilter problem.
>
> I thought that if packets are bypassing kernel (and iptables in it) then
> it will be IPtables problem.

Not when the exact same configuration works with a different card, also known 
to netfilter as eth0.

If you get the problem with the card, and not with a different card, then the 
card is causing the problem.

It cannot be a netfilter problem because you are not changing anything in 
netfilter to make the problem come and go.

> > 3. Have you checked the interrupts & I/O address range in use by the ISA
> > card, and whether they conflict with something else in the machine?
>
> It's ISA PnP card so it's autoconfigured. I've checked and there is no
> conflicts :(

Are you sure it is actually being fully configured?   Are you doing the PnP 
setup in the Bios, or under Linux?

If you take netfilter and the other two PCI cards completely out of the 
equation (ie: unplug the other cards, and set netfilter to default ACCEPT on 
all chains with no ruleset), can you communicate with the system at all 
through this card?

Regards,

Antony.

-- 
This email is intended for the use of the individual addressee(s) named above 
and may contain information that is confidential, privileged or unsuitable 
for overly sensitive persons with low self-esteem, no sense of humour, or 
irrational religious beliefs.

If you have received this email in error, you are required to shred it 
immediately, add some nutmeg, three egg whites and a dessertspoonful of 
caster sugar.   Whisk until soft peaks form, then place in a warm oven for 40 
minutes.   Remove promptly and let stand for 2 hours before adding some 
decorative kiwi fruit and cream.   Then notify me immediately by return email 
and eat the original message.

                                                     Please reply to the list;
                                                           please don't CC me.



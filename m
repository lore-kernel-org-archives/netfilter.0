From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problem: ISA card & iptables (2.4.26) - disappearing packets
Date: Sun, 18 Jul 2004 09:39:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407180939.37668.Antony@Soft-Solutions.co.uk>
References: <40F8D503.3040608@polbox.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40F8D503.3040608@polbox.com>
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

On Saturday 17 July 2004 8:28 am, adderek wrote:

<much detail snipped>

> I had already configured firewall/router (based on debian distribution
> is has only a few things in common with debian).
>
> At first I've configured everything with my old PCI cards.
> After everything worked fine I've changed eth0 to ISA card.
>
> After changing my PCI card to ISA card firewall gone down :(
>
> Can somebody tell me what is happening?
>
> Configuration is the same in both cases. Only network cards differ.
> Both cards are working fine (cause 'tcpdump' is giving me an output).

1. I really can't see this is a netfilter problem.

2. I don't agree with your reasoning that "both cards are working fine because 
tcpdump is giving me an output" - everything else indicates that the ISA card 
is not working fine, because with this in place you have problems; swapping 
for a PCI you do not have problems.

3. Have you checked the interrupts & I/O address range in use by the ISA card, 
and whether they conflict with something else in the machine?

Regards,

Antony

-- 
I don't know, maybe if we all waited then cosmic rays would write all our 
software for us. Of course it might take a while.

 - Ron Minnich, Los Alamos National Laboratory

                                                     Please reply to the list;
                                                           please don't CC me.



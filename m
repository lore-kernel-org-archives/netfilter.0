From: adderek <adderek@polbox.com>
Subject: Re: Problem: ISA card & iptables (2.4.26) - disappearing packets
Date: Sat, 17 Jul 2004 12:18:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F8FCEB.90300@polbox.com>
References: <40F8D503.3040608@polbox.com> <200407180939.37668.Antony@Soft-Solutions.co.uk> <40F8E16B.2020808@polbox.com> <200407181140.35100.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407181140.35100.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

(...)

> Are you sure it is actually being fully configured?   Are you doing the PnP 
> setup in the Bios, or under Linux?

I'm just executing 'modprobe ne' under linux. It requires module '8390'.
And that's all. In bios I have configured some IRQ's to 'Legacy ISA PnP'


> If you take netfilter and the other two PCI cards completely out of the 
> equation (ie: unplug the other cards, and set netfilter to default ACCEPT on 
> all chains with no ruleset), can you communicate with the system at all 
> through this card?

I'll check this in a moment.
But if I can remember I can communicate with this router - it's
answering to my ping requests.
	ping 10.0.0.1
made from 10.0.0.2 machine sometime works and sometime do not.
I'm recompilling my kernel at the moment so I'll check it in a while...


Regards
---
Adderek




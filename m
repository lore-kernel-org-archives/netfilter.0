From: adderek <adderek@polbox.com>
Subject: Re: Problem: ISA card & iptables (2.4.26) - disappearing packets
Date: Sat, 17 Jul 2004 10:20:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F8E16B.2020808@polbox.com>
References: <40F8D503.3040608@polbox.com> <200407180939.37668.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407180939.37668.Antony@Soft-Solutions.co.uk>
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

> 1. I really can't see this is a netfilter problem.

I thought that if packets are bypassing kernel (and iptables in it) then 
it will be IPtables problem.


> 2. I don't agree with your reasoning that "both cards are working fine because 
> tcpdump is giving me an output" - everything else indicates that the ISA card 
> is not working fine, because with this in place you have problems; swapping 
> for a PCI you do not have problems.

OK. I'll check it on another ISA card as soon as I get one.


> 3. Have you checked the interrupts & I/O address range in use by the ISA card, 
> and whether they conflict with something else in the machine?

It's ISA PnP card so it's autoconfigured. I've checked and there is no 
conflicts :(


> Regards,
> 
> Antony
> 



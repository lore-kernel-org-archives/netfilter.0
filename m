From: Scott Lampert <scott@lampert.org>
Subject: Re: NAT performance using tlan driver
Date: Wed, 2 Oct 2002 11:48:46 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021002184846.GA5581@cobalt.heavymetal.org>
References: <E62DA5621A6FF646BAB7B7A469FEBAEB4454@fs03.lv0.custcare.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <E62DA5621A6FF646BAB7B7A469FEBAEB4454@fs03.lv0.custcare.com.au>
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
Content-Transfer-Encoding: 7bit
To: Dave McCrudden <dmccrudden@bigpond.com>
Cc: netfilter@lists.netfilter.org

On Wed, Oct 02, 2002 at 09:44:07AM +1000, Dave McCrudden wrote:
> Hi All,
> 
> I know this is probably specifically related to the NIC, however I
> would appreciate any advice.
> 
> I have had some trouble getting my Compaq Netelligent Dual 10/100TX
> PCI card working well under Kernel version 2.4.19, Iptables version
> 1.2.7a (no pom). I have tried compiling iptables and the driver as
> modules and static. The machine is a Compaq Proliant 7000 with Dual
> P200 pro.
>  
> The driver compiles, loads and appears to work fine. Performance is
> fine if I connect to the Net directly via the external interface
> download browse etc, I can also connect from another machine to the
> internal interface and transfer via ssh,samba etc and speed is fine.
> The problem is the speed when masquerading connections using iptables,
> the highest speed I have seen is 6kb/s and it slows down from there to
> almost 0. I have tried forcing half/full duplex.
>  
> I tested another Compaq card and the same thing happens.  However if I
> use 2 NE2000 compatible cards the performance is fine, well above
> 500kb/s from the masq'd clients.. which makes me assume it is a tlan
> driver problem. 
> 
> I have asked the tlan devel mail list, however I haven't seen an
> reply. I would be interested to hear any suggestions or experiences
> from other people.

I don't have a solution but I have the exact same card with the same
setup but running in a PIII-850 noname system and it works great here.
I can routinely pull 350K/s off of a cable connection through NAT on
this card so its most likely not a tlan issue but some sort of hardware
or hardware combination issue.  The only extra thing I had to do was
force the speed and duplex on the port plugged into the cable modem as
it uses a crossover and doesn't negotiate that information.  Did you try
moving the card into different pci slots?  Maybe you have an irq issue.
The card grabs up two irqs in one pci slot.
    -Scott

-- 
Scott Lampert
<scott@lampert.org>
"They that can give up essential liberty to obtain a little temporary
safety deserve neither liberty nor safety."
-Benjamin Franklin, 1759

Public Key: http://www.lampert.org/public_key.asc


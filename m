From: Donato Diaz <donatodd@itcsoluciones.com>
Subject: Re: iptables and SMP performance
Date: Wed, 26 Jan 2005 12:13:59 -0300
Message-ID: <41F7B3B7.8070205@itcsoluciones.com>
References: <1106588554.8961.41.camel@d-phiggins-lnx.rovingplanet.com>	<1106611098.5057.61.camel@hubcap.ljm.dom>
	<1106612040.13691.36.camel@d-phiggins-lnx.rovingplanet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106612040.13691.36.camel@d-phiggins-lnx.rovingplanet.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Patrick Higgins <phiggins@rovingplanet.com>
Cc: netfilter@lists.netfilter.org

I have a similar problem 100% softirq. My system have one  CPU Pentim IV 
2.4 Ghz,  five NICs, four Gig cards Broadcom and one 10/100 3Com 3C95x.
It has 800 subnetworks (alias) mixing private and public networks. The 
system does NAT and Traffic Control (HTB) only for the private networks. 
And only routing packets for the public networks. I'm not doing 
bridging, packets are forwarding through layer 3.
I'm trying to find a way to improve the performace. I find IRQ-Affinity 
and NAPI. I would like to know if you gain any performance improvement 
using smp_affinity. Could you send me the results of your test.

Thanks
Donato.


Patrick Higgins wrote:

>Thanks for the response. We've also found the Intel NICs are the best,
>and that's what we're using. I believe the server I'm testing on has two
>onboard and a quad-port expansion card (fiber, I think). Here's my
>lspci:
>
>00:00.0 Host bridge: Intel Corp. E7501 Memory Controller Hub (rev 01)
>00:00.1 Class ff00: Intel Corp. E7500/E7501 Host RASUM Controller (rev 01)
>00:03.0 PCI bridge: Intel Corp. E7500/E7501 Hub Interface C PCI-to-PCI Bridge (rev 01)
>00:03.1 Class ff00: Intel Corp. E7500/E7501 Hub Interface C RASUM Controller (rev 01)
>00:1d.0 USB Controller: Intel Corp. 82801CA/CAM USB (Hub #1) (rev 02)
>00:1d.1 USB Controller: Intel Corp. 82801CA/CAM USB (Hub #2) (rev 02)
>00:1e.0 PCI bridge: Intel Corp. 82801 PCI Bridge (rev 42)
>00:1f.0 ISA bridge: Intel Corp. 82801CA LPC Interface Controller (rev 02)
>00:1f.1 IDE interface: Intel Corp. 82801CA Ultra ATA Storage Controller (rev 02)00:1f.3 SMBus: Intel Corp. 82801CA/CAM SMBus Controller (rev 02)
>01:0c.0 VGA compatible controller: ATI Technologies Inc Rage XL (rev 27)
>02:1c.0 PIC: Intel Corp. 82870P2 P64H2 I/OxAPIC (rev 04)
>02:1d.0 PCI bridge: Intel Corp. 82870P2 P64H2 Hub PCI Bridge (rev 04)
>02:1e.0 PIC: Intel Corp. 82870P2 P64H2 I/OxAPIC (rev 04)
>02:1f.0 PCI bridge: Intel Corp. 82870P2 P64H2 Hub PCI Bridge (rev 04)
>03:07.0 Ethernet controller: Intel Corp. 82546EB Gigabit Ethernet Controller (Copper) (rev 01)
>03:07.1 Ethernet controller: Intel Corp. 82546EB Gigabit Ethernet Controller (Copper) (rev 01)
>03:08.0 RAID bus controller: LSI Logic / Symbios Logic MegaRAID (rev 01)
>03:09.0 Ethernet controller: Intel Corp. 82546GB Gigabit Ethernet Controller (rev 03)
>03:09.1 Ethernet controller: Intel Corp. 82546GB Gigabit Ethernet Controller (rev 03)
>03:0a.0 Ethernet controller: Intel Corp. 82546GB Gigabit Ethernet Controller (rev 03)
>03:0a.1 Ethernet controller: Intel Corp. 82546GB Gigabit Ethernet Controller (rev 03)
>04:07.0 SCSI storage controller: Adaptec AIC-7902 U320 (rev 03)
>04:07.1 SCSI storage controller: Adaptec AIC-7902 U320 (rev 03)
>
>Is the PCI-X bus the first number (03 in the case of the ethernet
>controllers)? If so, it looks like they're all on the same bus. Can this
>be changed in software? I'm not sure if I can physically move the
>expansion card (2U case).
>
>We currently ship the Intel drivers, but I've been using the stock
>2.4.28 and 2.6.10 and Red Hat EL 3 kernels for my testing. My goal has
>been to involve multiple CPUs somehow, and it doesn't sound like the
>Intel driver will help with that. Correct?
>
>I'm currently looking into using ethernet bonding and IRQ smp_affinity
>settings to distribute the load across two interfaces and CPUs. It looks
>promising--I'll gladly send the results to anyone who is interested.
>
>On Mon, 2005-01-24 at 18:58 -0500, Jason Opperisano wrote:
>  
>
>>On Mon, 2005-01-24 at 12:42, Patrick Higgins wrote:
>>    
>>
>>>Any suggestions?
>>>      
>>>
>>have you considered (or are you already using) better NICs?  this is
>>mostly hearsay gleaned from listening to the developers on various lists
>>(netfilter-dev and openbsd-misc), but certain cards seem to be more
>>"interrupt heavy" than others.  the ones that seemed to get bashed the
>>most are the broadcom cards, and the ones that seem to receive the most
>>praise are the intel gigabit server adapters (i assume you are using
>>gigE adapters regardless of the speed of your links, i further assume
>>that these gigE cards are plugged into independent 64-bit PCI-X buses). 
>>also--if you're already using the intel gigE cards--are you using the
>>less "free-as-in-speech" but less buggy and better performing driver
>>from intel vs. the one that RH ships with their kernel?
>>
>>just a few thoughts outside the "we need more CPU" box...as i have never
>>been under the impression that something like an in-kernel packet filter
>>could benefit from multiple CPUs (other than the fact that you can bind
>>all non-kernel processes to other CPU, for a minimal 10% or so
>>performance gain).
>>
>>-j
>>
>>--
>>"If something is to hard to do, then it's not worth doing."
>>	--The Simpsons
>>
>>
>>    
>>
>
>
>  
>




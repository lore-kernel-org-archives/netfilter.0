From: Dennis Jacobfeuerborn <dennisml@conversis.de>
Subject: Re: Recommended hardware for iptables based firewall/router
Date: Sun, 09 Nov 2014 01:40:36 +0100
Message-ID: <545EB804.3080903@conversis.de>
References: <5455AA40.6050302@conversis.de> <201411021738.56897.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201411021738.56897.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: neal.p.murphy@alum.wpi.edu, netfilter@vger.kernel.org

On 02.11.2014 23:38, Neal Murphy wrote:
> On Saturday, November 01, 2014 11:51:28 PM Dennis Jacobfeuerborn wrote:
>> Hi,
>> we recently bought an Uqbiquity EdgeRouter Pro but it seems the claims
>> about 2 Mio. pps that it should be able to handle are not real-world
>> numbers. We are running about 120mbit through this system and are
>> already seeing the two risc cores struggling with high softirq load and
>> packet drops.
>>
>> So my question is what a good hardware base would look like for a linux
>> based firewall using iptables/conntrack/ipset. Do offload features help
>> or can't these be used because iptables needs to process the packets
>> anyway? I assume multiqueuing would be nice too.
>> The idea is to be able to actually process 1gbit of traffic i.e. handle
>> two gbit ports (WAN and LAN) at wire-speed.
>>
>> Does anyone have any specific recommendations for NICs and maybe tips
>> for other bottlenecks to look out for?
> 
> I've been using a Lanner 7530 for some time now (the 7525 is the current 
> 'replacement' for it); it runs the recently released Smoothwall 3.1 firewall*. 
> Basically, a dual-core 1.6GHz Atom CPU with Intel NICs and 64MiB RAM can 
> saturate four gigE links long term using 17-25W.
> 
> If you want more than netfilter (such as squid, snort, clamav, et al.), you'll 
> want 1-2 GiB RAM and faster CPUs. And maybe more CPUs. If you want VPNs IPSEC 
> and/or OpenVPN), you'll need at least faster CPUs.
> 
> Offload features usually preclude proper operation of netfilter.
> 
> GigE PCI NICs usually top out at 250-350Mb/s (limited by the PCI bus).
> 
> Intel NICs are generally the best. (I believe their lineage goes back to DEC, 
> which might explain it.) RealTek's offerings of the last five years or so are 
> also pretty good.

After seeing the EdgeRouter not being able to handle the promised
capacity even remotely I'm a bit suspicious of these "embedded"
solutions. These processors only seem to be able to handle a decent
amount of traffic in a pure routing best case scenario. I get the
impression that as soon as you do add a bit of firewalling they need to
fall back to slow execution paths and then the cpu's are seriously
underpowered.

But then it might just be the EdgeRouter that is especially terrible. We
immediately ran into problems when I found out that they had *reduced*
the size of the connection tracking table to 16k entries from the
default 64k. I cannot imagine why anyone would do this for a system that
is designed to be a firewall.

Regards,
  Dennis



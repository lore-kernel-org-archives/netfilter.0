From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: IPv6 routing
Date: Mon, 30 Aug 2010 13:48:29 +0100
Message-ID: <4C7BA89D.8030509@abpni.co.uk>
References: <4C7B8741.3030908@abpni.co.uk> <4C7B89EB.7090807@abpni.co.uk>	 <alpine.LNX.2.01.1008301242380.15716@obet.zrqbmnf.qr>	 <4C7B8BD2.1060009@abpni.co.uk>  <4C7B91A2.50707@abpni.co.uk>	 <1283171041.16291.63.camel@enterprise.ims-firmen.de>	 <4C7BA51D.8030004@abpni.co.uk> <1283172453.16291.84.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1283172453.16291.84.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Jacob <jacob@internet24.de>, netfilter@vger.kernel.org


On 30/08/10 13:47, Thomas Jacob wrote:
> On Mon, 2010-08-30 at 13:33 +0100, Jonathan Tripathy wrote:
>    
>> But ah well. I'm sure netfilter will have ndptables some day. We're only
>> testing IPv6 at the minute anyway.
>>      
> Well, it will probably be an ip6tables module, since in IPv6
> the link layer resolution protocol is actually built on top
> of IPv6 icmp, rather than being an independent layer 3 protocol
> as ARP is.
>    
Ah yes, that sounds more likely
>> And we've got iptables which will
>> prevent any non-icmp traffic from working, as well as ebtables to
>> prevent MAC spoofing.
>>      
> Out of curiosity, what exactly are you trying to filter with your
> bridge? Is the bridge running on the VPS host, and each
> virtual machine has it's own virtual network interface?
>
>    
That's correct. I'm making use of physdev a lot

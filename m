From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: Force traffic
Date: Sun, 13 Jun 2010 19:17:08 +0100
Message-ID: <4C1520A4.6060606@abpni.co.uk>
References: <4C1513F3.5010508@abpni.co.uk> <alpine.LSU.2.01.1006132013330.20055@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1006132013330.20055@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org


On 13/06/10 19:15, Jan Engelhardt wrote:
> On Sunday 2010-06-13 19:22, Jonathan Tripathy wrote:
>
>    
>> Hi Everyone,
>>
>> Does anyone know any rules that I could use (using iptable, ebtables,
>> or otherwise) that could force all traffic coming from an interface to
>> go out via a particular interface?
>>      
> For link/ether, you have to specify a target to send to. Just interface
> won't cut it.
>
>    
>> I am lead to believe that in a linux bridge, all frames are sent to all
>> ports (a bit like the old-school hubs), so it could just be a matter of
>> blocking all traffic, except those which are for the firewall
>> interface, using ebtables.
>>      
> btw, a bridge/switch is not a hub/electrical repeater by its very definition.
>    
Is there any way to do what I want to achieve with ebtables then?

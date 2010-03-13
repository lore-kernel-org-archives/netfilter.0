From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: drop dhcp request from a particular mac address, after a dhcp
 relay
Date: Sat, 13 Mar 2010 09:10:08 +0100
Message-ID: <4B9B4860.5010509@chello.at>
References: <937499.80494.qm@web31506.mail.mud.yahoo.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <937499.80494.qm@web31506.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 12.03.2010 03:27, netfilter-owner@vger.kernel.org wrote:
> --- On Wed, 3/10/10, Robert Nichols <rnicholsNOSPAM@comcast.net> wrote:
> 
>  :-
>>>
>>>     iptables ..... -m bootp --mac-source
>> 00:08:a1:ab:75:d1 -j DROP ?
>>>
>>> Well, if 'iptables' can't serve the purpose, how about
>> ebtables ?
>>
>> Wouldn't it be a lot easier to adjust the DHCP server's
>> configuration by
>> adding a "deny" statement in the pool's permit list?
>>
> 
> True but manually editing the configuration file will require the dhcp server to be restarted, whereas 'iptables' and/or 'ebtables' can be scripted at runtime.
> 
> Cheers. 
> 

most likely the dhcp server should have a 'reload' parameter?
actually adding/inserting/deleting iptables rules does just the same (as
a service restart). the whole ruleset inside the kernel gets reloaded
for every single 'runtime' command you place. that is why there is
iptables-restore, which loads all rules at once.

Best regards


Mart

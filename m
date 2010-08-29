From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: ebtables and anti-spoofing rules not working 100%?
Date: Sun, 29 Aug 2010 18:25:57 +0100
Message-ID: <4C7A9825.9080602@abpni.co.uk>
References: <4C7A67B3.4070505@wpkg.org> <4C7A7CB7.9020701@plouf.fr.eu.org> <4C7A8EED.9060203@wpkg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C7A8EED.9060203@wpkg.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tomasz Chmielewski <mangoo@wpkg.org>, netfilter@vger.kernel.org


On 29/08/10 17:46, Tomasz Chmielewski wrote:
> On 29.08.2010 17:28, Pascal Hambourg wrote:
>
>>> # guest communication with the gateway
>>> ebtables -A INPUT -i vmtab107i0 -j vm107
>>> ebtables -A OUTPUT -o vmtab107i0 -j vm107
>>
>> Do you need to prevent spoofing by the host itself ?
>
> Host is "trusted", so it doesn't need any additional measures.
> Guests, on the other hand, are to be "untrusted".
>
>
>>> What anti-spoofing rules I need to have to prevent some kvm guests
>>> pretending to be other kvm guests (or, even pretending to be 
>>> "gateways")?
>>
>> Just create rules called from INPUT and FORWARD which match the input
>> interface (bridge port) and the MAC and IP source address.
>>
>> ebtables -A INPUT -i vmtab107i0 -j vm107
>> ebtables -A FORWARD -i vmtab107i0 -j vm107
>>
>> ebtables -A vm107 -p IPv4 -s 11:22:33:44:55:66 --ip-src 1.2.3.4 \
>>    -j ACCEPT
>> ebtables -A vm107 -p ARP -s 11:22:33:44:55:66 \
>>    --arp-mac-src 11:22:33:44:55:66 --arp-ip-src 1.2.3.4 -j ACCEPT
>
> With these rules, I'm not able to communicate (i.e. ping) with other 
> hosts in the same subnet, except the gateway (although this was the 
> same with my previous rules, I think).
>
>
> Also, if I do this on the "rogue" guest (with MAC, IP belonging to the 
> "other" guest):
>
> ifconfig eth0 hw ether AA:BB:CC:DD:EE:FF
> ifconfig eth0 1.2.3.22
>
>
> any communication to the "other" still breaks (from external hosts). 
> So, no improvement.
>
>
Why do you need to use the INPUT chain with ebtables in a VM 
environment? In my ebtables setup, I have INPUT to drop everything, 
except stuff from/to the loopback interface (lo)

Cheers

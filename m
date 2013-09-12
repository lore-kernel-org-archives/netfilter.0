From: Tom van Leeuwen <tom.van.leeuwen@saasplaza.com>
Subject: Re: router and masquerade
Date: Thu, 12 Sep 2013 17:29:36 +0200
Message-ID: <5231DDE0.6070305@saasplaza.com>
References: <CAKnRR0ZrEyKL1oQTLiP8AoWhoC7kyTajbzboHdPn6-9RLxoBtA@mail.gmail.com> <523088AA.3050509@saasplaza.com> <CAKnRR0bfVCa9x_cXSmzp2kV4TggC_3ckiMHmqgF3cZDw4cB=fw@mail.gmail.com> <5231DB7D.1090601@saasplaza.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5231DB7D.1090601@saasplaza.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: budi wibowo <bwibowo@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I'm thinking that maybe rp_filter (reverse path filter) is biting you, 
especially since you have multiple upstream providers.

Please check current setings:
sysctl -a 2>/dev/null | grep '\.rp_filter'

And set them to zero (for the appropriate) interfaces:
sysctl -a 2>/dev/null | grep '\.rp_filter' | while read key rest ; do 
sudo sysctl $key=0;done

This is what an interface looks like in my ubuntu12.04 bgp server:
auto eth0
iface eth0 inet static
  address 1.1.1.1
  netmask 255.255.255.0
  ip-proxy-arp 0
  ip-rp-filter 0

Kind regards,
Tom

On 09/12/2013 05:19 PM, Tom van Leeuwen wrote:
> Hi Budi,
>
> I have experience running ubuntu10.04 and ubuntu12.04 as BGP routers and
> it works perfectly.
> They are not doing any NAT.
>
> It must be your configuration.
>
> Kind regards,
> Tom van Leeuwen
>
> On 09/12/2013 06:29 AM, budi wibowo wrote:
>> outside IP is 8.8.8.8 google DNS.
>> the ubuntu running BIRD for BGP and bgp connection is established.
>> for ubuntu all search result after enable ip forwarding then do masquerade.
>> and then i conclude that ubuntu cant be used as BGP core router, only
>> can do routing is interface is masquerade.
>> change OS to freebsd 9.1 and everything is working perfectly.
>> Bird is working and no Nat required
>>
>>
>> On Wed, Sep 11, 2013 at 10:13 PM, Tom van Leeuwen
>> <tom.van.leeuwen@saasplaza.com> wrote:
>>> With "outside" you mean an ip on internet?
>>> What IP address does your client have that you don't want to MASQUERADE.
>>>
>>> Sounds like the outside world doesn't have a route to get back to your
>>> client.
>>>
>>> Regards,
>>> Tom
>>>
>>>
>>> On 09/09/2013 01:41 AM, budi wibowo wrote:
>>>> Hi
>>>> i have question and i hope the question is on the right list .
>>>>
>>>> i setup PC router running on ubuntu 10.12, since it is router all IP
>>>> address are public IP.
>>>> Topology will be like this
>>>>
>>>>
>>>>
>>>> Router_to_Intl             Router_to_local_IX
>>>>           |                                   |
>>>>           |                                   |
>>>>           |                                   |
>>>>           |                                   |
>>>>            \                                 /
>>>>              \                              /
>>>>                \                           /
>>>>                  \                        /
>>>>                   \                     /
>>>>               Distribution Router
>>>>                             |
>>>>                             |
>>>>                        Client
>>>>
>>>> on Router_to_Intl i have define rule to ACCEPT all INPUT OUTPUT and
>>>> FORWARD
>>>> chain, also have enable ip_forward in sysctl.
>>>> the result is client cant ping outside, but when i define MASQUERADE, ping
>>>> and connection to internet are working normally.
>>>> i dont want masquerade happen in this case
>>>>
>>>>
>>>> anything missing on my configuration?
>>>>
>>>> Regards
>>>>
>>>> Budi Wibowo
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


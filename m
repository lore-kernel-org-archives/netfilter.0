From: A <publicface@bak.rr.com>
Subject: Re: SV: using iptables to route between subnets
Date: Fri, 16 Feb 2018 08:13:09 -0800
Message-ID: <fe87194b-e3f2-f957-7591-c79bc5281358@bak.rr.com>
References: <9835afd2-74b0-e5a8-e812-898869b06ad3@bak.rr.com>
 <411ef751-4f31-ea17-ad54-235d4ef308e1@bak.rr.com>
 <22891e20-2bc6-bcc7-dac1-6ceb22010fea@trustiosity.com>
 <8d3b841e-4de6-b478-8fb9-2231ad280730@bak.rr.com>
 <41952bf0a8c7405c8d6f737d57ad1635@CCDEX023.corp.corpcommon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <41952bf0a8c7405c8d6f737d57ad1635@CCDEX023.corp.corpcommon.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

# sudo sysctl net.ipv6.conf.all.forwarding
net.ipv6.conf.all.forwarding = 1


On 02/16/2018 01:08 AM, André Paulsberg-Csibi (IBM Consultant) wrote:
> Just one question , have you set the "net.ipv4.ip_forward" to 1 ( check with command ) :
>
> "sudo sysctl net.ipv4.ip_forward"
>
>
> Best regards
> André Paulsberg-Csibi
> Senior Network Engineer
> IBM Services AS
>
> -----Opprinnelig melding-----
> Fra: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel.org] På vegne av A
> Sendt: fredag 16. februar 2018 06.53
> Til: netfilter@vger.kernel.org
> Emne: Re: using iptables to route between subnets
>
>
>
> On 02/15/2018 08:15 PM, zrm wrote:
>> On 02/15/2018 09:25 PM, A wrote:
>>> I am trying to route packets between two internal/private subnets
>>> 10.1.1.0/24 and 10.1.2.0/24 .  The second subnet happens to be wireless.
>>>
>>> I've read until my eyes bled and have been at this for several days.
>>> I've tried a variety of different ways based on other's similar
>>> posted attempts, and at this point things are a mess as you will see
>>> below.  In addition to simple routing, I need to get my wireless
>>> printer working too, which is essentially the real reason I'm doing
>>> this, and I'm hoping that issue will be resolved by this as well.
>>>
>>>
>>> This is a diagram of my network:
>>> https://www.lucidchart.com/documents/edit/58779470-32c0-407d-8111-0b0
>>> 74b35ff4d/0?shared=true
>>>
>>>
>>> These are the relevant rules:
>>>
>>> iptables-save -c | grep RULE
>>>
>>>
>>> [1:40] -A PREROUTING -i enp6s0 -p tcp -m multiport --dports 80,443 -m
>>> comment --comment "RULE 1; in WAN port 80,443; rewrite dst as LAN
>>> address" -j DNAT --to-destination 10.1.1.1 [1:328] -A PREROUTING -d
>>> 10.1.2.0/24 -m comment --comment "RULE 1A; if source WLAN rewrite as
>>> LAN address" -j NETMAP --to 10.1.1.0/24 [26:3083] -A POSTROUTING -s
>>> 10.1.0.0/16 -o enp6s0 -m comment --comment "RULE 2; after routing
>>> rewrite to WAN address iff src LAN or WLAN, out WAN" -j MASQUERADE
>>> [183:72318] -A FORWARD -i enp6s0 -o wlp2s0 -m conntrack --ctstate
>>> RELATED,ESTABLISHED -m comment --comment "RULE 3; in WAN; out
>>> wireless, iff established." -j ACCEPT [0:0] -A FORWARD -d 10.1.1.0/24
>>> -i wlp2s0 -o enp4s5 -m comment --comment "RULE 4; in wireless out
>>> LAN; iff dst LAN" -j ACCEPT [324:69828] -A FORWARD -s 10.1.0.0/16 !
>>> -d 10.1.0.0/16 -o enp6s0 -m comment --comment "RULE 5; src LAN or
>>> WLAN, dst not LAN nor WLAN, out WAN" -j ACCEPT [0:0] -A FORWARD -s
>>> 10.1.2.0/24 ! -d 10.1.0.0/16 -o enp6s0 -m comment --comment "RULE 5w;
>>> src WLAN out WAN, iff dst not WLAN nor LAN" -j ACCEPT [0:0] -A
>>> FORWARD -s 10.1.0.0/16 -d 10.1.2.0/24 -o wlp2s0 -m comment --comment
>>> "RULE 8; src LAN or WLAN, dst WLAN, out WLAN" -j ACCEPT [1:76] -A
>>> FORWARD -d 10.1.1.0/24 -i enp6s0 -o enp4s5 -m conntrack --ctstate
>>> RELATED,ESTABLISHED -m comment --comment "RULE 6; in WAN out LAN, iff
>>> established and dst LAN" -j ACCEPT [0:0] -A FORWARD -d 10.1.1.0/24 -i
>>> enp6s0 -p tcp -m multiport --dports 80,443 -m comment --comment "RULE
>>> 7 supplies a target for RULE 1" -j ACCEPT
>>>
>>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> Some of them are obviously not getting hit, I don't know why. I'm not
>>> really sure which I need, at this point I've grown dizzy from looking
>>> at them.
>>>
>>>
>>> Here are the full set of rules if you'd like to see, though the above
>>> I think might suffice: http://fnpaste.com/qprP
>>>
>>> Thank you in advance for your help!
>> That is more complicated than it needs to be. Also, you have a NETMAP
>> rule in there which is probably causing problems.
>>
>> Try getting rid of that and replacing all the FORWARD rules with this:
>>
>> -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT -A
>> FORWARD -i enp4s5 -s 10.1.1.0/24 -j ACCEPT -A FORWARD -i wlp2s0 -s
>> 10.1.2.0/24 -j ACCEPT -A FORWARD -j REJECT
>>
>>
> Thank you for responding!  I have done as you suggested.  Is this closer  http://fnpaste.com/goQN to what you were suggesting?  It's still not working.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in the body of a message to majordomo@vger.kernel.org More majordomo info at  http://vger.kernel.org/majordomo-info.html
> N�����r��y���b�X��ǧv�^�)޺{.n�+���z��׫�{ay�ʇڙ�,j��f���h���z��w������j:+v���w�j�m��������zZ+�����ݢj"��!tml=


From: Dave Osbourne <dave@osbourne.uk.eu.org>
Subject: Re: Using dynamic IP lists to block forwarding
Date: Tue, 9 Jan 2018 16:24:50 +0000
Message-ID: <a2194be6-ac9a-5631-7e55-def8cb240b45@osbourne.uk.eu.org>
References: <57cdc69a-1be8-d117-61a9-0de376f54152@osbourne.uk.eu.org>
 <20180109095832.qhetdvawgkzb2gak@Redstar.dorchain.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20180109095832.qhetdvawgkzb2gak@Redstar.dorchain.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org



On 2018-01-09 09:58, Joerg Dorchain wrote:
> On Tue, Jan 09, 2018 at 09:28:26AM +0000, Dave Osbourne wrote:
>> 1. The list might be incorrect and legit requests will be blocked, the
>>     list will have to regularly derived (there might be a source who kno=
ws)
>> 2. "bad" IPs might be on that list and allowed
>>
>>
>> My response is to implement a dynamic block list (say)
>> http://iplists.firehol.org/?ipset=3Dblocklist_net_ua - using iptables on=
 (say)
>> Debian.=A0 I've looked at an hour of probe data and it seems that that
>> /*specific */list would have blocked 97+% of known bad probe attempts (a=
nd
>> the list is updated regularly).
>>
>> I hope someone might be able to provide argument for / against... or sha=
re
>> an alternative...
> I have been doing this for a while, but now have found that ipset
> fit in very well here.
> - Adding and removing ips from a set is easier than fiddling with
>    iptables syntax.
> - The timeout feature comes in very handy.
> - Basically the iptables rules can be static.
>
> Bye,
>
> Joerg

Ah - I looked at that (ipset) - didn't even know it existed...!!

I'm getting a lot of resistance from our outsourced IT supplier on=20
this...=A0 the excuses are variously:

* block based on SRCIP being in <insert unfriendly state here> or
* why don't you migrate to Office365 or
* don't worry if you patch regularly and have a good passwd policy then=20
just let the traffic come

all completely pointless given the constrains and facts of the case.

Does *anyone* have some kind of a reference or best practice for this,=20
or their own motivation even?

I feel the resistance I'm getting (not from the list) is through a lack=20
of awareness by IT professionals...=A0 this seems like such an obvious=20
thing to do, yet 3 IT support companies I've spoken to don't seem keen....

Dave



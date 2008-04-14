From: whiplash <whiplash@bofhland.org>
Subject: Re: simple connection bridging
Date: Mon, 14 Apr 2008 13:01:24 +0200
Message-ID: <48033984.9060206@bofhland.org>
References: <5d97c170804121439m44ef9243r466dc7e106f0d947@mail.gmail.com>  <4801622E.1060407@bofhland.org> <5d97c170804130410p400d523bs118b8885b5c1548a@mail.gmail.com> <alpine.LNX.1.10.0804132100520.9651@fbirervta.pbzchgretzou.qr> <48030D4B.1040204@bofhland.org> <alpine.LNX.1.10.0804141244260.9651@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804141244260.9651@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: Peter Boughton <boughtonp@gmail.com>, netfilter@vger.kernel.org

Jan Engelhardt ha scritto:

>>> No need. If you add the interface address, rules for the subnet
>>> will automatically be added, in other words:
>>>
>>>  ip addr add 192.168.1.2/24 dev eth0
>>>
>>> will cause 192.168.1.0/24 to show up in `ip route` (preferred over `route`)
>>> with a 'proto kernel', which says the kernel created this one automatically.
>> Uhm, yes, this is correct.
>> But I was not talking about adding routing on linux box, but on *XP* boxes.
>>
> Right, I already wondered about the strange trailing argument.

Yes, "mask" keyword does not definitively apply to route in Linux. :)

> Then again, why not just use the default route [if it fits]?-
> still needs no extra routes :)

Because I didn't know if the mentioned linux box was the default gateway 
for the two XP boxes...:)

Regards.

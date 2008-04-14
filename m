From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: simple connection bridging
Date: Mon, 14 Apr 2008 12:45:10 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804141244260.9651@fbirervta.pbzchgretzou.qr>
References: <5d97c170804121439m44ef9243r466dc7e106f0d947@mail.gmail.com>  <4801622E.1060407@bofhland.org> <5d97c170804130410p400d523bs118b8885b5c1548a@mail.gmail.com> <alpine.LNX.1.10.0804132100520.9651@fbirervta.pbzchgretzou.qr>
 <48030D4B.1040204@bofhland.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48030D4B.1040204@bofhland.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: whiplash <whiplash@bofhland.org>
Cc: Peter Boughton <boughtonp@gmail.com>, netfilter@vger.kernel.org


On Monday 2008-04-14 09:52, whiplash wrote:
> Jan Engelhardt ha scritto:
>
>> No need. If you add the interface address, rules for the subnet
>> will automatically be added, in other words:
>> 
>>  ip addr add 192.168.1.2/24 dev eth0
>> 
>> will cause 192.168.1.0/24 to show up in `ip route` (preferred over `route`)
>> with a 'proto kernel', which says the kernel created this one automatically.
>
> Uhm, yes, this is correct.
> But I was not talking about adding routing on linux box, but on *XP* boxes.
>
Right, I already wondered about the strange trailing argument.
Then again, why not just use the default route [if it fits]?-
still needs no extra routes :)

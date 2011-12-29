From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: NAT WAN IP to internal range?
Date: Thu, 29 Dec 2011 16:37:31 +0530
Message-ID: <4EFC49F3.2040009@atc.tcs.com>
References: <CANSq30tB6vk90gORs+bcLFvF3a8iwZcw8CbUpJFZJOH2YN-SXQ@mail.gmail.com> <1324458449.4269.49.camel@steve-pc> <CANSq30tNeT5AUD+Veq5qhxWgTXmqhy01Tyh5a1NYLSe1u4FXOA@mail.gmail.com> <4EFC46CE.8010202@atc.tcs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4EFC46CE.8010202@atc.tcs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Andrew Stone <andrew@stonie.net>
Cc: netfilter@vger.kernel.org

On Thursday 29 December 2011 04:24 PM, Vigneswaran R wrote:
> On Thursday 29 December 2011 03:12 PM, Andrew Stone wrote:
>> I now have:
>>
>> ip address add a.b.c.240/29 dev ppp0 broadcast a.b.c.247
>>
>> iptables -t nat -I PREROUTING -d a.b.c.241 -j DNAT --to-destination
>> 192.168.1.69
>> iptables -t nat -I POSTROUTING -s 192.168.1.69 -j SNAT --to-source
>> a.b.c.241
>>
>> iptables -t nat -A PREROUTING -d a.b.c.242 -j DNAT --to-destination
>> 192.168.1.100-192.168.1.150
>> iptables -t nat -A POSTROUTING -s 192.168.1.100-192.168.1.150 -j SNA=
T
>> --to-source a.b.c.242
>>
>>
>> The .69 machine correctly has .241 ... however the machines located =
in
>> the range do not have .242 ?
>>
>> Is this is correct way to specify a nat range with iptables?
>
>  From 'man iptables',
>
> """
> In Kernels up to 2.6.10 you can add several --to-destination options.
> For those kernels, if you specify more than one des=E2=80=90
> tination address, either via an address range or multiple
> --to-destination options, a simple round-robin (one after another
> in cycle) load balancing takes place between these addresses. Later
> Kernels (>=3D 2.6.11-rc1) don't have the ability to NAT
> to multiple ranges anymore.
> """

And it seems, to specify a source address range, we need to use=20
address/mask or a comma (not '-') separated list of such combination.

Syntax:

-s, --source address[/mask][,...]


Regards,
Vignesh

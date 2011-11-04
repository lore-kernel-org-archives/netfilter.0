From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: Numeber of connections
Date: Fri, 4 Nov 2011 15:30:11 -0200
Message-ID: <CAMTjHrwaaYTRwszY6RbRzw6SjsN4sHEhpovE7A2g-TwiHeg2dg@mail.gmail.com>
References: <CAMTjHrz-d9kXKS3ZbJQGJ-b-Y05eb+g8XYe1x0W94iqPuQhGxQ@mail.gmail.com>
	<alpine.LNX.2.01.1111032025220.25863@frira.zrqbmnf.qr>
	<20111104143027.GA10958@1984>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20111104143027.GA10958@1984>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Jan Engelhardt <jengelh@medozas.de>, Mail List - Netfilter <netfilter@vger.kernel.org>

Thanks everyone, but I'm using iptables 1.3.5 which there isn't some
library and for some issue I can't install iptables 1.4.x currently.

anyone suggest an other way ?


thanks






2011/11/4 Pablo Neira Ayuso <pablo@netfilter.org>:
> On Thu, Nov 03, 2011 at 08:26:24PM +0100, Jan Engelhardt wrote:
>> On Thursday 2011-11-03 17:41, Usu=E1rio do Sistema wrote:
>>
>> >Hello everyone, I'm using an RHE 5.5 machine for firewall and I wou=
ld
>> >like know how many connections are been handled for my firewall
>> >iptables in an time of day as well as how many connections per seco=
nd.
>>
>> `conntrack -L` will show you how many active CTs there. The number o=
f
>> ct/sec can be calculated by monitoring `conntrack -Ee NEW` over a ti=
me
>> quantum chosen by you.
>
> I think using ulogd2 with the flow accounting and making some custom
> scripts to process the logs would make the trick.
>
> The conntrack utility is designed to know what is going on right now
> in the firewall. For accumulated stats, ulogd2 can make it better.
>
> P.S: Jan, there's some people waiting for comments on your
> xtables-addons stuff in netfilter-devel, in case that you didn't
> notice.
>

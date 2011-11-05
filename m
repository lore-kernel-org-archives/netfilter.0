From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: Numeber of connections
Date: Sat, 5 Nov 2011 10:15:46 -0200
Message-ID: <CAMTjHryRYqJa=huJsw-3qEQ1u6TtMAF7pB+DDUnQh78XbaONZg@mail.gmail.com>
References: <carreh0v588s5jgpfh944k87.1320435955086@email.android.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <carreh0v588s5jgpfh944k87.1320435955086@email.android.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Leblond <eric@regit.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Jan Engelhardt <jengelh@medozas.de>, Mail List - Netfilter <netfilter@vger.kernel.org>

Eric, my Kernel is 2.6.18.


realy I can look in /var/log/messages some rules been handled  (
either allow as deny ) by iptables but I think isn't adequate.


so...if anybody has other way please share it.


thanks






2011/11/4 Eric Leblond <eric@regit.org>:
> Hello
>
> Which kernel are you using ? Conntrack usage in ulogd2 (pablo's propo=
sal) only requires a kernel > 2.6.14.
>
> BR
>
> Usu=E1rio do Sistema <maiconlp@ig.com.br> a =E9crit=A0:
>
>>Thanks everyone, but I'm using iptables 1.3.5 which there isn't some
>>library and for some issue I can't install iptables 1.4.x currently.
>>
>>anyone suggest an other way ?
>>
>>
>>thanks
>>
>>
>>
>>
>>
>>
>>2011/11/4 Pablo Neira Ayuso <pablo@netfilter.org>:
>>> On Thu, Nov 03, 2011 at 08:26:24PM +0100, Jan Engelhardt wrote:
>>>> On Thursday 2011-11-03 17:41, Usu=E1rio do Sistema wrote:
>>>>
>>>> >Hello everyone, I'm using an RHE 5.5 machine for firewall and I w=
ould
>>>> >like know how many connections are been handled for my firewall
>>>> >iptables in an time of day as well as how many connections per se=
cond.
>>>>
>>>> `conntrack -L` will show you how many active CTs there. The number=
 of
>>>> ct/sec can be calculated by monitoring `conntrack -Ee NEW` over a =
time
>>>> quantum chosen by you.
>>>
>>> I think using ulogd2 with the flow accounting and making some custo=
m
>>> scripts to process the logs would make the trick.
>>>
>>> The conntrack utility is designed to know what is going on right no=
w
>>> in the firewall. For accumulated stats, ulogd2 can make it better.
>>>
>>> P.S: Jan, there's some people waiting for comments on your
>>> xtables-addons stuff in netfilter-devel, in case that you didn't
>>> notice.
>>>
>>--
>>To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
>>the body of a message to majordomo@vger.kernel.org
>>More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

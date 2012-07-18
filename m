From: Luke Pascoe <luke@osnz.co.nz>
Subject: Re: Kernel 3.2.0.0 IPSec policy patch bug?
Date: Wed, 18 Jul 2012 18:39:17 +1200
Message-ID: <CAKYdRA-Aq+t8GK-b-Q21GPPk=V8M9TOGMRdJicg6X+2E44XdKA@mail.gmail.com>
References: <CAKYdRA90C4_wBcYt3hASi5wdp_DCxkFdtFY2Y3Hufw0DcW4Z5A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKYdRA90C4_wBcYt3hASi5wdp_DCxkFdtFY2Y3Hufw0DcW4Z5A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Some further testing reveals this is not related to the kernel
version, but rather to the specifics of the tunnel.

A net<->net tunnel matches the policy rules correctly, ie:

10.0.0.0/24---->1.1.1.1<====>2.2.2.2<-------10.1.0.0/24

However a host<->net tunnel does not match outbound packets at the
host-only end, ie:

1.1.1.1<=====>2.2.2.2<-----10.1.0.0/24

The ruleset I'm using on the 1.1.1.1 host goes something like this:

iptables -A PREROUTING -t mangle -i ppp0 -s 10.1.0.0/24 -m policy
--pol ipsec --dir in -j ACCEPT
iptables -A PREROUTING -t mangle -i ppp0 -s 10.1.0.0/24 -j DROP
iptables -A POSTROUTING -t mangle -o ppp0 -d 10.1.0.0/24 -m policy
--pol ipsec --dir out -j ACCEPT
iptables -A POSTROUTING -t mangle -o ppp0 -d 10.1.0.0/24 -j DROP

Any ideas?

Thanks.

Luke.

On 18 July 2012 14:30, Luke Pascoe <luke@osnz.co.nz> wrote:
>
> Hi all,
>
> Just wondering if there is a known bug with kernel 3.2.0.0 regarding IPSec
> policy matching?
>
> I have a Debian Squeeze based firewall running a backported 3.2 kernel and
> while it correctly matches inbound packets in the PREROUTING mangle table
> with 'policy match dir in pol ipsec', if I try to do a similar match in
> POSTROUTING for outbound packets 'policy match dir out pol ipsec' I get no
> match.
>
> This same logic works fine on another firewall I manage, which has an
> older
> 2.6.32 kernel.
>
> If it is a known bug, can someone tell me what kernel version I need to
> upgrade to to fix it?
>
> Thanks.




--

Luke Pascoe



E luke@osnz.co.nz
P +64 (9) 296 2961
M +64 (27) 426 6649
W www.osnz.co.nz

24 Wellington St
Papakura
Auckland, 2110
New Zealand

This communication, including any attachments, is confidential. If you are
not the intended recipient, you should not read it - please contact me
immediately, destroy it, and do not copy or use any part of this
communication or disclose anything about it. Thank you. Please note that
this communication does not designate an information system for the purposes
of the Electronic Transactions Act 2002.

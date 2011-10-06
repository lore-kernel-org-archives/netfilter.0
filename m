From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ip6tables support for filtering sctp packets with specific
 ports
Date: Thu, 6 Oct 2011 19:21:22 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1110061921030.12333@frira.zrqbmnf.qr>
References: <CAG+XuE607ciut+hUOMUvE_5h98fE4xf7J48Oc9ecanGrFKhvoA@mail.gmail.com> <alpine.LNX.2.01.1110061741130.22969@frira.zrqbmnf.qr> <CAG+XuE5TXknTyie3qmAnV1msD-fe5-NqevYGOVKG6xqkFhBnGw@mail.gmail.com> <alpine.LNX.2.01.1110061906270.20232@frira.zrqbmnf.qr>
 <CAG+XuE7U6jzLOkT=5U2Y5ghofPthSifK-Rd4kQse9hbhmqrNpQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAG+XuE7U6jzLOkT=5U2Y5ghofPthSifK-Rd4kQse9hbhmqrNpQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Prashant Batra <prashant0100@gmail.com>
Cc: netfilter@vger.kernel.org

On Thursday 2011-10-06 19:09, Prashant Batra wrote:

>Ok,
>Thanks Jan for pointers, so is this supported in the latest versions?

Yes this is, and don't strip the Cc list, lest TOFU.

>On Thu, Oct 6, 2011 at 10:37 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
>> On Thursday 2011-10-06 18:14, Prashant Batra wrote:
>>
>>>This is what I am getting-
>>>
>>>#ip6tables -I OUTPUT -p sctp --sport 3232:65535 -d 2001:db8:0:242::36
>>>-s 2001:db8:0:242::37 -j QUEUE
>>>ip6tables v1.3.6: Unknown arg `--sport'
>>>Try `ip6tables -h' or 'ip6tables --help' for more information.
>>
>> Then your installation is broken, or, yes, now that I see it, your
>> iptables is just way too old to support SCTP.
>>
>
>
>
>-- 
>Prashant Batra
>Follow the dreams!!
>


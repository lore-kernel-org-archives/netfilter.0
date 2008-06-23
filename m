From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How to mark traffic on used bandwidth
Date: Mon, 23 Jun 2008 17:23:10 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806231717480.26570@fbirervta.pbzchgretzou.qr>
References: <38db14850806230123h2c0a1aa4uef8afd8275d07d98@mail.gmail.com> <d39744a20806230335u4c527f53p258437b4bcc8416@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d39744a20806230335u4c527f53p258437b4bcc8416@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Petrushev <ivanatora@gmail.com>
Cc: Anatoly Muliarski <x86ever@gmail.com>, netfilter@vger.kernel.org


On Monday 2008-06-23 12:35, Ivan Petrushev wrote:
>
>On Mon, Jun 23, 2008 at 11:23 AM, Anatoly Muliarski <x86ever@gmail.com> wrote:
>> Hi all,
>>
>> I have an upstream link with guaranteed bandwidth( name it B1 ) and extra
>> not-guaranteed bandwidth( name it B2 ).
>> How can I marking the traffic by using iptables?
>> I need one mark for B1 traffic and another for B2 traffic.
>> iptables provides -m limit match but it works with packets only,
>> but I need one based on bytes/bits per second.
>> I'll be appreciate for any ideas.

>If these two bandwitdths are on different interfaces (NICs), you can
>see real time stats with Gkrellm or other similar utility. ntop does
>it too, I think.

gkrellm/ntop won't help here.

There is -m rateest, but I have not used it before.

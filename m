From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Analyzing DNAT traffic
Date: Sat, 5 Mar 2011 15:38:21 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1103051538150.6933@obet.zrqbmnf.qr>
References: <AANLkTimVukQe-ZFsYX_OuFdNV8-buwPHhFh5J768ugqs@mail.gmail.com> <314641299313152@web72.yandex.ru> <AANLkTimhvRGUd-_tb6C10UH8c-cqzcaQFb-OeamMgeuA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimhvRGUd-_tb6C10UH8c-cqzcaQFb-OeamMgeuA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex <mysqlstudent@gmail.com>
Cc: "Oleg A. Arkhangelsky" <sysoleg@yandex.ru>, netfilter@vger.kernel.org

On Saturday 2011-03-05 15:23, Alex wrote:

>Hi,
>
>>> How can I analyize this traffic to determine if it should be forwarded
>>> on to its intended internal recipient, or if it is completely
>>> unrelated traffic that should continue to be blocked?
>>
>> Could you please check, does such packets match the following
>> rule?
>>
>> iptables -I FORWARD -m conntrack --ctstate INVALID -j LOG
>
>How will I be able to recognize such an entry in the logs? Is there a
>way I can add a tag to the log entry so I can be sure?

See --log-prefix.

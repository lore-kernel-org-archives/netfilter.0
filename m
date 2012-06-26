From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: -f option used with iptables
Date: Tue, 26 Jun 2012 12:46:10 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1206261245040.7681@frira.zrqbmnf.qr>
References: <CAE1WnGeiopf-gCWFzSVpZSDU6H56VqaPxL6K5AVL_o2xZm1pVw@mail.gmail.com> <alpine.LNX.2.01.1206211626120.23123@frira.zrqbmnf.qr> <CAE1WnGcwvto-Dc25XqcskyYfnO2whR=D=YBfO-VCSKZjm7jkCg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAE1WnGcwvto-Dc25XqcskyYfnO2whR=D=YBfO-VCSKZjm7jkCg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rahul shrivastava <shrivastavaone@gmail.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2012-06-26 12:24, rahul shrivastava wrote:

>this rule is not working for me

Then you don't have any fragments.
Remember that there may be defragmenter modules (nf_defrag_ipv4/ipv6)
loaded.

(And cease top-posting.)

>if you know if provide me a rule to drop only fragmented packets


>
>On 6/21/12, Jan Engelhardt <jengelh@inai.de> wrote:
>> On Thursday 2012-06-21 12:46, rahul shrivastava wrote:
>>
>>>iptables -A INPUT -p icmp -i eth1 -m iprange --src-range
>>>172.31.114.1-172.31.114.254 -m iprange --dst-range
>>> 192.168.1.1-192.168.1.254
>>>-f -j DROP
>>>
>>>My abjective is to deny only fragmented packets with specified ip,
>>> protocol
>>>and interface and "-f" option doesnt seem to work
>>
>> I can guarantee you that -f matches fragments -- if there are any
>> by the time the rule is executed.
>>
>

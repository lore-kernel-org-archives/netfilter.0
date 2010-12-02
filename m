From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Forward ssh to an internal server not working
Date: Thu, 2 Dec 2010 04:29:31 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012020428280.3726@obet.zrqbmnf.qr>
References: <728010.64913.qm@web62507.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <728010.64913.qm@web62507.mail.re1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Landy Landy <landysaccount@yahoo.com>
Cc: netfilter@vger.kernel.org

On Thursday 2010-12-02 04:27, Landy Landy wrote:

>
>--- On Wed, 12/1/10, Jan Engelhardt <jengelh@medozas.de> wrote:
>>>
>>>Can someone please tell me why I cannot access a
>>>machine inside my LAN from outside? These are my rules to
>>>try to accomplish that task:
>> >
>> >$iptables -t nat -A PREROUTING -i $EXT_IFACE -p tcp \
>> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 -s $UNIVERSE --sport
>> $UNPRIVPORTS -d $EXT_IP --dport 22 \
>> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 -j DNAT --to-destination
>> 172.16.0.200:22

These may not be all rules. Post complete rulesets as output by=20
`iptables-save` and also `ip addr` and `ip route show table all`.

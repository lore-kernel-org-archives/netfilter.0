From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: [iptables] misleading print
Date: Fri, 10 Aug 2012 00:00:48 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1208100000010.12067@frira.zrqbmnf.qr>
References: <jbinrb$2l7$1@dough.gmane.org> <2026716.mRmHE8f3qx@dhcp91>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2026716.mRmHE8f3qx@dhcp91>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: =?UTF-8?Q?Michal_Kube=C4=8Dek?= <mkubecek@suse.cz>
Cc: netfilter@vger.kernel.org, "U.Mutlu" <for-gmane@mutluit.com>

On Monday 2011-12-05 16:44, Michal Kube=C4=8Dek wrote:

>On Monday 05 of December 2011 16:26EN, U.Mutlu wrote:
>> I have in my script these statements:
>>    iptables -A INPUT  -i lo -j ACCEPT
>>    iptables -A OUTPUT -o lo -j ACCEPT
>>=20
>> When doing "iptables -L -n" then the above gets shown as this:
>>    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
>>=20
>> IMHO, this could easily be misinterpreted if one looks
>> only at the iptables output, because the crucial info,
>> ie. that it applies to the "lo" device only, is missing...
>
>Output of "iptables -L" doesn't show -i and -o matches by default. If=20
>you want to see them, use "-v" option.


Let's start a vote (of sorts) for getting rid of -L. Yes, it'll break=20
people's oh-so-sacred scripts. But heck, you can't reasonably parse it=20
anyway.

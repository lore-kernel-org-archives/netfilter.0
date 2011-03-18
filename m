From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: rules to allow LAN navigation
Date: Fri, 18 Mar 2011 12:10:24 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1103181208510.24961@obet.zrqbmnf.qr>
References: <AANLkTik6CLZ74j6XCZQF1E=fz1N6AGgCS5myCfi+BjbT@mail.gmail.com> <AANLkTinRFy06AxXo0vjQZxSHLj5S5oC4yOTX4GSZ0sXn@mail.gmail.com> <AANLkTikJiLUbiz0aegb9pTaAdsYZ8LQJe4KCh_Ew=1D-@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikJiLUbiz0aegb9pTaAdsYZ8LQJe4KCh_Ew=1D-@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Pandu Poluan <pandu@poluan.info>
Cc: Esteban Cacavelos <estebancacavelos@gmail.com>, netfilter@vger.kernel.org

On Friday 2011-03-18 03:15, Pandu Poluan wrote:

>(sorry for top posting; Gmail mobile can only top-post)
>
>Can you post the output of iptables-save? iptables -L always give me
>the headache.

So does the ASCII graphic which is completely misaligned. Rule: use=20
a monospace font and make sure it does not exceed 72 cols.
(Graphviz notation would be best.)

>On 2011-03-18, Esteban Cacavelos <estebancacavelos@gmail.com> wrote:
>> Hi all, i am new on the list and i have the following scenario.
>>
>> ------------------------------------
>> ---------------------------------------
>> --------------------------------------------
>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 router =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux server
>> (ubuntu)|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> |=C2=A0=C2=A0 LAN: 192.168.3.x=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | -----=
--------- |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eth0:192.168.3.12
>> |=C2=A0 -----------------------------=C2=A0 |=C2=A0=C2=A0=C2=A0 (WIN=
DOWS PCs, etc)=C2=A0=C2=A0=C2=A0 |
>> |=C2=A0=C2=A0 WAN: internet=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =C2=A0 =C2=A0=C2=A0 eth1:192.=
168.2.1
>> =C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 LAN
>> =C2=A0=C2=A0=C2=A0 |
>> -------------------------------------
>> ---------------------------------------
>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 192.168.2.x=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |
>>
>>
>> -----------------------------------------------
>>
>>
>> I want to: the computers in the LAN to navigate through internet.
>>
>> When the policies for INPUT, OUTPUT and FORWARD are ACCEPT, everithi=
ng
>> works well (pcs in the LAN=C2=A0 can navigate), BUT, when i change t=
he
>> policy to DROP for the INPUT chain i dont know how to allow http
>> traffic for the LAN.
>>
>> My actual iptables configuration is :
>>
>> iptables -L
>> Chain INPUT (policy DROP)
>> target=C2=A0=C2=A0=C2=A0=C2=A0 prot opt source=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 destinatio=
n
>> ACCEPT=C2=A0=C2=A0=C2=A0=C2=A0 all=C2=A0 --=C2=A0 anywhere=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 anywhere=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctstate
>> RELATED,ESTABLISHED
>> ACCEPT=C2=A0=C2=A0=C2=A0=C2=A0 all=C2=A0 --=C2=A0 anywhere=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 anywhere=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state
>> RELATED,ESTABLISHED
>> ACCEPT=C2=A0=C2=A0=C2=A0=C2=A0 tcp=C2=A0 --=C2=A0 anywhere=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 anywhere=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcp dpt=
:www
>> LOG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 all=C2=A0 --=C2=A0 any=
where=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 anywhere=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 limit:
>> avg 5/min burst 5 LOG level debug prefix `iptables denied: '
>> ACCEPT=C2=A0=C2=A0=C2=A0=C2=A0 tcp=C2=A0 --=C2=A0 anywhere=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 anywhere=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcp dpt=
:www
>> ACCEPT=C2=A0=C2=A0=C2=A0=C2=A0 all=C2=A0 --=C2=A0 anywhere=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 anywhere
>> ACCEPT=C2=A0=C2=A0=C2=A0=C2=A0 all=C2=A0 --=C2=A0 anywhere=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 anywhere
>> ACCEPT=C2=A0=C2=A0=C2=A0=C2=A0 all=C2=A0 --=C2=A0 anywhere=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 anywhere
>> ACCEPT=C2=A0=C2=A0=C2=A0=C2=A0 tcp=C2=A0 --=C2=A0 anywhere=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 anywhere=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcp dpt=
:2223
>> ACCEPT=C2=A0=C2=A0=C2=A0=C2=A0 all=C2=A0 --=C2=A0 192.168.2.1=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 anywhere
>> ACCEPT=C2=A0=C2=A0=C2=A0=C2=A0 all=C2=A0 --=C2=A0 192.168.2.0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 anywhere
>>
>>
>> Thanks for the help.
>>
>>
>>
>> --
>> Esteban L. Cacavelos de Amoriza
>> Cel: 0981 220 429
>>
>
>
>--=20
>--
>Pandu E Poluan - IT Optimizer
>My website: http://pandu.poluan.info/
>N?????r??y??????X??=C7=A7v???)=DE=BA{.n?????z???=D7=AB?{ay?=1D=CA=87=DA=
=99??j=07??f???h?????=1E?w???=0C???j:+v???w????????=07????zZ+???????j"?=
???i


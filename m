From: Dmitry Melekhov <dm@belkam.com>
Subject: Re: connmark and nat
Date: Fri, 03 Apr 2015 08:03:34 +0400
Message-ID: <551E1116.4000101@belkam.com>
References: <551A484A.7050208@belkam.com> <551C6A12.6020404@plouf.fr.eu.org> <551CC3FB.2070903@belkam.com> <551D4F6B.1070005@conversis.de> <551D5AC9.60300@belkam.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <551D5AC9.60300@belkam.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Dennis Jacobfeuerborn <dennisml@conversis.de>
Cc: netfilter@vger.kernel.org

02.04.2015 19:05, Dmitry Melekhov =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> 02.04.2015 18:17, Dennis Jacobfeuerborn =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
>> On 02.04.2015 06:22, Dmitry Melekhov wrote:
>>> 02.04.2015 01:58, Pascal Hambourg =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> Dmitry Melekhov a =C3=A9crit :
>>>>> I'm trying to do DNAT/SNAT on the same host with connmark and=20
>>>>> can't get
>>>>> it working.
>>>>>
>>>>> My host has static ip 192.168.22.252 and it can get address
>>>>> 192.168.22.99 from VRRP, so bind doesn't listen on 192.168.22.99,
>>>> Why not ?
>>> because there is no such address on interface, it becomes available=
=20
>>> only
>>> at VRRP state change to master :-)
>> Have you tried using /proc/sys/net/ipv4/ip_nonlocal_bind? Then you c=
ould
>> bind to that address even if it isn't configured yet.
>>
>>
> Thank you very much, this helps :-)
> I didn't know about this option.
> Turned it on, changed bind to
> listen-on { 192.168.22.99; any; };
>
> and it works :-)
>
>
Hmm, tried this once again- and doesn't work, looks like this is bind=20
problem, I guess I have to enumerate all interfaces, don't use any,
but there are more than 10 interfaces on this server, and I'm too lazy =
;-)

So, looks like only solution is no force rndc reconfigure on vrrp state=
=20
change,
which I just implemented.

Very pity this can't be solved by using netfilter.

Thank you!


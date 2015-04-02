From: Dmitry Melekhov <dm@belkam.com>
Subject: Re: connmark and nat
Date: Thu, 02 Apr 2015 19:05:45 +0400
Message-ID: <551D5AC9.60300@belkam.com>
References: <551A484A.7050208@belkam.com> <551C6A12.6020404@plouf.fr.eu.org> <551CC3FB.2070903@belkam.com> <551D4F6B.1070005@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <551D4F6B.1070005@conversis.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Dennis Jacobfeuerborn <dennisml@conversis.de>
Cc: netfilter@vger.kernel.org

02.04.2015 18:17, Dennis Jacobfeuerborn =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 02.04.2015 06:22, Dmitry Melekhov wrote:
>> 02.04.2015 01:58, Pascal Hambourg =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> Dmitry Melekhov a =C3=A9crit :
>>>> I'm trying to do DNAT/SNAT on the same host with connmark and can'=
t get
>>>> it working.
>>>>
>>>> My host has static ip 192.168.22.252 and it can get address
>>>> 192.168.22.99 from VRRP, so bind doesn't listen on 192.168.22.99,
>>> Why not ?
>> because there is no such address on interface, it becomes available =
only
>> at VRRP state change to master :-)
> Have you tried using /proc/sys/net/ipv4/ip_nonlocal_bind? Then you co=
uld
> bind to that address even if it isn't configured yet.
>
>
Thank you very much, this helps :-)
I didn't know about this option.
Turned it on, changed bind to
listen-on { 192.168.22.99; any; };

and it works :-)



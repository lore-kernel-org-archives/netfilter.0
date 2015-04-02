From: Dennis Jacobfeuerborn <dennisml@conversis.de>
Subject: Re: connmark and nat
Date: Thu, 02 Apr 2015 16:17:15 +0200
Message-ID: <551D4F6B.1070005@conversis.de>
References: <551A484A.7050208@belkam.com> <551C6A12.6020404@plouf.fr.eu.org> <551CC3FB.2070903@belkam.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <551CC3FB.2070903@belkam.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Dmitry Melekhov <dm@belkam.com>, Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On 02.04.2015 06:22, Dmitry Melekhov wrote:
> 02.04.2015 01:58, Pascal Hambourg =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Dmitry Melekhov a =C3=A9crit :
>>> I'm trying to do DNAT/SNAT on the same host with connmark and can't=
 get
>>> it working.
>>>
>>> My host has static ip 192.168.22.252 and it can get address
>>> 192.168.22.99 from VRRP, so bind doesn't listen on 192.168.22.99,
>> Why not ?
>=20
> because there is no such address on interface, it becomes available o=
nly
> at VRRP state change to master :-)

Have you tried using /proc/sys/net/ipv4/ip_nonlocal_bind? Then you coul=
d
bind to that address even if it isn't configured yet.

Regards,
  Dennis

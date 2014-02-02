From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Public IP to Private IP
Date: Sun, 02 Feb 2014 17:36:42 +0100
Message-ID: <52EE741A.9030507@plouf.fr.eu.org>
References: <CAFPGR9jhpurA644xdfWc6dF58iVCc5t7mbUw6NsjxPqYQxtUHw@mail.gmail.com>	<CALFTrnO7SAm0ghr7b1p+o9cWnbwtRJQMtSmtJy_VXJxd-xxkcw@mail.gmail.com>	<CAFPGR9guTGspBJ8yfOVNZAAMy44YGS+UeV+QmYNLpAJ+ZxTuxw@mail.gmail.com>	<52EE680B.6090407@plouf.fr.eu.org> <CAHEKYV7SoAsJ=u-8LP9AqXmKH6GmPf96HHjNfzyeLuKHqJU2vQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAHEKYV7SoAsJ=u-8LP9AqXmKH6GmPf96HHjNfzyeLuKHqJU2vQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mauricio Tavares <raubvogel@gmail.com>
Cc: netfilter list <netfilter@vger.kernel.org>

Mauricio Tavares a =E9crit :
> On Sun, Feb 2, 2014 at 10:45 AM, Pascal Hambourg <pascal@plouf.fr.eu.=
org> wrote:
>>>>
>>>> Assuming that your inside interface is eth1, and your inside IP
>>>> network is 192.168.0.0/23:
>>>>
>>>> iptables -A POSTROUTING -s 192.168.0.0/23 -d 192.168.0.0/23 -o eth=
1 -j
>>>> MASQUERADE
>> Instead of masquerading I would suggest to 1:1 map the source addres=
ses
>> to a different (unused) private subnet, so that the source address s=
een
>> by the final server can be mapped back to the real source address.
>>
>> E.g. :
>> iptables -A POSTROUTING -s 192.168.0.0/23 -d 192.168.0.0/23 -o eth1 =
\
>>   -j NETMAP --to 192.168.8.0/23
>=20
>       Assuming 0.1 is the gateway, how about adding to its firewall
> rules something like
>=20
> iptables -t nat -A POSTROUTING -d 192.168.0.2 -s 192.168.0.0/24 -j
> SNAT --to-source 192.168.0.1

The result (N:1 mapping) would be the same as the above MASQUERADE rule
and hide the real source address from the final server.

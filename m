From: John Miller <johnmill@brandeis.edu>
Subject: Re: iptables DNAT algorithm -- another way?
Date: Sat, 13 Dec 2014 14:52:20 -0500
Message-ID: <CAGYMsbuauVpzw+sF8mfKxwT=NMVt3OgBEw7DvF-T=ewKk=doYQ@mail.gmail.com>
References: <548B8069.4020802@brandeis.edu>
	<201412121950.59768.neal.p.murphy@alum.wpi.edu>
	<548C0500.8030408@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <548C0500.8030408@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 
Cc: netfilter@vger.kernel.org

On Sat, Dec 13, 2014 at 4:21 AM, Pascal Hambourg <pascal@plouf.fr.eu.or=
g> wrote:
> Hello,
>
> Neal Murphy a =C3=A9crit :
>> On Friday, December 12, 2014 06:55:21 PM John Miller wrote:
>>>
>>> My solution thus far has been to use DNAT to trick our scanning pro=
gram
>>> into thinking it's using local addresses.
>>>
>>> iptables -t nat -A OUTPUT -d 172.16.x.y -j DNAT \
>>>      --to-destination 129.64.x.y
>>
>> This might point you in the right direction:
>>
>> iptables -t nat -A PREROUTING -s 172.16.0.0/16 \
>>   -j DNAT --to-destination 129.64.0.0-129.64.255.255
>>
>> But I don't know if it provides predictable 1:1 mapping.
>
> It doesn't. You want to use NETMAP instead of DNAT.

Beautiful!  That's exactly what I was looking for.  Thank you!

Sounds like

iptables -t mangle -A OUTPUT -d 172.16.0.0/16 -j NETMAP --to 129.64.0.0=
/16

will do the trick.

John

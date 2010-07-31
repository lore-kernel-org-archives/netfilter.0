From: ABPNI <jonnyt@abpni.co.uk>
Subject: Re: ipv6 forwarding without netfilter
Date: Sat, 31 Jul 2010 22:23:03 +0100
Message-ID: <76D2688A-63A7-4D46-BE14-197B9AE6FD97@abpni.co.uk>
References: <AANLkTik0MPyj4Vthm1fFXA56yEMW-a5FJ_vP6+-U+WhQ@mail.gmail.com> <4C5461BF.1000604@plouf.fr.eu.org>
Mime-Version: 1.0 (iPhone Mail 7E18)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C5461BF.1000604@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	delsp=yes"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: Mark Ryden <markryde@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



On 31 Jul 2010, at 18:47, Pascal Hambourg =20
<pascal.mail@plouf.fr.eu.org> wrote:

> Hello,
>
> Mark Ryden a =C3=A9crit :
>> According to this link:
>> http://www.faqs.org/docs/Linux-HOWTO/Linux+IPv6-HOWTO.html#FIREWALLI=
NG-NETFILTER6
>>
>> "In IPv6 you can't control forwarding per device, forwarding control
>> has to be done using IPv6-netfilter (controlled with ip6tables)
>> rulesets and specify input and output devices (see
>> Firewalling/Netfilter6  for more). This is different to IPv4, where
>> you are able to control forwarding per device (decision is made on
>> interface where packet came in). "
>>
>> My question is:
>> Suppose you don't want to control forwarding in IPv6 on a certain
>> device, just forward packets which are received on any device.
>> I am not sure that this howto is relevant.
>> Is it true that in order to achieve IPV6 forwarding you must use
>> netfilter rule ?
>
> No.
>
>> Is it possible to achieve forwarding simply by running:
>> echo "1" /proc/sys/net/ipv6/conf/all/forwarding
>>
>> without setting any ip6tables netfilter rule ?
>
> Yes.
> If you don't need filtering, you don't need ip6tables.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
=20
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Am I correct in saying that iptables/ip6tables doesn't actually alter/=20
affect "path" of traffic, but only either allows or blocks?
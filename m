From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: ipt_reject.c --> ip_route_me_harder ... --> ip_route_output_slow: 
	iif is loopback device?
Date: Tue, 11 May 2010 21:57:03 +0530
Message-ID: <AANLkTik2TdQ5cfVx-EfgSKv1AhaXLlGTzdyyQgu0DYLI@mail.gmail.com>
References: <AANLkTimahQnqdaHEEB1UgkdG7mp9vysHZNvWKpPTcxI5@mail.gmail.com>
	 <4BE9387A.8080806@plouf.fr.eu.org>
	 <AANLkTindlfLTvOos5RmdVJX-rp0F3mv-fn-CCQ_OjIMr@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=9/zvCRMwc1CbbhJgGmBQTmlAhWuIR7iNQZu4BJFqZ7w=;
        b=DOSn54xpOHtXaJxMyzGqw90704NwNmVVQJV0dlOnkOfmxMDdOqqOKfBnka2GCttC3v
         GCkVaT6FOhC9ynhz1ILD5zGICqe+GeBFl/E/HvXRFcLEvqLirg1YMz6D3HWWNwDlLu5S
         wPCjDhVLw9/+EbvE2u9UGKgecLy8YUhCg/ieQ=
In-Reply-To: <AANLkTindlfLTvOos5RmdVJX-rp0F3mv-fn-CCQ_OjIMr@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eason Su <ssg2351@gmail.com>
Cc: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org

On Tue, May 11, 2010 at 8:15 PM, Eason Su <ssg2351@gmail.com> wrote:
> Hi Pascal,
>
> Thanks for your reply! The RST packet should be sent back via the sam=
e
> interface (group2), that is what REJECT with RST target do.
>
> ip_route_me_harder include two routines, ip_route_output_key and
> ip_route_input. ip_route_output_key is to find the wanX which is used
> for reverse path filtering in ip_route_input.
>
> And I get the wrong wanX from ip_route_output_key because iif is set
> to loopback device but not the real device that the packet comes from=
,
> so the reverse path checking fail in ip_route_input. So ip_route_inpu=
t
> fail, ip_route_me_harder fail.
>
> If I disable reverse path filtering(echo
> 0>/proc/sys/net/ipv4/conf/wanX/rp_filter), everything will be ok too:
> ip_route_input ok, ip_route_me_harder ok, send_rst in ipt_REJECT.c ok=
=2E
>
> I kind of not agree about ip_route_me_harder use ip_route_output_key
> to get reverse path device, is it possible that ip_route_me_harder no=
t
> use ip_route_output_key to get reverse path device but just do some
> trick to let ip_route_input not do the reverse path checking, or do
> the right checking? Obviously echo
> 0>/proc/sys/net/ipv4/conf/wanX/rp_filter is not an option.

will this affect icmp ping request also ? .

-Ratheesh

>
>
>> Hello,
>>
>> s sg a =E9crit :
>>>
>>> I meet a routing issue when I try to use ipt_reject RST target in m=
y
>>> policy routing enabled linux box (please see below picture).
>>>
>>> The linux box is configured to support policy routing, iif policy. =
The
>>> policy is, if packet is from interface group1, then it will lookup
>>> table 100, this table's default oif is wan1. And if packet is from
>>> interface group2, then it will lookup table 101, this table's defau=
lt
>>> oif is wan2. The main table's default oif is wan1.
>>>
>>> The issue is, one packet comes from group2 and then ipt_reject want=
s
>>> to send RST, but the routing for the RST packet fail
>>> (ip_route_me_harder fail).
>>>
>>> I trace the code in ipt_REJECT.c. ipt_REJECT.c use ip_route_me_hard=
er
>>> to find the RST packet's destination. ip_route_me_harder will first
>>> find the RST packet's reverse path using ip_route_output_key. The
>>> trace of ip_route_output_key is like this:
>>> ip_route_me_harder --> ip_route_output_key --> ip_route_output_flow
>>> --> __ip_route_output_key --> ip_route_output_slow.
>>>
>>> In ip_route_output_slow, before fib_lookup, the iif is set to lookb=
ack
>>> device, not the real device where the packet comes.
>>
>> This is expected behaviour. The RST packet is locally generated, and=
 as
>> such has iif set to the loopback device.
>>
>>> So the policy
>>> finding in fib_lookup will fail to find table 101 but fall to main
>>> table, so the oif is wan1 but not wan2.
>>
>> There is one thing I don't understand. The RST packet is generated i=
n
>> reply to a packet that was received on interface group2, so I would
>> expect that it sent back via that same interface, not on any wan
>> interface. Anyway, it does not matter what interface the original pa=
cket
>> was supposed to be forwarded to.
>>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

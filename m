From: Eason Su <ssg2351@gmail.com>
Subject: Re: ipt_reject.c --> ip_route_me_harder ... --> ip_route_output_slow: 
	iif is loopback device?
Date: Tue, 11 May 2010 22:45:10 +0800
Message-ID: <AANLkTindlfLTvOos5RmdVJX-rp0F3mv-fn-CCQ_OjIMr@mail.gmail.com>
References: <AANLkTimahQnqdaHEEB1UgkdG7mp9vysHZNvWKpPTcxI5@mail.gmail.com>
	 <4BE9387A.8080806@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=3ZR5DLJJWbmgbFsx26Y8N8qqLBD6w1TpJjXJhpy5bvo=;
        b=PNhiOQGh6f7x7puhZKiIeDDRNPLZUi2napJmMUgNTNmQNfD4/Uf5EFoRBgy10g/Jnj
         MsOOQBWIg6+9g8h86MZZOdryjSnwIc5VQIsyPpu3ytQCC9dUywaeoSal9977vhRyL8zf
         jLFLw/Zq1DPNCiIcVj8Eyg5G7JGXEKL5Ax0Xo=
In-Reply-To: <4BE9387A.8080806@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Hi Pascal,

Thanks for your reply! The RST packet should be sent back via the same
interface (group2), that is what REJECT with RST target do.

ip_route_me_harder include two routines, ip_route_output_key and
ip_route_input. ip_route_output_key is to find the wanX which is used
for reverse path filtering in ip_route_input.

And I get the wrong wanX from ip_route_output_key because iif is set
to loopback device but not the real device that the packet comes from,
so the reverse path checking fail in ip_route_input. So ip_route_input
fail, ip_route_me_harder fail.

If I disable reverse path filtering(echo
0>/proc/sys/net/ipv4/conf/wanX/rp_filter), everything will be ok too:
ip_route_input ok, ip_route_me_harder ok, send_rst in ipt_REJECT.c ok.

I kind of not agree about ip_route_me_harder use ip_route_output_key
to get reverse path device, is it possible that ip_route_me_harder not
use ip_route_output_key to get reverse path device but just do some
trick to let ip_route_input not do the reverse path checking, or do
the right checking? Obviously echo
0>/proc/sys/net/ipv4/conf/wanX/rp_filter is not an option.



> Hello,
>
> s sg a =E9crit :
>>
>> I meet a routing issue when I try to use ipt_reject RST target in my
>> policy routing enabled linux box (please see below picture).
>>
>> The linux box is configured to support policy routing, iif policy. T=
he
>> policy is, if packet is from interface group1, then it will lookup
>> table 100, this table's default oif is wan1. And if packet is from
>> interface group2, then it will lookup table 101, this table's defaul=
t
>> oif is wan2. The main table's default oif is wan1.
>>
>> The issue is, one packet comes from group2 and then ipt_reject wants
>> to send RST, but the routing for the RST packet fail
>> (ip_route_me_harder fail).
>>
>> I trace the code in ipt_REJECT.c. ipt_REJECT.c use ip_route_me_harde=
r
>> to find the RST packet's destination. ip_route_me_harder will first
>> find the RST packet's reverse path using ip_route_output_key. The
>> trace of ip_route_output_key is like this:
>> ip_route_me_harder --> ip_route_output_key --> ip_route_output_flow
>> --> __ip_route_output_key --> ip_route_output_slow.
>>
>> In ip_route_output_slow, before fib_lookup, the iif is set to lookba=
ck
>> device, not the real device where the packet comes.
>
> This is expected behaviour. The RST packet is locally generated, and =
as
> such has iif set to the loopback device.
>
>> So the policy
>> finding in fib_lookup will fail to find table 101 but fall to main
>> table, so the oif is wan1 but not wan2.
>
> There is one thing I don't understand. The RST packet is generated in
> reply to a packet that was received on interface group2, so I would
> expect that it sent back via that same interface, not on any wan
> interface. Anyway, it does not matter what interface the original pac=
ket
> was supposed to be forwarded to.
>

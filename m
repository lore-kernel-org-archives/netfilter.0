From: =?UTF-8?B?56We5qW95Z2C546y5aWI?= <zh99998@gmail.com>
Subject: Re: how to do port forwarding using nftables map
Date: Mon, 21 Sep 2015 23:30:54 +0800
Message-ID: <CAP8bwDX6-5jVbZyc5JNoN8nos+QwR4QbXLhnZsxhYRc6ojxKXA@mail.gmail.com>
References: <CAP8bwDUTn=zfWNjzypzLw5a4z7earJ6Ou2Uh4JHv_Am9uu_4Lw@mail.gmail.com>
 <20150921084906.GA3549@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=CyfZdakTouwRsIj/UoMIf/xJ0UnO0GugdH1OF2YZpvs=;
        b=G2bjy/QHkQnJtLHlwvd55J+DtQDyQJcbLTLL2NfEwelnq3Hirwj7lZUZcUfo1sGYEm
         SMMyfyJa+zTZAZXXOve3fWB2GDd6nrI1qk5l6z1S9RHNZGmPQ5snApk+buEbkL8pK4j5
         QxWt5+31kaTyxgGfIltnenKvsRFD9ZjbEDUM0WR+ocaHt648PE9Yo+6LgCjJyn7Rvv1U
         EjMiKO4HtxQ8vgFNVbLH59WAZdE6qAG6P0jWKUeUqTZKHAuid2obIclBgfFuYvIq1XCR
         fE6Mo7+SXaoM1kdZ260NL8TYEwcdlv0ffJec1WslX2vjjVHqN8lxkV+KBAqFCxFtXHoQ
         QY1A==
In-Reply-To: <20150921084906.GA3549@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

iptables -t nat -A PREROUTING -p tcp --dport 1000 -j DNAT
--to-destination 1.1.1.1:1234
iptables -t nat -A PREROUTING -p tcp --dport 1001 -j DNAT
--to-destination 1.1.1.1:2222
iptables -t nat -A PREROUTING -p tcp --dport 1002 -j DNAT
--to-destination 2.2.1.1:1234
iptables -t nat -A PREROUTING -p tcp --dport 1234 -j DNAT
--to-destination 1.1.1.1:1234
iptables -t nat -A PREROUTING -p udp --dport 1000 -j DNAT
--to-destination 1.1.1.1:1234
iptables -t nat -A PREROUTING -p udp --dport 2000 -j DNAT
--to-destination 8.8.8.8:53
iptables -t nat -A PREROUTING -p tcp --dport 3000 -j DNAT
--to-destination 2.2.2.21234
(many of these)

iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

2015-09-21 16:49 GMT+08:00 Pablo Neira Ayuso <pablo@netfilter.org>:
> On Mon, Sep 21, 2015 at 10:09:25AM +0800, =E7=A5=9E=E6=A5=BD=E5=9D=82=
=E7=8E=B2=E5=A5=88 wrote:
>> I'm doing many port forwarding service on a linux server. There will
>> be many(may thousands of) port forward rule so I want to use nftable=
s
>> map to improve performance rather than just many rules.
>>
>> the policy will be [protocol : port -> address : port], like [tcp 12=
34
>> -> 1.1.1.1:4321], forward tcp 1234 port to address 1.1.1.1 same
>> protocol port 4321.
>> the protocol may only tcp and udp. so it's also ok if the key can
>> support only one port field. i can set maps and rules for each
>> protocol.
>>
>> the problem is, how to define the value "ip:port" using map?
>>
>> I tried create 2 maps, using
>>
>> > nft add map nat forward_address {type inet_service : ipv4_addr \;}
>> > nft add map nat forward_port {type inet_service : inet_service \;}
>>
>> but then I don't know how to set dnat rule....... seems the dnat
>> destnation can only accept one map value? and also i don't know how =
to
>> set "ip:port" as one value in map.
>
> Could you provide an example of your iptables ruleset? Thanks.

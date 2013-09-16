From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: PREROUTING to a non local subnet
Date: Mon, 16 Sep 2013 17:08:16 -0400
Message-ID: <CACuyg25soscwQG242-gB-JTWJqtjqc1uY5SygDoOKpWm_aQdag@mail.gmail.com>
References: <522DDC72.4000402@club-internet.fr>
	<5236B2B8.9090006@club-internet.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=VQ+q5sRGTb+3PEgT9/KzZQNpS/V4YhpDPu5ZZ4ZIppM=;
        b=jwTVsCyBmW5OXKiJJZq6UGOZl0V8kPRNsvxFxHwSPE/5Cyhv7OUDwn31TXAc0QQ7Jv
         onOTk7WXo3Vb9DHu6SVAaKZoy3aedQHKM+DHb3JKMFko+Tf+l/TZWFc/0NoAEXdHYidB
         1yu0yFRBhhTQEnZ3fqmtX5whJqd2I9OM8qY1P7Kf9ZHfuyi/o+qnAX2+Si/xGs0TtQ4r
         J/fHpwZ5Z8Uaz55tnhD/lH7g6ifFT2DFSzobtYPbp4IWgIsWTyMsAGnHpQFO5jOOQNVC
         wfb3vGVsiqCbgQgP6ohp0OFABZkbf5sAcBtN/ygNgQJziu+dwJAJ6OMRh1CWQg1ZH8+O
         Ou+Q==
In-Reply-To: <5236B2B8.9090006@club-internet.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Manu <traqueur@club-internet.fr>, netfilter@vger.kernel.org

Hi,

Try to include a source NAT rule to ensure symmetrical routing.

iptables -A PREROUTING -t nat -p tcp  -i eth1 --dport 5900 -j DNAT
--to-destination 192.168.2.100:5900
iptables -A POSTROUTING -t nat -p tcp -d 192.168.2.100 --dport 5900 -j
MASQUERADE
iptables -A FORWARD -p tcp -d 192.168.2.100--dport 5900 -j ACCEPT


2013/9/16 Manu <traqueur@club-internet.fr>:
> Hello
>
> Nobody knows if it possible ?
>
>
> Le 09/09/2013 16:34, Manu a =E9crit :
>>
>> Hello
>>
>> I'm running iptable v1.4.7 on a linux with two NIC.
>> One has adress 192.168.1.31 (the lan)
>> The other has a public IP. Let's say 180.180.180.180
>>
>> On the lan, I have a VPN which join two network : 192.168.1.0 and
>> 192.168.2.0
>>
>> I'm trying to forward 5900 port (vnc) to a computer which is on the =
second
>> subnet with adress 192.168.2.100
>> iptables -A PREROUTING -t nat -p tcp  -i eth1 --dport 5900 -j DNAT
>> --to-destination 192.168.2.100:5900
>> iptables -A FORWARD -p tcp -d 192.168.2.100--dport 5900 -j ACCEPT
>> and it doesn't work
>>
>> I've tried the same on the local network with adress 192.168.1.99
>> iptables -A PREROUTING -t nat -p tcp  -i eth1 --dport 5900 -j DNAT
>> --to-destination 192.168.1.99:5900
>> iptables -A FORWARD -p tcp -d 192.168.1.99--dport 5900 -j ACCEPT
>> and it's working like a charm
>>
>> I've done my test with another computer with public adress 200.200.2=
00.200
>>
>> I've done a netstat one the two computers
>> on 192.168.2.100 i've seen he's talking to 180.180.180.180 (<-- my s=
erver
>> running iptable)
>> on 192.168.1.99 i've seen he's talking to 200.200.200.200 (<-- the
>> computer on internet which i'm running my test from)
>>
>> thanks for your attention
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

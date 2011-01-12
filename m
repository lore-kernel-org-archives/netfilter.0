From: Roc Bai <buroc83@gmail.com>
Subject: Re: How to redirect the package from eth0 to eth2
Date: Wed, 12 Jan 2011 10:00:19 +0800
Message-ID: <AANLkTi=+b_xo=2vOTtzSHW4bLQHjtkXyC-gMvqMuZbkJ@mail.gmail.com>
References: <AANLkTik5YfQ4eNzbSVt5QfmaEQnBA=VJ1NbueKgq9nZj@mail.gmail.com>
	<20110110115615.GH25060@outback.rfc2324.org>
	<AANLkTiniEo+DvnWfZQDU3FBZ7iAoqTnqAYuE1QbR=Wt2@mail.gmail.com>
	<alpine.LNX.2.01.1101111202140.15356@obet.zrqbmnf.qr>
	<AANLkTinvmfXMtPTP1KuZ6_t_KQCqSoQVEFEEBihhzcfa@mail.gmail.com>
	<4D2CFDE6.7040202@treenet.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=YTB1zKHpT1moapXsPXV5p1YyZMrvKtrOoaZNJ1TXHGM=;
        b=Op6ywRVxShaCggKAUrvNIMh1ulSXkKDMF8xXg1/L2g0QSSt/P74TxHEuwuZboQWUId
         AJdQOM6kkT69YPSXDKvv+rTO/vGwWznAW3ykbiC/qc5o6CF7HxtqmDbpUxmuWcjTIwj7
         DxCKIhyn5akNYEouEXcYubvciTRaHnwe0sEBw=
In-Reply-To: <4D2CFDE6.7040202@treenet.co.nz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Amos Jeffries <squid3@treenet.co.nz>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

2011/1/12 Amos Jeffries <squid3@treenet.co.nz>:
>
> On 12/01/11 04:26, Roc Bai wrote:
>> 2011/1/11 Jan Engelhardt<jengelh@medozas.de>:
>>>
>>> On Tuesday 2011-01-11 04:22, Roc Bai wrote:
>>>>>> Dear all:
>>>>>> =A0 =A0 =A0in my service, there are four net card. =A0eth0, eth1=
, eth2, eth3.
>>>>>> I
>>>>>> want to forward the data in from eth0 to eth1, eth2, eth3 with
>>>>>> different application protocol. Does some body send me some idea=
s on
>>>>>> it?
>>>>>
>>>>> If you want to re-route packages, that has to happen in pre-routi=
ng.
>>>>> If you want to use DNAT for examples, just add a rule to the
>>>>> PREROUTING chain in the nat table.
>>>>
>>>> I think the DNAT should change the package data, including the IP =
or
>>>> higher level protocol header, isn't it?
>>>
>>> That is the point of NAT. NAT is _not_ routing/forwarding (dammit).
>>> And it's "packet", not "package".
>>>
>>>> I think the best idea which can redirect the package is to add/cha=
nge
>>>> the route rule to do it. I have write some source codes which does=
n't
>>>> work.
>>>
>>> That's redundant (and as you can see, error prone). Just use
>>> the iproute utilities to define extra rules and routes, which
>>> are known to work.
>>>
>>>> ncf_get_entry() can generate a dst_entry whose dev point to the et=
h2
>>>> net_device structure. But when i use tcpdum -i eth2. I cannot get =
the
>>>> package from eth0. So it doesn't work.
>>>
>>> I don't expect it to. You are using a global variable, which is not
>>> SMP-safe without a lock.
>>> You might find Paul McKenny's Parallel Programming Book helping.
>> Jan, thanks your comments.
>> I want to make the packet ( I think it's right now:) ) redirected to
>> an anticipant port, so I haven't consider the concurrent problem now=
=2E
>>
>> In the requirement, redirect the packet with protocal is the first
>> step, and in the second step, the system should redirect the packet
>> with application packet content, such as GET in HTTP.
>>
>> eth0 ---------- if (GET in =A0SKB), redirect to ----------> =A0eth2
>>
>> So i think i have to write my module to redirect the packet now, and
>> then i can change little in the future. That's the key why i thouldn=
't
>> to use the exist nat/diverter tool.
>>
>> Maybe i want to know =A0how to set the SKB in the
>> ip_route_input_common() routine. Then the SKB can be send out from
>> eth2 port. So
>> whether my plan is right, to create a dst-entry and add it to
>> skb->_skb_refdst? and Whether the dst_entry optiosn values are
>> corrent?
>>
>
> This discussion is showing signs of being an XYZ problem.
> http://www.perlmonks.org/index.pl?node_id=3D542341
>
> Roc Bai, are you attempting to do this redirection for *any* protocol=
? or
> just for some specific ones related to a not mentioned task?
Any protocol, such as

packets in from eth0 ----> Http to eth1
                              -----> Ftp to eth2
                              -----> RTSP to eth3

Note, I thould check the content (But not the app port, such as 80 for
http, as it doesn't work all the time) which the packet use which
kinds of protocol, then i redirect it.
>
>
> AYJ
>



--=20
------------------------

Thinking before action, but you are wasting time if you don't do action=
=2E

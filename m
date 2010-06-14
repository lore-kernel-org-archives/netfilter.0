From: GLAUME Vincent <vincent.glaume@cea.fr>
Subject: Re: Using conntrack to create new expectation entry
Date: Mon, 14 Jun 2010 10:15:05 +0200
Message-ID: <4C15E509.90808@cea.fr>
References: <4C120872.4040308@cea.fr> <4C156896.1000600@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C156896.1000600@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Pablo Neira Ayuso a =E9crit :
> GLAUME Vincent wrote:
>  =20
>> Hi there,
>>
>> I'm currently trying to figure out how the whole libnetfilter_conntr=
ack
>> works, and more precisely the expect part of the lib.
>> My aim is to be able to create new expectation entries with this lib=
 in
>> an application that would inspect packets (either coming from a
>> pcap-based sniffer or from netfilter via the nfqueue mechanism) : th=
us
>> I'd like to allow connections related to the inspected (and already
>> allowed) connections.
>>
>> My various tests make me think that to create such an expectation en=
try,
>> a kernel module related to the master connection is required: am I r=
ight?
>> For instance, the "expect_create" app in the libnetfilter_conntrack
>> "utils" subdirectory works fine, unless I modify the destination por=
t of
>> the master conntrack structure... then it's no longer related to the=
 FTP
>> conntrack mechanism...
>> Same thing happens when using the conntrack app. from the conntrack-=
tools.
>>
>> So, I'd like to know how to do this the right way, without coding th=
e
>> whole inspection thing in a kernel module (if this is possible). Is
>> there any generic tcp conntrack system that could help here?
>> As I'm not too sure to fully understand the whole mechanism of expec=
ted
>> connection creation, any hint is welcome!
>> I hope this is not too confused... Thanks,
>>    =20
>
> IIRC, this requires a couple of patches for the kernel to fully suppo=
rt
> conntrack helpers in user-space, which seems to be what you need. So
> this is not support until the appropriate patches go into the kernel.
>  =20

Thank you for this hint, I'm going to dig it...
I wish I could understand why/how it works pretty well with the FTP=20
conntrack though!

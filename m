From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Bastille/netfilter with Linux 2.6.28 blocks connections
Date: Wed, 07 Jan 2009 21:15:22 +0100
Message-ID: <49650D5A.8080309@chello.at>
References: <669090226@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <669090226@web.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Roland H=E4der wrote:
>> line 144: -A PUB_IN -s 192.168.1.0/24 -j LOG --log-prefix "PUB_IN DR=
OP 8 "
>>
>> says: 'PUB_IN DROP 8'
>>
>> your log says: Jan 5 13:49:12 firebox kernel: INPUT DROP 8
>>
>> this is not the rule matching in the log. otherwise it would say PUB=
_IN=20
>> DROP 8 in your logs.
>>    =20
> Okay please redownload this file:
> http://www.mxchange.org/downloads/firebox/iptables.list
>
> I have updated it. Output of "iptables -v" said version 1.4.2
>
> Roland
>  =20

ok,

your log says connections come into interface 'ppp0'.
those get dropped because there's no allow rule for them.
to do it with your configuration, you need two rules like:

-A INPUT -i ppp0 -j PUB_IN
-A OUTPUT -o ppp0 -j PUB_OUT

greets

mart




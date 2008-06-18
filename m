From: Douglas Rabe <drabe@sensis.com>
Subject: Re: Why is this traffic dropped?
Date: Wed, 18 Jun 2008 15:20:23 -0400 (EDT)
Message-ID: <200806181920.m5IJKNR7025286@doug.ats.sensis.com>
References: <alpine.LNX.1.10.0806182036500.14231@fbirervta.pbzchgretzou.qr>
Reply-To: drabe@sensis.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0806182036500.14231@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org
Cc: =?UTF-8?B?R8Ohc3DDoXIgTGFqb3M=?= <swifty@freemail.hu>, Rabe Douglas <drabe@sensis.com>

>On Wednesday 2008-06-18 20:03, G=C3=A1sp=C3=A1r Lajos wrote:
>
>> Douglas Rabe wrote:
>>> Greetings,
>>>
>>> I dont understand why this traffic is dropped?
>>>
>>> Jun 18 17:03:39 iahabs1 kernel: IN_DROP: IN=3Deth0 OUT=3D
>>> MAC=3D00:1c:23:ca:ec:1d:00:1b:53:87:68:c0:08:00 SRC=3D10.192.130.10=
4
>>> DST=3D192.168.51.1 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D119 ID=3D5=
563 DF PROTO=3DTCP
>>> SPT=3D35557 DPT=3D80 WINDOW=3D65149 RES=3D0x00 ACK FIN URGP=3D0
>>
>> Because it is a FIN packet... =3D  ! (NEW,RELATED or ESTABLISHED) bu=
t
>> INVALID !!!
>
>Seriously, FIN packets should not be dropped, otherwise a connection
>is lurking around until it times out.

So, how do I fix my firewall not to drop these FIN packets?
   iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
There is no --state FIN is there?

--=20
Douglas Rabe
drabe@sensis.com
315-234-7995

From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: [half_OT]Traffic shaping with tc and iptables
Date: Thu, 08 Sep 2011 13:20:43 +0200
Message-ID: <4E68A50B.5000901@freemail.hu>
References: <CAGRr-qktvGncegdp+7X7Xb7Q9L0Q+FAn3+gPHGy+XJhDRtkQYg@mail.gmail.com>	<4E688763.2060209@freemail.hu> <CAGRr-qm4gF8ZzvE9D5vXb-RLKXiELsj_P8KrOk9aOHTWRK01kQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAGRr-qm4gF8ZzvE9D5vXb-RLKXiELsj_P8KrOk9aOHTWRK01kQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Marco Coda <marco.coda7@gmail.com>
Cc: netfilter@vger.kernel.org


2011-09-08 12:54 keltez=E9ssel, Marco Coda =EDrta:
>> IPTABLES=3D/sbin/iptables
>> nic=3Deth0
>> port=3D25
>> upload=3D10kbit
>> bandwith=3D2Mbit
>>
>> $IPTABLES -t mangle -A OUTPUT -p tcp -o $nic --sport $port -j MARK -=
-set-mark 1
AAAAAAAAAAArrrrrghhhh!!!! :D

If you SEND a mail FROM your server to an ANOTHER server then the=20
DESTINATION port will be 25 !!!! :D

$IPTABLES -t mangle -A OUTPUT -p tcp -o $nic --dport $port -j MARK=20
--set-mark 1

Try again!!! :D

Swifty

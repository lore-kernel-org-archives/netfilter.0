From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: [half_OT]Traffic shaping with tc and iptables
Date: Thu, 08 Sep 2011 14:22:53 +0200
Message-ID: <4E68B39D.60703@freemail.hu>
References: <CAGRr-qktvGncegdp+7X7Xb7Q9L0Q+FAn3+gPHGy+XJhDRtkQYg@mail.gmail.com>	<4E688763.2060209@freemail.hu>	<CAGRr-qm4gF8ZzvE9D5vXb-RLKXiELsj_P8KrOk9aOHTWRK01kQ@mail.gmail.com>	<4E68A50B.5000901@freemail.hu> <CAGRr-qnYAGqqw8pt2CAzffs+9aL9LCQ9dcVN1NL61NzKHP9ZkA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAGRr-qnYAGqqw8pt2CAzffs+9aL9LCQ9dcVN1NL61NzKHP9ZkA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Marco Coda <marco.coda7@gmail.com>
Cc: netfilter@vger.kernel.org


2011-09-08 14:10 keltez=E9ssel, Marco Coda =EDrta:
> With this rule it does not work at all.. :(
What do you mean it does not work at all???
Does the packet counter shows that the rule got any hit??? (iptables=20
-vnL OUTPUT -t mangle)
Can you see the mark in the conntrack??? (conntrack -L | grep 'mark=3D1=
')
> At least before, even if I understand that concectually is not
> correct, with --sport, traffic was shaped, in some manner, whth a
> strange rate..
- You can only shape those traffic that leaves your system...
- If you send an e-mail then you connect from your system (from a rando=
m=20
port) to a mail server (to 25)...
- If you set your upload limit to 10kbit then you can send 1,25KByte pe=
r=20
sec. (It is veeerrryy slooow.) Would you try with my proposed settings?=
??

Swifty

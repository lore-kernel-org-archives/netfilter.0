From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: [half_OT]Traffic shaping with tc and iptables
Date: Thu, 08 Sep 2011 16:52:16 +0200
Message-ID: <4E68D6A0.9020807@freemail.hu>
References: <CAGRr-qktvGncegdp+7X7Xb7Q9L0Q+FAn3+gPHGy+XJhDRtkQYg@mail.gmail.com>	<4E688763.2060209@freemail.hu>	<CAGRr-qm4gF8ZzvE9D5vXb-RLKXiELsj_P8KrOk9aOHTWRK01kQ@mail.gmail.com>	<4E68A50B.5000901@freemail.hu>	<CAGRr-qnYAGqqw8pt2CAzffs+9aL9LCQ9dcVN1NL61NzKHP9ZkA@mail.gmail.com>	<4E68B39D.60703@freemail.hu> <CAGRr-qn=ngiO6oNdecnpa5BRcTBEJuZzd3g+JOk015P84JV0JA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAGRr-qn=ngiO6oNdecnpa5BRcTBEJuZzd3g+JOk015P84JV0JA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Marco Coda <marco.coda7@gmail.com>
Cc: netfilter@vger.kernel.org, Nikolay Kichukov <hijacker@oldum.net>

2011-09-08 16:00 keltez=E9ssel, Marco Coda =EDrta:
> I just tried it, with rare 1Mbit, bandwidth 2 Mbit and iptables with
> --dport 25 and, even if the iptables rule is matched (I can see the
> packet count measuring the right size of the mail), tc seems to ignor=
e
iptales rule matched -> that is good !!! :D
> those packets. I know that my postfix open a connection to another mt=
a
> from a pseudo-random port to 25, but with --dport option tc does not
> consider these packets. Instead, with --sport option, I don't know
> why, something is filtered...
>
Do you see the connection in conntrack??? With the mark=3D1 value???
Maybe you are trying to set the whole tc on the wrong interface ?!? (As=
=20
I mentioned before: You can shape the leaving traffic... On the=20
interface that is used for the connection...)
>> - If you set your upload limit to 10kbit then you can send 1,25KByte=
 per
>> sec. (It is veeerrryy slooow.)
> In this moment I set this speed so I can test the server with small
> attachments... When the script will be definitively complete,I'll set
> the real values..
Maybe too low values would disable the tc?!? (I am really not sure abou=
t=20
it... :D )
>
> 2011/9/8 Nikolay Kichukov<hijacker@oldum.net>:
>
>> tc does not require iptables to shape traffic at all. So why botheri=
ng?
Yes, it can be done without iptables... But filtering in iptables=20
"maybe" easier than in tc...
Currently it does not work at all... :(

Swifty


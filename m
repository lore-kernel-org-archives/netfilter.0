From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Help with invalid packets.
Date: Mon, 19 Mar 2012 16:58:49 +0100
Message-ID: <4F6757B9.2060103@freemail.hu>
References: <BLU144-W3712D3E518F5611A6BD840D0420@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BLU144-W3712D3E518F5611A6BD840D0420@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Micheal Wolfskill <tdgh2323@hotmail.com>
Cc: netfilter@vger.kernel.org

Hi,

202-03-19 16:39 keltez=E9ssel, Micheal Wolfskill =EDrta:
> Its not affecting the normal viewing of my site.. but I wish to know
> why it is matching these packets as Iam sure it should not.
Don't be so sure! :D

AFAIK iptables/netfilter uses a different state machine than the TCP=20
stack in the kernel...

http://userpages.umbc.edu/~jeehye/cmsc491b/lectures/tcpstate/sld001.htm
http://www.lug.or.kr/docs/iptables-tutorial/chunkyhtml/c4219.htm

On this page:=20
http://www.lug.or.kr/docs/iptables-tutorial/chunkyhtml/x4436.htm

"If the connection is reset by a RST packet, the state is changed to=20
CLOSE. This means that the connection per default has 10 seconds before=
=20
the whole connection is definitely closed down. RST packets are not=20
acknowledged in any sense, and will break the connection directly."

Maybe that is the source of your problem. Or there may be some timing=20
issues (lifetime of a connection, etc.)

Swifty

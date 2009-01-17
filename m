From: Peter Renzland <peter@dancing.org>
Subject: Re: Counting Connections
Date: Sat, 17 Jan 2009 13:08:54 -0500
Message-ID: <766EDACA-B529-4638-86CD-DB7621D012ED@dancing.org>
References: <5E1140B1-A4E2-4D7B-937F-7CD1DA0966D0@dancing.org> <496DA704.80302@arturaz.net>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <496DA704.80302@arturaz.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	delsp=yes"
To: =?UTF-8?Q?Art=C5=ABras_=C5=A0lajus?= <x11@arturaz.net>
Cc: netfilter@vger.kernel.org

On 09  Jan 14, at 03:49 , Art=C5=ABras =C5=A0lajus wrote:

> Peter Renzland wrote:
>> I would also like to count connections (those that have been =20
>> tracked), just like the packets and bytes that have been moved.
>> Can someone please show me how that can be done?
> New connections? -m state --state NEW should work.


I *finally* figured this out. :-)

At first I thought that this could only count packets and bytes, but I =
=20
want to count connections, not packets and bytes.  Well, since each =20
connection is started by exactly one packet, the number of such =20
packets is the number of connections that I seek.  Very clever.  =20
Thanks!!!

So, to count all connections:

iptables -N conncount
iptables -I FORWARD -j conncount
iptables -A conncount -m state --state NEW

And I can even count over-limit connection attempts:

iptables -N connover
iptables -I FORWARD -p tcp --syn -m iprange --src-range $IP1-$IP2 -m =20
connlimit --connlimit-above 100 -j connover
iptables -I FORWARD -p ! tcp     -m iprange --src-range $IP1-$IP2 -m =20
connlimit --connlimit-above  50 -j connover
iptables -A connover -j REJECT

Does that look about right?

(Do I really need that "--syn"?)


Thanks.

Peter



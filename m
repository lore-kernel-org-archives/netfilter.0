From: Glen Huang <heyhgl@gmail.com>
Subject: Re: How to trace IPSec packets?
Date: Mon, 29 Jan 2018 21:12:36 +0800
Message-ID: <CALNXhk0ocwWiNyA=x_KVqjLL-tVXE1G2Uj917JXLV-SoG79+cg@mail.gmail.com>
References: <2A246279-5BD5-4858-9E81-2132542CD4DA@gmail.com>
 <CALNXhk0TefWZQ7_e+JOuDL7Qs7KFq2DwQ4h+CayKHd3uWd_y_Q@mail.gmail.com> <CACuyg267+379fHkBactPOShqsrXzQWxq4TM6ZBFh=WJZvqN0vQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=iMNGUDKs4NOEfAsb+adMemF+4UUvnRQD9pNrrCJmYoM=;
        b=Set3Q0c4HLItxA1ntaRlEanGRfH/YMfVPVVzBsDZpOnjl4M2FevPQuj/w+iKPWwn4w
         FD+L6t85VEv4PxRH/0+I+pLHsB6iDp5QUUrRicxD4f0mFvbnvvF8PCw56DxUIKYBuTx6
         2+y5JI+2OyjMFYp8y84xO9pv2qNOep0gBEXWIV3aiy3kllK4AY4q13rZkdmbMzyKZjYn
         zfzXSiQhrPjcpUQEG8c8kJyncq5cHPrUhGfnyO2AJH7xu0VJOk3KIdJAen5FXmEAompL
         30AyHoNmMH/cTb6E0TDc5GWzQTdCS7uu7PRSiWcbPejfoVrL4ehixyZwRGhfwB4QHKyT
         4liA==
In-Reply-To: <CACuyg267+379fHkBactPOShqsrXzQWxq4TM6ZBFh=WJZvqN0vQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?Humberto_Juc=C3=A1?= <betolj@gmail.com>
Cc: netfilter@vger.kernel.org

Thanks for the reply.

> check you source routing address with this command:
> ip route get 8.8.8.8

I did not know this trick, very useful! But unfortunately my machine
is a mac, so can=E2=80=99t use that.

> after this, you need rewrite your firewall rules in a OUTPUT chain:
> iptables -t nat -I OUTPUT -s $SRC_ADDRESS -d 8.8.8.8 -p udp
> --dport 53 -j DNAT --to-destination 127.0.0.1

I tried that, doesn=E2=80=99t seem to work. I even removed the "-s
$SRC_ADDRESS=E2=80=9D flag to make sure it matches, but it didn=E2=80=99t p=
revent me
from querying 8.8.8.8 on my machine (I have shut down the local dns
forwarder, so if this rule were matched, I shouldn=E2=80=99t be able to que=
ry
8.8.8.8 at all)

I don=E2=80=99t quite understand why I should use the OUTPUT chain. In my
mind, the packets flow like this, please correct me if it=E2=80=99s not rig=
ht:

on my mac, ipsec0 interface is the default gateway

#1 client ip inside tunnel -> 8.8.8.8
|
| client kernel wraps it in ipsec
v
#2 client public ip -> server public ip
|
| server kernel unwraps it from ipsec
v
#3 client ip inside tunnel -> 8.8.8.8
|
| server forwards it by doing nat
v
#4 server public ip -> 8.8.8.8

At #3, it should reenter the ip stack and go through the nat prerouting cha=
in.

On 29 Jan 2018, at 8:25 PM, Humberto Juc=C3=A1 <betolj@gmail.com> wrote:

Hi Glen Huang,


I have an IPSec tunnel set up between my machine and a server.


- check you source routing address with this command:
ip route get 8.8.8.8

"So, replace your source address to *src ip address*"


But after dig @8.8.8.8 google.com on my machine, running grep 'TRACE:'
/var/log/kern.log on the server returned nothing.


- after this, you need rewrite your firewall rules in a OUTPUT chain:
iptables -t nat -I OUTPUT -s $SRC_ADDRESS -d 8.8.8.8 -p udp
--dport 53 -j DNAT --to-destination 127.0.0.1

"Because you are redirecting your internal traffic, use OUTPUT chain."

2018-01-29 7:07 GMT-03:00 Glen Huang <heyhgl@gmail.com>:

(Previous message seems to get smudged. This is a resent.)

Hi,

Hope the question isn=E2=80=99t too basic to be asked here.

I have an IPSec tunnel set up between my machine and a server. All
packets originate from my machine go through that tunnel and then get
forwarded by the server. I=E2=80=99m trying to redirect DNS request from my
machine to 8.8.8.8 to a dns forwarder running on the server.

I tried this on the server

iptables -t nat -I PREROUTING -s $IPSEC_VIRTUAL_IP -d 8.8.8.8 -p udp
--dport 53 -j DNAT --to-destination 127.0.0.1

But it didn't work. To make sure it wasn't because I hadn't allowed
martian packets or anything. I tried to trace the decrypted packets.

iptables -t raw -I PREROUTING -s $IPSEC_VIRTUAL_IP -d 8.8.8.8 -p udp
--dport 53 -j TRACE

But after dig @8.8.8.8 google.com on my machine, running grep 'TRACE:'
/var/log/kern.log on the server returned nothing.

According to this picture:
https://en.wikipedia.org/wiki/Iptables#/media/File:Netfilter-packet-flow.sv=
g
after decrypting the ipsec packets, netfilter will make the decrypted
packets go through the ip stack again, and the trace target should be
able to catch it.

I wonder if my mental model is incorrect or I missed something?

Regards,
Glen

On Mon, Jan 29, 2018 at 5:10 PM, Glen Huang <heyhgl@gmail.com> wrote:

Hi,

Hope the question isn=E2=80=99t too basic to be asked here.

I have an IPSec tunnel set up between my machine and a server. All
packets originate from my machine go through that tunnel and then get
forwarded by the server. I=E2=80=99m trying to redirect DNS request from my
machine to 8.8.8.8 to a dns forwarder running on the server.

I tried this on the server

iptables -t nat -I PREROUTING -s $IPSEC_VIRTUAL_IP -d 8.8.8.8 -p udp
--dport 53 -j DNAT --to-destination 127.0.0.1

But it didn't work. To make sure it wasn't because I hadn't allowed
martian packets or anything. I tried to trace the decrypted packets.

iptables -t raw -I PREROUTING -s $IPSEC_VIRTUAL_IP -d 8.8.8.8 -p udp
--dport 53 -j TRACE

But after dig @8.8.8.8 google.com on my machine, running grep 'TRACE:'
/var/log/kern.log on the server returned nothing.

According to this picture:
https://en.wikipedia.org/wiki/Iptables#/media/File:Netfilter-packet-flow.sv=
g
after decrypting the ipsec packets, netfilter will make the decrypted
packets go through the ip stack again, and the trace target should be
able to catch it.

I wonder if my mental model is incorrect or I missed something?

Regards,
Glen

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

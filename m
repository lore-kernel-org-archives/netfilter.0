From: Daniel Lakeland <dlakelan@street-artists.org>
Subject: nftables "meta priority set" not working
Date: Thu, 26 Nov 2020 18:51:26 -0800
Message-ID: <d3a63d2e-fe28-07f6-305f-3154e5c2094f@street-artists.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=street-artists.org; h=to
        :from:subject:message-id:date:mime-version:content-type
        :content-transfer-encoding; s=street-artists.org; bh=2OAQUIegEhw
        XfSLUO00VMgclgZs=; b=B+CdePeRd7SqdSHeKvf7z6EalI2Xo72thjEBHPK6YA8
        ubsVvMDbfCS/sbVwryQk8fzQd3oKoRqEwe85HDyYyytcVad/VbVHc7vYYUfcjlHZ
        W9we3uHEJZ0z2tLnvVQczRoUlOLTXnre4jvzBw1SmM2a8VaJI7H8dUZlhhAxgGz4
        =
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Strangely I can't seem to make a rule that sets the tc class work,=20
unless it's setting the class of the root qdisc?

Here are some rules I have:


 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ip dscp { ef, cs6 } meta priority =
set 10:1 counter packets 19=20
bytes 850
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ip dscp { cs5 } meta priority set =
10:2 counter packets 327=20
bytes 98340
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ip dscp { af41, af42, af43 } meta =
priority set 1:30 counter=20
packets 24 bytes 1584
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ip dscp { cs2 } meta priority set =
1:50 counter packets 0 bytes 0
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ip dscp { cs1 } meta priority set =
1:60 counter packets 0 bytes 0
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ip6 dscp { ef, cs6 } meta priority=
 set 10:1 counter packets 2=20
bytes 98
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ip6 dscp { cs5 } meta priority set=
 10:2 counter packets 91=20
bytes 8328
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ip6 dscp { af41, af42, af43 } meta=
 priority set 1:30 counter=20
packets 0 bytes 0
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ip6 dscp { cs2 } meta priority set=
 1:50 counter packets 53270=20
bytes 16712716
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ip6 dscp { cs1 } meta priority set=
 1:60 counter packets 0 bytes 0


As you can see the first two have hit a combined 346 packets... but yet..

tc -s qdisc show dev eno1

...

qdisc drr 10: parent 1:10
 =C2=A0Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 =C2=A0backlog 0b 0p requeues 0


No packets have gone through qdisc 10:


whereas other rules that classify to 1:30 1:50 and 1:60 are hitting and=20
shoving their packets into the fq_codel below those classes:

tc -s class show dev eno1

class hfsc 1: root
 =C2=A0Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 =C2=A0backlog 0b 0p requeues 0
 =C2=A0period 0 level 2

class hfsc 1:10 parent 1:1 leaf 10: rt m1 882Mbit d 20.0ms m2 20Mbit
 =C2=A0Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 =C2=A0backlog 0b 0p requeues 0
 =C2=A0period 0 level 0

class hfsc 1:1 parent 1: ls m1 0bit d 0us m2 980Mbit ul m1 0bit d 0us m2=20
980Mbit
 =C2=A0Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 =C2=A0backlog 0b 0p requeues 0
 =C2=A0period 69795 work 12748919 bytes level 1

class hfsc 1:30 parent 1:1 leaf 30: ls m1 588Mbit d 60.0ms m2 196Mbit
 =C2=A0Sent 436 bytes 4 pkt (dropped 0, overlimits 0 requeues 0)
 =C2=A0backlog 0b 0p requeues 0
 =C2=A0period 4 work 436 bytes level 0

class hfsc 1:40 parent 1:1 leaf 40: ls m1 196Mbit d 60.0ms m2 490Mbit
 =C2=A0Sent 8189138 bytes 54857 pkt (dropped 0, overlimits 0 requeues 0)
 =C2=A0backlog 0b 0p requeues 0
 =C2=A0period 54850 work 8189138 bytes level 0

class hfsc 1:50 parent 1:1 leaf 50: ls m1 147Mbit d 60.0ms m2 196Mbit
 =C2=A0Sent 4559345 bytes 14975 pkt (dropped 0, overlimits 0 requeues 0)
 =C2=A0backlog 0b 0p requeues 0
 =C2=A0period 14941 work 4559345 bytes level 0

class hfsc 1:60 parent 1:1 leaf 60: ls m1 49Mbit d 60.0ms m2 98Mbit ul=20
m1 0bit d 0us m2 931Mbit
 =C2=A0Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
 =C2=A0backlog 0b 0p requeues 0
 =C2=A0period 0 level 0

What is going wrong?




From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: shaping vlans - revisited
Date: Thu, 3 Feb 2011 13:38:11 -0200
Message-ID: <20110203133811.3661ee5f@pulsar.inexo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi All

I posted on 6th january about shaping vlans and got the answer bellow.

I may be wrong but I did some tests and it seems to me the the answer is not
correct.

I have this setup (partial):
The router where these rules are set is a border passthru router
(eth0=inner , eth1=outer interface with dozens of vlans attached).

/sbin/tc class add dev eth0 parent 1:23 classid 1:2345 htb prio 1 \
	rate 201kibit ceil 2024kibit
/sbin/tc filter add dev eth0 protocol ip parent 1: pref 3 \
        u32 match mark 0x2626 0x0000ffff \
        flowid 1:2345

/sbin/tc class add dev eth1 parent 2:23 classid 2:2345 htb prio 1 
	rate 201kibit ceil 2024kibit
/sbin/tc filter add dev eth1 protocol ip parent 2: pref 3 \
        u32 match mark 0x2626 0x0000ffff \
        flowid 2:2345

The vlans are attached only to eth1.

I can see the counters increase (tc -s ...) for classid 1:2345 (eth0) but
they are zero for classid 2:2345 (eth1 - which the vlans are attached in)

If the first answer to my last post is correct (shaping ethX will
automatically shape its attached vlans - which is the behavior I want)
what is wrong with this setup?

Regards

Ethy


List:       netfilter
Subject:    Re: shaping vlans
From:       Marek Kierdelewicz <marek () piasta ! pl>
Date:       2011-01-06 19:59:04
Message-ID: 20110106205904.4f248721 () kuguar
[Download message RAW]

>Hi all

Hi,

>question: if I shape the traffic (using "tc {qdisc,class,filter} add
>dev ...") through some ethX that has some 802.1q vlans attached to it,
>the vlans traffic will be also shaped or I will have to attach one
>qdisc to each vlan??

Traffic going out throu vlan interfaces will get shaped by qdisc on
the base interface. If you add qdisc on both ethX AND ethX.Y, then
traffic will be shaped on both.

If you want to do selective per vlan shaping then add qdiscs to ethX.Y
interfaces.

best regards,
Marek Kierdelewicz

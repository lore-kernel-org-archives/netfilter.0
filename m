From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: shaping vlans
Date: Thu, 6 Jan 2011 20:59:04 +0100
Message-ID: <20110106205904.4f248721@kuguar>
References: <20110106151357.3d03c1c2@pulsar.inexo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110106151357.3d03c1c2@pulsar.inexo.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc: netfilter@vger.kernel.org

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

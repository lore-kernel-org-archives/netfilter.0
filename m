From: Jamal Hadi Salim <jhs@mojatatu.com>
Subject: ANNOUNCE: New talk accepted on IO no Things
Date: Mon, 6 Mar 2017 08:32:21 -0500
Message-ID: <5dea07e6-10bc-421f-15d2-a4f71a4bf7b5@mojatatu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=fjbcAjpin9d8l51FAc7wW/EPK6baAxDKBgaicuJvvqA=;
        b=e0rYaze50oQxtjJPECZauiZSf4YXC4DKImPtZSEMQkn3F8hKXiMkh2ca5JbaOqr3p5
         0YQIgZ+psveh8sGcaDdme8fkcUREZc+Hzk7NPdKH3lS1BIjozJZ4oxPaLq4c91/F7xrw
         fPvgBI9+5LPR359RRvT9Kg9fvl8ZBR/w1h91H2UrxBiS6IVndXIArtgSMKMTPmnxVT0L
         OD0c4mIEFsubXRZdqH9oEIX/VdIWgj3hRR3HpFOSux19mQGIDZOsVBUX7EHm9EiZnj59
         DO0XTdY0Y27Zo6b6OniTBkvu260jdcUL0hiOgI7vnAfOztKGZW5TYUvlZ96rndR/uFoB
         w02g==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: people@netdevconf.org
Cc: tech-committee@netdevconf.org, netfilter-devel@vger.kernel.org, Brenda Butler <bjb@mojatatu.com>, Stephen Jaworski <jaws@mojatatu.com>, netfilter@vger.kernel.org, linux-wireless@vger.kernel.org


The tech committee would like to announce a new accepted talk.

Alexander Aring will give a talk on IOT _without the things_ ;->
Building virtual 6LoWPAN Mesh Networks

Details on the talk:
----

Operating IEEE 802.15.4 6LoWPAN IOT networks often requires to deal
with lossy wireless connections. This often requires to run
experimental work with IPV6 routing protocols e.g RPL etc. Such
experimental work requires a physical environment which is difficult
to create or expensive to setup.

In this talk we describe our approach to create a virtual networking
environment to address this challenge.
We use the virtual IEEE 802.15.4 driver "fakelb" to emulate
multiple virtual PHYs which can talk to each others.

The fakelb driver is similar to the mac80211_hwsim driver and doesn't
require any IEEE 802.15.4 hardware.

In addition we provide a mechanism to create a mesh network topology
where these virtual PHYs act as graph edges. Edges are modeled in the
config as simple 2D-vectors each of which represents the connection between
one PHY to another PHY. On top of each PHY you can run several 6LoWPAN
interfaces separated by a network namespace (container).

It is possible to use AF_PACKET to connect other IEEE 802.15.4
Stacks(e.g RIOT-OS or OpenThread) to be part of the setup interacting
with the Linux kernel IEEE 802.15.4 stack implementation.

In addition to the described static configuration, it is possible to
make runtime changes on the physical layer e.g. topology changes or
manipulate link quality parameters on a per connection basis. Upper
protocols like RPL need to react on these changes and offer new
routing paths for your 6LoWPAN network. This talk will describe the
current state of this work and how you can use it. If time permits, We
will do a live demonstration of some RPL example where we create a
mesh network with multiple nodes.
----

cheers,
jamal

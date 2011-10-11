From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: filter before NAT
Date: Tue, 11 Oct 2011 11:24:53 -0300
Message-ID: <20111011112453.49d1a3f1@pulsar.inexo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi All.

I am trying to control some outbound traffic thru a Linux NATing box via this:

$TC filter add dev $INTERNET protocol ip parent 3: pref 1 \
   u32  \
      match ip src 192.168.106.2  \
   flowid 3:5602

The problem is that the packets are hooked *after* passing SNAT and all the
rules can see is the outbound IP. So no redirects to the corresponding
flowid occur.

Is it possible to make the filter rule above "see" the packets before they
get NATed?

Environment
	Slackware 12.1.0 kernel 2.6.24.5-smp
	

Regards

Ethy

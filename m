From: Mihamina Rakotomandimby <mihamina@gulfsat.mg>
Subject: connlimit and NEW state
Date: Thu, 10 Jun 2010 08:50:55 +0300
Message-ID: <20100610085055.246b64f3@pbmiha.malagasy.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Manao ahoana, Hello, Bonjour,

I have a sofwtare, *like*  http://coova.org/ (access controller) but old
and proprietary, that allows people to connect to internet after
identifying through a web form.

If the user is not identified, when he tries to browse Internet, he is
redirected to the identification web form. Identification is posible
only via the web form.

The problem is there are some users trying to DOS by overloading the
redirection.

I setup a filtering bridge before the access controller in order to
limit trigerring the web redirection. I put a very basic rule:


  $ sudo brctl show
  bridge name       interfaces 
  br0               eth1 eth2

  #!/bin/bash
  CLIENTS1=eth1
  ACCESS_CONTROLLER=eth2
  iptables -A FORWARD -i br0 \
        -m physdev --physdev-in $CLIENTS1 \
        -p tcp -m state --state NEW -j connlimit
  [...]
  iptables -A connlimit  -m connlimit \
        --connlimit-above 15 -j DROP

This seems to limit the DOS, and the results are quite satisfying me.
I limit NEW connections to 15 parallell ones. Is it really "real time"?

I guess there is a time interval, but did not find how tiny it is (1
second? 1 millisecond?...)

Misaotra, Thanks, Merci.

-- 
       Architecte Informatique chez Blueline/Gulfsat:
    Administration Systeme, Recherche & Developpement
                                     +261 3456 000 19

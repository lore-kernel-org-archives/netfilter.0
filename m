From: Diogo Sperb Schneider <diogo@kildare.ind.br>
Subject: Re: Routing HTTP Through Another Link
Date: Fri, 11 Sep 2009 15:19:50 -0300
Message-ID: <3b71447d0909111119s73f379f0s8f397f6849e9aad7@mail.gmail.com>
References: <3b71447d0909110730k71e340e2uec06d35c842fd73d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3b71447d0909110730k71e340e2uec06d35c842fd73d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Well, I ended up separating link usage between servers and
workstations, rather than by service.

A few magic words did the trick for me:

ip route add default via $WAN_IP_ADDR dev eth1 table WAN
ip route add default via $ADSL_IP_ADDR dev eth2 table ADSL
ip rule add from $SERVER_NETWORK table WAN

Thanks anyway!

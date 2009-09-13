From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Routing HTTP Through Another Link
Date: Sun, 13 Sep 2009 08:49:20 +0200
Message-ID: <20090913084920.5f548c1f@catlap>
References: <3b71447d0909110730k71e340e2uec06d35c842fd73d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3b71447d0909110730k71e340e2uec06d35c842fd73d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Diogo Sperb Schneider <diogo@kildare.ind.br>
Cc: netfilter@vger.kernel.org

>Greetings!

Hello,

>So I tried the following:
>ip route add default via 189.30.16.65 dev eth1 table WAN # < 1 in
>...

Very strange it didn't work. Everything in your config seemed OK. Did
you try flushing route cache after reconfig? You can do this with "ip ro
flush cache".

Cheers
Marek

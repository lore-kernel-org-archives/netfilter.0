From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: Question about nat filtering with FORWARD
Date: Wed, 24 Jun 2009 20:40:03 +0100 (WEST)
Message-ID: <2546.87.196.56.230.1245872403.squirrel@webmail.decimal.pt>
References: <4161.192.168.1.3.1245837879.squirrel@webmail.decimal.pt>
    <200906241320.13779.christoph.paasch@gmail.com>
    <1872.192.168.1.3.1245842645.squirrel@webmail.decimal.pt>
    <200906241347.41841.christoph.paasch@gmail.com>
    <2108.192.168.1.3.1245856012.squirrel@webmail.decimal.pt>
    <56378e320906240826w146d9f1cnd443a5997137e281@mail.gmail.com>
    <2989.192.168.1.3.1245858328.squirrel@webmail.decimal.pt>
    <bf0e93a30906241110g3f6ab35al583c451c2ca2b777@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <bf0e93a30906241110g3f6ab35al583c451c2ca2b777@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jorge =?iso-8859-1?Q?D=E1vila?= <jorgedavilalopez@gmail.com>
Cc: Richard Horton <arimus.uk@googlemail.com>, netfilter@vger.kernel.org

> Hi Jorge,
>
> Well, the scenary is that you want to allow outgoing traffic to tcp
> port number 22 from your internal LAN.
>
> The rules suggested
>
>
> 1) $ipt -P FORWARD DROP
> 2) $ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> 3) $ipt -A FORWARD -m state --state NEW -p tcp --dport 22 -j ACCEPT
>
>
> are for:
>
> 1) Apply a POLICY to DROP any packet that does not match any rule in
> the chain (in this case, the FORWARD chain)
>
> 2) Allow incoming traffic in response to traffic generated from your
> internal network or from the GNU/Linux router itself. If you does not
> use that rule (the second rule) you will not able to "speak" with the
> world
>
> 3) Allow packets marked with the SYN flag to travel to the world, but
> if the second rule does not exists, the traffic in response to the
> initial request to initiate a ssh sesion will not receive an answer
> from the world.
>
> I suggest you try to understand the mechanics to establish a tcp sesion.


Thanks alot!
This inicial part helps.
I know how to do basic filtering with input/output, and i was doing nat
filtering with the PREROUTING chain and it was easy, now things got a bit
complicated for me :-) i have to study again... last time i did this was
more than 5 years ago, i have to RElearn iptables basics!

jorge,


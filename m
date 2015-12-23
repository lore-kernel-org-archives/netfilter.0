From: =?UTF-8?Q?=C4=B0brahim_Ercan?= <ibrahim.metu@gmail.com>
Subject: connlimit counters start over after iptables restored
Date: Wed, 23 Dec 2015 15:44:31 +0200
Message-ID: <CAK6Qs9nyXX3M9nU7-zH04451Tg1U5LwuGdBcUWX0PAVjKAA3-A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=vU0MAtjftX45q31E0KH0qsF9mkhkOOiu4HB9U2pTndA=;
        b=y5mrpRknnLw/iVMWNi5zRYA2089XdTUVytwbA3q8yLQwMwon+3QtFZT9u1K4DOF9+G
         0jC/G2AfLsgja/jSJiGyOjC8qgVv6pBxV37mD/hjFyu0i0b3Rjh4ou6VWIk8vNe0jiUY
         mQPLmeuvzxQtxW/7Is728t1gpu5mviR+Kkc7KQlOWxO/3WIf4byC3Pl1T5YJzcYaCd05
         b9AUAntByg8i032AZigQlaWN6T4nBBVzRZsAyeQtqpM9OOZJu1DY14e+BsYLonwgkzwx
         jYXTSdpQHUwL8fuPgKqskidFFGKMtNUmz9//uRW0MoLRBPO1VOHN+AhXn3LRdyGugxYE
         nY/Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

I have a connlimit rule in iptables that allow only 5 connection to por=
t 80.

iptables -A FORWARD -p tcp -m tcp --syn --dport 80 -m connlimit
--connlimit-above 5 --connlimit-saddr -j DROP

This rule works fine till I restore iptables. After restore rules,
connlimit counters start over and clients/attackers can open 5 more
connection.

Is it possible to avoid this situation?



--
=C4=B0brahim Ercan

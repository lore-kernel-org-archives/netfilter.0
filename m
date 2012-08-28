From: rahul shrivastava <shrivastavaone@gmail.com>
Subject: -f option with iptables
Date: Tue, 28 Aug 2012 18:40:24 +0530
Message-ID: <CAE1WnGd1ZHJDJEbOkBqbWqRSuNUTBy_Guo4bG3DMP783y=0Q9A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=tUR/UHlifSSawKQxNNNn08nJWvNiKUOSQsvrXCBHjHs=;
        b=B+HfxHR/GCaxxW0m6BEfam13jpKWGLlyCc5lbFlCTjcXOM//LARBn1Nmsu3qC9Q2t1
         PWemU5dXXcccHebHKxXv8bWO7/oUZzdDP5QzvzW7SneBut59pQm5wYsMCv3ste4u0aEy
         awcpt/K8+2+WTN/zw+tEtzIL23tosy2ZM8mTqh1q9jJAGoF5k7X+XBPKO2gcpth/22Iu
         4ZK1DFA6w6Q90GOCkwMfoG7xtc0gSELejjGNCu3HAwKS5LHRaOT3nQBr0zW53S1yhpW/
         eC8K722hs/I8My8HuKBCvC7BYcuqfZqiU1Ak0WwnuwquQzHAg0JMpxtZSUZdbI/P89lc
         pNbw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi,
linux version 2.6.35
iptables v1.4.9.1

my setup consists of two systems system A and system B
i am using following rules on  system A

iptables -I INPUT  -f -j DROP
iptables -I OUTPUT  -f -j DROP
iptables -I FORWARD  -f -j DROP

from system B i am doing  ping -s 32768 172.31.114.239(system A)

ping -s 32768 172.31.114.239
PING 172.31.114.239 (172.31.114.239) 32768(32796) bytes of data.
32776 bytes from 172.31.114.239: icmp_req=1 ttl=64 time=6.02 ms
32776 bytes from 172.31.114.239: icmp_req=2 ttl=64 time=6.00 ms
32776 bytes from 172.31.114.239: icmp_req=3 ttl=64 time=6.01 ms
32776 bytes from 172.31.114.239: icmp_req=4 ttl=64 time=6.01 ms
32776 bytes from 172.31.114.239: icmp_req=5 ttl=64 time=6.02 ms
32776 bytes from 172.31.114.239: icmp_req=6 ttl=64 time=6.00 ms

i am getting ping reply from system A
-f is supposed to drop 2nd  and further fragments of a packet, but
since i am getting reply it is clear that fragments are not getting
dropped.
my objective is to drop fragments. please help


Thanks in advance.

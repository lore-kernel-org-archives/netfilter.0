From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: How to redirect the package from eth0 to eth2
Date: Mon, 10 Jan 2011 12:56:15 +0100
Message-ID: <20110110115615.GH25060@outback.rfc2324.org>
References: <AANLkTik5YfQ4eNzbSVt5QfmaEQnBA=VJ1NbueKgq9nZj@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTik5YfQ4eNzbSVt5QfmaEQnBA=VJ1NbueKgq9nZj@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Anno domini 2011 Roc Bai scripsit:

Hi!

> Dear all:
>     in my service, there are four net card.  eth0, eth1, eth2, eth3. I
> want to forward the data in from eth0 to eth1, eth2, eth3 with
> different application protocol. Does some body send me some ideas on
> it?

So you want to route (as in IP routing) packages to different hosts
based on protocols (as in IP, GRE, etc?) or tcp/udp ports? Is this
correct?

>    1) where i should set the hook: pre-routing or forward?
>    2) how to make the route select the target port which i hope?

If you want to re-route packages, that has to happen in pre-routing.
If you want to use DNAT for examples, just add a rule to the
PREROUTING chain in the nat table.
If you want to use real routing, there should be multiple ways to
accomplish that. I'm not sure which one is the preferred now adays.
(mark packages and us 'ip rule' and multiple routing tables, ROUTE
target, ...)

>    3) where i can get some simple source code to learn?

Source code of what?

Maybe you can say a bit more about what you exactly want to do?

Ciao
Max
-- 
The real problem with C++ for kernel modules is:
the language just sucks.
-- Linus Torvalds

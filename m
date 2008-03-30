From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: CONNMARK and ip rule fwmark
Date: Sun, 30 Mar 2008 16:53:44 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0803301648110.28605@fbirervta.pbzchgretzou.qr>
References: <046B6BE8F9E1409CAF96941CED215BD0@shs1> <bd29d6543567ecfd7c483671f163d14e@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <bd29d6543567ecfd7c483671f163d14e@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Franck JONCOURT <franck.mail@dthconnex.com>
Cc: netfilter@vger.kernel.org


On Sunday 2008-03-30 13:23, Franck JONCOURT wrote:
>> I want every reply packet belonging to every connection made through tun1
>> to
>> be send back through tun1 (not being the default gateway tough).
>> (tun1 is P-t-P, so there is no routing nessessary.)
>>
>> I tried the following:
>>
>> # iptables -t mangle -A PREROUTING -i tun1 -p tcp --syn -j CONNMARK
>> --set-mark 71

You would want to use -t mangle -A PREROUTING -i tun1 -m conntrack
--ctstate NEW -j CONNMARK --set-mark 71.

>> # iptables -t mangle -A OUTPUT -p tcp -m connmark --mark 71 -j MARK
>> --set-mark 71

Suggesting -t mangle -A OUTPUT [-m connmark --mark 71] -j CONNMARK 
--restore-mark


> What about using the nat table to add your mark on a whole connection
> instead of using the mangle table ?

Using the nat table to 'simulate' -m conntrack --ctstate NEW, that's
just a gross hack IMO. Oh and as soon as you start using IPv6,
there is no nat, so do not even think of doing it :p


># iptables -t nat -A PREROUTING -p TCP -d publicip -j DNAT --to 
>10.4.0.1
>
>My observations seem to tell me, that ip rule is evaluated BEFORE 
>iptables rules are applied, so the mark is not set yet.

See http://jengelh.hopto.org/images/nf-packet-flow.png , routing 
decision takes place in the middle. (It's called _PRE_ROUTING_ for a 
reason.)

>But I assume 
>someone else already used connmark and fwmark in conjuction, so there 
>must be a way to do it.


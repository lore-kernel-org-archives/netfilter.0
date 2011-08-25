From: Pandu Poluan <pandu@poluan.info>
Subject: Re: ssh session are hanging when firewall is restarted
Date: Thu, 25 Aug 2011 17:15:46 +0700
Message-ID: <CAA2qdGXek91jQ0Z7LRzGm4i8WQpp4ruTkqSg9GEf1Yh3UGdn_g@mail.gmail.com>
References: <CA+f1OFoJ06_94U9EpGr=85TZFyuAAScG7a-E7qzs2GuXFaRy9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+f1OFoJ06_94U9EpGr=85TZFyuAAScG7a-E7qzs2GuXFaRy9Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Adishesh M <adisheshsm@gmail.com>, netfilter@vger.kernel.org

Why do you need to restart iptables?

iptables is *not* a daemon-based service. It's always on in the
kernel. All invocation of the iptables command act *immediately*

Rgds,


On 2011-08-24, Adishesh M <adisheshsm@gmail.com> wrote:
> Hi,
> When we insert below rules into the ip tables, ssh sessions are
> hanging ( infact all tcp connection are terminated).
>
> =E2=80=9Ciptables -A INPUT -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,AC=
K SYN -m
> state --state NEW -j DROP=E2=80=9D.
>
> what is the problem with this above rule. we used this rule to drop
> bad tcp packets. when firewall is restarted using "service iptables
> restart", ssh sessions are hanging.
>
>
> Rule used for testing.
>
> ssh session hangs
> <set 1>
> --------------------------
> iptables -A INPUT -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m
> state --state NEW -j DROP
> iptables -A INPUT -d 10.255.13.157 -m state --state
> RELATED,ESTABLISHED  -j ACCEPT
> iptables -A INPUT -d 10.255.13.157 -p tcp -m tcp --dport 22 -j ACCEPT
> iptables -A  INPUT -d 10.255.13.157   -j DROP
>
>
> ssh session hangs
> <set 2>
> ----------------------------
> iptables -N TEST_LAN_1
> iptables -A INPUT -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m
> state --state NEW -j DROP
> iptables -A INPUT -d 10.255.13.157 -j TEST_LAN_1
> iptables -A TEST_LAN_1 -d 10.255.13.157 -m state --state
> RELATED,ESTABLISHED  -j ACCEPT
> iptables -A TEST_LAN_1 -d 10.255.13.157 -p tcp -m tcp --dport 22 -j A=
CCEPT
> iptables -A  TEST_LAN_1 -d 10.255.13.157   -j DROP
>
>
>
> ssh session does not hang
> <set 3>
> ---------------------------------------
> iptables -N TEST_LAN_1
> iptables -A INPUT -d 10.255.13.157 -j TEST_LAN_1
> iptables -A TEST_LAN_1 -d 10.255.13.157 -m state --state
> RELATED,ESTABLISHED  -j ACCEPT
> iptables -A TEST_LAN_1 -d 10.255.13.157 -p tcp -m tcp --dport 22 -j A=
CCEPT
> iptables -A  TEST_LAN_1 -d 10.255.13.157   -j DROP
>
>
> ssh session does not hang
> <set 4>
> ---------------------------------------
> iptables -A INPUT -d 10.255.13.157 -m state --state
> RELATED,ESTABLISHED  -j ACCEPT
> iptables -A INPUT -d 10.255.13.157 -p tcp -m tcp --dport 22 -j ACCEPT
> iptables -A  INPUT -d 10.255.13.157   -j DROP
>
>
> steps to reproduce the this issue
> -----------------------------------------------
>     iptables -F
>     iptables  -X
>     <Insert any one set of rules from set 1 or set 2 >
>     service ip6tables stop
>     service iptables save
>     iptables -L -n
>     service iptables restart
>     iptables -L -n
>
> Thanks and regards,
> Adishesh
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--=20
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/

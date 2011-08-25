From: Adishesh M <adisheshsm@gmail.com>
Subject: Re: ssh session are hanging when firewall is restarted
Date: Thu, 25 Aug 2011 11:11:38 +0530
Message-ID: <CA+f1OFpjc6Vvv-s6wCBK4GxpJvS5CuKeqmbWNRjKaGYPbzpzzw@mail.gmail.com>
References: <CA+f1OFoJ06_94U9EpGr=85TZFyuAAScG7a-E7qzs2GuXFaRy9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=HWXvIivO6J88Hi8OLYn8RqKkf9fw+Xv8JVq8wLz1NfA=;
        b=by9QNlp6w01kx0+mR1rm2Wbzh8SKeAgXbUwkUE6fRQg3XYx/ZrpDieBe+F3OzVTi3A
         IVbh9glDBRx35r3WYMHbSt27Y9cWp7xORhwk3BMLmAwlmqI2O1ULxF77kkCzY9Wu4Jcv
         i907rqATtxqejUfxkvGraJ6xiax2Ybg/QRCx4=
In-Reply-To: <CA+f1OFoJ06_94U9EpGr=85TZFyuAAScG7a-E7qzs2GuXFaRy9Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org, adisheshsm@gmail.com

Hi,

update to below help.

with only below one rule, all tcp connection are hanging.

"iptables -A INPUT -p TCP ! --syn -m state --state NEW -j DROP"

How to reproduce
-------------------------
1. open more then one ssh session to the machine
2.  iptables -P INPUT ACCEPT && iptables -F  && iptables  -X
3. service ip6tables stop
4. iptables -A INPUT -p TCP ! --syn -m state --state NEW -j DROP
5. service iptables restart

ssh session will be terminated.



I am using below operating system.
root@ATCA-N6> uname -a
Linux ATCA-N6 2.6.32-131.4.1.el6.x86_64 #1 SMP Fri Jun 10 10:54:26 EDT
2011 x86_64 x86_64 x86_64 GNU/Linux
root@ATCA-N6>


Thanks and regards,
Adishesh


libnetfilter_conntrack-0.0.100-2.el6.x86_64



Thanks and regards,
Adishesh




On Wed, Aug 24, 2011 at 7:12 PM, Adishesh  M <adisheshsm@gmail.com> wro=
te:
> Hi,
> When we insert below rules into the ip tables, ssh sessions are
> hanging ( infact all tcp connection are terminated).
>
> =93iptables -A INPUT -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SYN =
-m
> state --state NEW -j DROP=94.
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
> RELATED,ESTABLISHED =A0-j ACCEPT
> iptables -A INPUT -d 10.255.13.157 -p tcp -m tcp --dport 22 -j ACCEPT
> iptables -A =A0INPUT -d 10.255.13.157 =A0 -j DROP
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
> RELATED,ESTABLISHED =A0-j ACCEPT
> iptables -A TEST_LAN_1 -d 10.255.13.157 -p tcp -m tcp --dport 22 -j A=
CCEPT
> iptables -A =A0TEST_LAN_1 -d 10.255.13.157 =A0 -j DROP
>
>
>
> ssh session does not hang
> <set 3>
> ---------------------------------------
> iptables -N TEST_LAN_1
> iptables -A INPUT -d 10.255.13.157 -j TEST_LAN_1
> iptables -A TEST_LAN_1 -d 10.255.13.157 -m state --state
> RELATED,ESTABLISHED =A0-j ACCEPT
> iptables -A TEST_LAN_1 -d 10.255.13.157 -p tcp -m tcp --dport 22 -j A=
CCEPT
> iptables -A =A0TEST_LAN_1 -d 10.255.13.157 =A0 -j DROP
>
>
> ssh session does not hang
> <set 4>
> ---------------------------------------
> iptables -A INPUT -d 10.255.13.157 -m state --state
> RELATED,ESTABLISHED =A0-j ACCEPT
> iptables -A INPUT -d 10.255.13.157 -p tcp -m tcp --dport 22 -j ACCEPT
> iptables -A =A0INPUT -d 10.255.13.157 =A0 -j DROP
>
>
> steps to reproduce the this issue
> -----------------------------------------------
> =A0 =A0iptables -F
> =A0 =A0iptables =A0-X
> =A0 =A0<Insert any one set of rules from set 1 or set 2 >
> =A0 =A0service ip6tables stop
> =A0 =A0service iptables save
> =A0 =A0iptables -L -n
> =A0 =A0service iptables restart
> =A0 =A0iptables -L -n
>
> Thanks and regards,
> Adishesh
>

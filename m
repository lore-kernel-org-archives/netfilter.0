From: Nick Edwards <nick.z.edwards@gmail.com>
Subject: net unreachable ipv6
Date: Fri, 2 Aug 2013 00:28:41 +1000
Message-ID: <CAMD-=VJjymnAL9FuGnSTLvxFLnmAy9nrO9mdMkvbWNdiDxw1GA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=nhwDVJAza3dB7T8LzPK76oI4rvw8rNEaAezY2NT6eWg=;
        b=1AY1MBNhMuEpzZa4N86xJRra4KYboiKlP0MEAuO/nfXtGWANERpeyxvbtqXarpNEXL
         hZHp6HiLrZ4RAmhNZdkfgNoXl81am2rESNnqYpHFaI/1Rm2gsRYQkC65riLbiqh/EF2Y
         Wht6TgA/R+E/trwXsrAa9GmGugs+kqmwS6r1KWNImOmlM00/U2w7Lp1B3bJou7yV/fVj
         xPV8t8holm8VIVBm3Bd9KQhawQ78KeFEhztMVJJrlugzeC0ZnkSkTlz8NiugkIjNIqEI
         ma0EjU/BG6ycN27Y4eOouqvGHvX0UzkA6iDTeXBcVyM3ftmub9gndbNvmeuP2wd2bqCM
         RUJA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Christ I hate ipv6, POS it is...

OK, steam vented...

Folks,  I must be doing something wrong, so any pointers be appreciated.

I can not even ping6 _OUT_ unless I clear all ipv6 rules or change def
policy input to accept,  despite it being globally "allowed" already.
the machine can also not be reached either despite the ipv6 range included

Is there something broken?

(v1.4.14)

#!/bin/sh
/usr/sbin/iptables -F
/usr/sbin/ip6tables -F

/usr/sbin/iptables -P INPUT DROP
/usr/sbin/ip6tables -P INPUT DROP
/usr/sbin/iptables -P OUTPUT ACCEPT
/usr/sbin/ip6tables -P OUTPUT ACCEPT
/usr/sbin/iptables -P FORWARD DROP
/usr/sbin/ip6tables -P FORWARD DROP

/usr/sbin/iptables -A INPUT -p tcp -m tcp --dport 22 -m state --state
INVALID,NEW -j LOG


/usr/sbin/iptables -A INPUT -i lo -j ACCEPT
/usr/sbin/ip6tables -A INPUT -i lo -j ACCEPT
/usr/sbin/ip6tables -A INPUT -s fe80::/10 -j ACCEPT
/usr/sbin/ip6tables -A INPUT -d ff00::/8 -j ACCEPT

/usr/sbin/iptables -A INPUT -s 207.x.x.x -j ACCEPT
/
/usr/sbin/ip6tables -A INPUT -s 2a00:1c18:401:c00::531:2 -j ACCEPT

/usr/sbin/iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
/usr/sbin/ip6tables -A INPUT -m conntrack --ctstate
ESTABLISHED,RELATED -j ACCEPT

/usr/sbin/iptables -A INPUT -p tcp --dport 25 -j ACCEPT
/usr/sbin/ip6tables -A INPUT -p tcp --dport 25 -j ACCEPT

/usr/sbin/ip6tables -A INPUT -p icmpv6 --icmpv6-type 1 -j ACCEPT
/usr/sbin/ip6tables -A INPUT -p icmpv6 --icmpv6-type 2 -j ACCEPT
/usr/sbin/ip6tables -A INPUT -p icmpv6 --icmpv6-type 3 -j ACCEPT
/usr/sbin/ip6tables -A INPUT -p icmpv6 --icmpv6-type 4 -j ACCEPT
/usr/sbin/ip6tables -A INPUT -p icmpv6 -j DROP

#/usr/sbin/ip6tables -A INPUT -p icmpv6 --icmpv6-type echo-request -j DROP
#/usr/sbin/ip6tables -A INPUT -m rt --rt-type 0 -j DROP

/usr/sbin/iptables -A INPUT -p icmp --icmp-type 3 -j ACCEPT
/usr/sbin/iptables -A INPUT -p icmp --icmp-type 4 -j ACCEPT
/usr/sbin/iptables -A INPUT -p icmp --icmp-type 11 -j ACCEPT
/usr/sbin/iptables -A INPUT -p icmp --icmp-type 12 -j ACCEPT
/usr/sbin/iptables -A INPUT -p icmp -j DROP

..
and before anyone asks, yes, IPv4 works perfect :)

Thanks

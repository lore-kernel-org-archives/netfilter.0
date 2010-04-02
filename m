From: John Lister <john.lister@kickstone.com>
Subject: Re: MARK not working
Date: Fri, 02 Apr 2010 08:24:26 +0100
Message-ID: <4BB59BAA.9080607@kickstone.com>
References: <4BB53BEC.9010709@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BB53BEC.9010709@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dennison Williams <dennison.williams@gmail.com>
Cc: netfilter@vger.kernel.org



Dennison Williams wrote:
> iptables -t mangle -A PREROUTING -i eth1 -p udp --dport 4500 -j MARK
> --set-mark 1
> iptables -t filter -A INPUT -m mark --mark 1 -j LOG --log-prefix ipsec_nat_t
> iptables -t filter -A INPUT -m mark --mark 1 -j ACCEPT
> iptables -t filter -A INPUT -j LOG
> iptables -t filter -A INPUT -j REJECT
>   
In general make sure that you are saving the marks to the conntrack 
tables  and restoring them with
-j CONNTRACK --save-mark
and
-j CONNTRACK --restore-mark

although in your sample this doesn't matter as you tag every incoming 
packet and as the other post notes, you seem to accept the connections 
before your logging.

I usually only set the mark when the state is NEW

John

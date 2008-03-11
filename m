From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Question relating to ESTABLISHED,RELATED rule.
Date: Tue, 11 Mar 2008 19:59:34 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0803111955220.18745@fbirervta.pbzchgretzou.qr>
References: <alpine.DEB.1.00.0803111442040.19106@p34.internal.lan>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.00.0803111442040.19106@p34.internal.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Justin Piszcz <jpiszcz@lucidpixels.com>
Cc: netfilter@vger.kernel.org


On Mar 11 2008 14:43, Justin Piszcz wrote:
>
> Question relating to ESTABLISHED,RELATED rule.
>
> Obviously at a minimum you need this for the INPUT chain.

... but only if your sieving rules would otherwise end in DROP :-)

> It also seems to help a bit with the FORWARDING chain as well.

A bit is an understatement:

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    4   304 ACCEPT     all  --  rtl0   *       0.0.0.0/0            0.0.0.0/0           
    4   304 ACCEPT     all  --  sis0   *       0.0.0.0/0            0.0.0.0/0
    ctstate RELATED,ESTABLISHED 
    0     0 REJECT     tcp  --  sis0   *       0.0.0.0/0            0.0.0.0/0
    reject-with tcp-reset 

, ok, just NTP traffic, but that is what I want, allow everything back in
that was started from the inside.

> Is it necessary for the OUTPUT chain?

If you would otherwise DROP it in OUTPUT... it always depends on the rules.

> This is the rule I am asking about, currently I do not use it and I generally
> do not see any problems but I am curious how come some people use this and
> others do not, what are the pros/cons each way?
>
> iptables -I OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Nuke all non-HTTP connections. Example.
iptables -P OUTPUT DROP
iptables -A OUTPUT -p tcp --dport 80,443 -m conntrack --ctstate NEW -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT

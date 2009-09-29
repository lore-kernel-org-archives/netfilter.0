From: Bill Hendrickson <wjhendrickson@gmail.com>
Subject: Re: SSH Port Forwarding with iptables
Date: Tue, 29 Sep 2009 12:14:15 -0400
Message-ID: <a0017e7e0909290914v7a4efac0u69f7cfdeaf7bb4e2@mail.gmail.com>
References: <a0017e7e0909290816i35c5e55dw77ec8517232ef276@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type;
        bh=i8GBJ0OkvVpzooI6C+RWLFojJgY3Dk5egkuW6mFduio=;
        b=rI6hm43Am4BhsDg2QlT9Wd4ICnf9VI/93ycpBjquuglAHIWyG9jYt+m9/QOaOjQfLq
         USDWqcrtpGJAbImsldInhnpi4ue3x1Cp2kKEQQGPPNWkAUVDOCqTXgrNyTVQH3KmHx9C
         2ScvVdJmEzk3aErseGlpLWE+gOX7fLCmV1Gvc=
In-Reply-To: <a0017e7e0909290816i35c5e55dw77ec8517232ef276@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter list <netfilter@vger.kernel.org>

okay, i simplified my script, and tried MASQUERADE vs FORWARD, and got
it to work:

iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -P OUTPUT ACCEPT
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 2022 -j DNAT
--to-destination 172.16.0.101:22
iptables -t nat -A POSTROUTING -j MASQUERADE

why does this way work?  what are the ramifications of using
masquerading, i.e., any reason i shouldn't adopt this method?
>
> #!/bin/bash
>
> modprobe iptable_nat
> echo 1 > /proc/sys/net/ipv4/ip_forward
>
> EXT_IFACE="eth0"
> EXT_IP="172.17.17.165"
> INT_IFACE="eth1"
>
> SSH_IP="172.16.0.101"
> SSH_PORT="2203"
>
> IPT="/sbin/iptables"
> $IPT -F
> $IPT -F -t nat
> $IPT -X
>
> $IPT -A OUTPUT -o $EXT_IFACE -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPT -A OUTPUT -o $INT_IFACE -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> # wide open, for testing...
> $IPT -t nat -P PREROUTING ACCEPT
> $IPT -t nat -P POSTROUTING ACCEPT
> $IPT -t nat -P OUTPUT ACCEPT
>
> $IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPT -A INPUT -i lo -j ACCEPT
>
> $IPT -t nat -A PREROUTING -p tcp -i $EXT_IFACE -d $EXT_IP --dport
> $SSH_PORT --sport 1024:65535 -j DNAT --to $SSH_HOST:22
> $IPT -A FORWARD -p tcp -i $EXT_IFACE -o $INT_IFACE -d $SSH_HOST
> --dport $SSH_PORT --sport 1024:65535 -m state --state NEW -j ACCEPT
>
> $IPT -A FORWARD -j LOG --log-prefix "meh "
>

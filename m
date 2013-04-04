From: Nick Edwards <nick.z.edwards@gmail.com>
Subject: Re: ipv6 rule icmp bug maybe
Date: Thu, 4 Apr 2013 17:13:48 +1000
Message-ID: <CAMD-=VJ7md+MEqtCcAdw9YgzuvoK_cPVy3KFcoPz8RwB_=52pQ@mail.gmail.com>
References: <CAMD-=VJU3PesmF7P4c0nQuk1Nw_XdoUf559h8tXfbEGXEv=2dQ@mail.gmail.com>
	<5293489.MPThhE2Fke@alaris>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type:content-transfer-encoding;
        bh=MXMrQglnYcfdLoO0KznR6mo85iHCkVPKx6hgoTEaXzU=;
        b=x021HK12D7cLtVrpi1M53JPc1EAySEZOHd/IuNDe86fAzG1MxYJgtqiQU5bx7LORE1
         /DPaJ/rlyMzM5vHLVm00Jrvhc/Edr+imeDsqVtZlzFVmLD+/CETd6D85fMbgLqOavPhT
         AUhZsmNLIGgbhZiPhCswJtE83PyCIggToGse1rzhsKH2b1d74cwRilnesTtDtRLYqA+7
         DJYNecr3UQSTWxlQzYA09hAP3PGx2ZNtC2i6cRPhawbGmBJXlsnNffsaTz+zrT0FKpR4
         Velcqf9kNo3n6WuTAAqnfP22GuljB6jXV5aqiJX00CH/tIPgunuPPGAslQyxwivOGW2O
         EoYg==
In-Reply-To: <5293489.MPThhE2Fke@alaris>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: mkubecek@suse.cz
Cc: netfilter@vger.kernel.org

On 4/4/13, Michal Kube=C4=8Dek <mkubecek@suse.cz> wrote:
>
>
> Hard to say unless you tell us what do your rules look like and what
> packets are dropped (and you think they shouldn't be).

ok, copy and paste with  only minor munging


#!/bin/sh
/usr/sbin/iptables -F
/usr/sbin/ip6tables -F

/usr/sbin/iptables -P INPUT DROP
/usr/sbin/ip6tables -P INPUT DROP

/usr/sbin/iptables -P OUTPUT ACCEPT
/usr/sbin/ip6tables -P OUTPUT ACCEPT

/usr/sbin/iptables -P FORWARD DROP
/usr/sbin/ip6tables -P FORWARD DROP

/usr/sbin/iptables -A INPUT -i lo -j ACCEPT
/usr/sbin/ip6tables -A INPUT -i lo -j ACCEPT
/usr/sbin/ip6tables -A INPUT -s fe80::/10 -j ACCEPT
/usr/sbin/ip6tables -A INPUT -d ff00::/8 -j ACCEPT

/usr/sbin/iptables -A INPUT -s 192.168.1.0/24 -j ACCEPT
/usr/sbin/iptables -A INPUT -s 178.x.x.x/24 -j ACCEPT
/usr/sbin/ip6tables -A INPUT -s 2001:c01d:c01d:beef::0/64 -j ACCEPT

/usr/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACC=
EPT
/usr/sbin/ip6tables -A INPUT -m state --state ESTABLISHED,RELATED -j AC=
CEPT


I can reach this machine from 178.x.x.x as normal. I can ssh in, and pi=
ng it

however, when I come from the ipv6 range, I can ssh in, but I can not p=
ing it.

There are no other conditions in play on this remote machine, what you
see is what is there
So I dont get why when  _range_ ACCEPT works for all protocols on
ipv4, but it doesnt with ipv6

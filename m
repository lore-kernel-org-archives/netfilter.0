From: Roland Haeder <r.haeder@web.de>
Subject: Re: Bastille/netfilter with Linux 2.6.28 blocks connections
Date: Wed, 07 Jan 2009 01:16:27 +0000
Message-ID: <4964026B.EE8212A9@web.de>
References: <669246551@web.de> <496529CF.1060208@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mart Frauenlob <mart.frauenlob@chello.at>
Cc: netfilter@vger.kernel.org

> -A FORWARD -s 192.168.1.0/24 -o eth0 -j ACCEPT
Applied. Well, don't shoot me. I setup eth0 as external device only in
/etc/Bastille/bastille-firewall.cfg, but it has to be eth0 and ppp0 ...

> advice 1: double check your data before posting.
> 
> advice 2: make yourself familiar with iptables.
Will follow them next time. :)

As a contribution to Bastille I left the script files and bogon.list on
my server, others are removed.

Thanks again both for your help, even when the mistake was here and not
in iptables nor Bastille.

But anyway. The InteractiveBastille tool is still not regonizing DB5.0
as OS type. I already filled a bug report out. Hope they will fix it.

Roland

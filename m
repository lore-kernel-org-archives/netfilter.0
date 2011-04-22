From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How can I get rules with all resolved IPs for FQDN?
Date: Fri, 22 Apr 2011 11:22:54 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104221122240.21484@obet.zrqbmnf.qr>
References: <ED3A8D81130D4C0CB0D9B98DA81D188F@brianlu> <alpine.LNX.2.01.1104211240100.5504@obet.zrqbmnf.qr> <BANLkTimY9isyFhAH_ESgfzxo8MWV4HDcoQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTimY9isyFhAH_ESgfzxo8MWV4HDcoQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lu Brian <lyt0112@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On Friday 2011-04-22 09:19, Lu Brian wrote:
>
>when i type the command :
>[root@localhost ~]# iptables -t nat -A POSTROUTING -s 192.168.3.0/24
>-d www.facebook.com -j SNAT --to-source 192.168.3.254
>
>I can only get 1 new rule for the domain www.facebook.com

And why is that a problem? facebook.com resolves to only one address.

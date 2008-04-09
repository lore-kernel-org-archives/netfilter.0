From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Iptables Rules
Date: Wed, 9 Apr 2008 06:12:16 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804090610310.2229@fbirervta.pbzchgretzou.qr>
References: <526636.41691.qm@web82601.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <526636.41691.qm@web82601.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Minh Cao <minhcao123@yahoo.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2008-04-09 00:01, Minh Cao wrote:
>Hi, 
>Is that matter if I placed the options/extensions ( -m
>and -p ) in different orders ? 

No, but it matters between multiple -m.

>-A INPUT -s 1.2.3.0/24 -p tcp -m tcp --dport 22 -j
>ACCEPT 
>-A INPUT -s 1.2.3.0/24 -m tcp -p tcp --dport 22 -j
>ACCEPT 

no

>-A INPUT -s 1.2.3.0/24 -p tcp -m state --state NEW -m
>tcp --dport 22 -j ACCEPT 
>
>
>-A INPUT -s 1.2.3.0/24 -m state --state NEW -m tcp -p
>tcp --dport 22 -j ACCEPT 

no.

(But "-m conntrack --ctstate NEW -m tcp" and 
     "-m tcp -m conntrack --ctstate NEW" would)

From: "Eljas Alakulppi" <Buzer@buzer.net>
Subject: Re: local NAT; reconfigured kernel, problems still
Date: Tue, 01 Apr 2008 00:14:51 +0300
Message-ID: <op.t8wfy1qartqp7s@hagumi.azt>
References: <20080331210609.019AF78C7A@gam.mel.teaser.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080331210609.019AF78C7A@gam.mel.teaser.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Noino <mg8c1zu02@sneakemail.com>, netfilter@vger.kernel.org

Hey.

1. Are you trying to redirect traffic directed to port 53 to port 10053?  
Use REDIRECT target.  
http://www.linuxtopia.org/Linux_Firewall_iptables/x4508.html
2. DNAT requires destination IP as well.

Noino <mg8c1zu02@sneakemail.com> kirjoitti Tue, 01 Apr 2008 00:06:08 +0300:

> Dear List, I recompiled my Linux 2.6.5 kernel, adding the option  
> required for local NAT . Am still encountering problems nonetheless. I  
> wonder whether I shouldn't compile the iptables program itself from  
> source, too. Else why do I get "invalid argument" here ? (same without  
> "-o lo") :
> ___________________________________________________________________________
> # iptables -t nat -A OUTPUT -o lo -p udp --dport 53 -j DNAT  
> --to-destination :10053
> iptables: Invalid argument
> #
> ____________________________________________________________________________



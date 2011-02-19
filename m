From: Thomas Wild <twild@gmx.de>
Subject: Re: Panic on 2.6.34+ and  bridged firewall
Date: Sat, 19 Feb 2011 23:27:13 +0000 (UTC)
Message-ID: <loom.20110220T002022-690@post.gmane.org>
References: <4D021E5A.1010807@univ-pau.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

>Anthony Hinsinger <anthony.hinsinger <at> univ-pau.fr> writes:
>
> 
> Hi.
> 
> I'm using netfilter/iptables on a Bridged Firewall, and i've a problem 
> with linux kernel >= 2.6.34.
> The kernel crash some seconds after i start the bridge interface and 
> load my rules.
> 

Hello,

I can absolutely confirm this problem. My system has the same behavior. The
previous kernel worked fine. But rejected crash the system a few seconds after
my iptables came up. I changed to DROP ... no it works out.

- Thomas






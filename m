From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: State Explanation
Date: Mon, 18 Jul 2011 10:36:54 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107181035440.19728@frira.zrqbmnf.qr>
References: <1310947299.8819.2152814541@webmail.messagingengine.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1310947299.8819.2152814541@webmail.messagingengine.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@buglecreek.com
Cc: netfilter@vger.kernel.org

On Monday 2011-07-18 02:01, netfilter@buglecreek.com wrote:

>In the course of troubleshooting a very simple iptables ruleset that is
>inexplicably dropping packets (more on that later) I came across a
>explanation in a Iptables Firewall book regarding the NEW state when
>using "-m state --state NEW" in a rule.

Use -m conntrack --ctstate NEW/etc.

>It states "NEW is equivalent to the initial TCP syn request, or to the 
>first UDP packet".  I have also seen in some resources that "-m state 
>--state NEW" will allow any packet through whether a syn bit is set or 
>not.

NFCT can also pick up connections, so NEW does not necessarily 
correspond to TCP SYN. (Cf. sysctl 
net.netfilter.nf_conntrack_tcp_be_liberal)

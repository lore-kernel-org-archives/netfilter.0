From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Unexpected (ct)state matching behaviour
Date: Tue, 7 Jun 2011 22:45:59 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106072243320.2450@frira.zrqbmnf.qr>
References: <20110607201448.GF7067@principal.rfc2324.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110607201448.GF7067@principal.rfc2324.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maximilian Wilhelm <max@rfc2324.org>
Cc: netfilter@vger.kernel.org

On Tuesday 2011-06-07 22:14, Maximilian Wilhelm wrote:

>The bridge-nf-hooks are disabled via sysctl:
>
>net.bridge.bridge-nf-call-arptables = 0
>net.bridge.bridge-nf-call-iptables = 0
>net.bridge.bridge-nf-call-ip6tables = 0

I suspect that is your problem. Disabling nf-call would seem to
not run the NF_IP6_PRI_CONNTRACK hook, and as such not track 
particular connections/packets delivered over a bridge.
(Thus, all those pkts are classified as INVALID.)

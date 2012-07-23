From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: [PATCH] iptables-restore: move code to add_param_to_argv, cleanup
 (fix gcc-4.7)
Date: Mon, 23 Jul 2012 14:19:11 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1207231418550.32073@frira.zrqbmnf.qr>
References: <1343039903-7230-1-git-send-email-pablo@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <1343039903-7230-1-git-send-email-pablo@netfilter.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pablo@netfilter.org
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

On Monday 2012-07-23 12:38, pablo@netfilter.org wrote:

>From: Pablo Neira Ayuso <pablo@netfilter.org>
>
>This patch seems to be a mere cleanup that moves the parameter parsing
>code to add_param_to_argv.
>
>But, in reality, it also fixes iptables whe compiled with gcc-4.7.

How does the problem manifest?

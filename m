From: "George Spelvin" <linux@horizon.com>
Subject: Re: v3.10-rc7 oops soon after boot
Date: 24 Jun 2013 04:47:27 -0400
Message-ID: <20130624084727.1494.qmail@science.horizon.com>
References: <20130624073340.GA26787@pd.tnic>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130624073340.GA26787@pd.tnic>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bp@alien8.de
Cc: kaber@trash.net, linux-kernel@vger.kernel.org, linux@horizon.com, netfilter@vger.kernel.org, pablo@netfilter.org

> This looks like ulog_timer in net/ipv4/netfilter/ipt_ULOG.c, judging by
> your config.

Ah, yes, it's a firewall/router machine with multiple interfaces.
Exploding based on packet arrivals could explain the variable timing
during init script processing.

Thank you!

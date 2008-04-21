From: Patrick McHardy <kaber@trash.net>
Subject: Re: [netfilter-core] [PATCH 5/6] NETFILTER: signed tcphoff for	ipv6_skip_exthdr()
 retval
Date: Mon, 21 Apr 2008 14:24:06 +0200
Message-ID: <480C8766.9010802@trash.net>
References: <480558CA.7090800@tiscali.nl> <48062282.4070204@tiscali.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <48062282.4070204@tiscali.nl>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Roel Kluin <12o3l@tiscali.nl>
Cc: Jan Engelhardt <jengelh@computergmbh.de>, coreteam@netfilter.org, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

Roel Kluin wrote:
> if tcphoff remains unsigned, a negative ipv6_skip_exthdr() return value will
> go unnoticed,

Applied, thanks.

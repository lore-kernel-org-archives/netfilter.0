From: Patrick McHardy <kaber@trash.net>
Subject: Re: Troubles with MARK target in 2.6.28
Date: Mon, 12 Jan 2009 08:08:20 +0100
Message-ID: <496AEC64.5040202@trash.net>
References: <86617ABF8F494F2A940C18251E3DC8D0@Hakkenden> <496AE0E3.1030009@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <496AE0E3.1030009@trash.net>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Nikolay S. Rybalov" <nowhere@hakkenden.ath.cx>
Cc: netfilter@vger.kernel.org, Netfilter Development Mailinglist <netfilter-devel@vger.kernel.org>, Jan Engelhardt <jengelh@medozas.de>

Patrick McHardy wrote:
> Does this patch fix it?
> 

Jan, display of NFPROTO_UNSPEC targets and matches in
/proc/net/ip_tables_targets etc. is also broken. Please
have a look at this.




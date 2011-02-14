From: Patrick McHardy <kaber@trash.net>
Subject: Re: [PATCH] [connlimit] Revert 44bd4de9
Date: Mon, 14 Feb 2011 16:58:19 +0100
Message-ID: <4D59511B.8040703@trash.net>
References: <4D594A8D.5040600@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <4D594A8D.5040600@linux.vnet.ibm.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org

Am 14.02.2011 16:30, schrieb Stefan Berger:
> I have to revert the early loop termination in connlimit since it
> generates problems when an iptables statement does not use -m state
> --state NEW before the connlimit match extension.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>

Your patch didn't apply. I did a manual revert and added your
changelog, thanks.

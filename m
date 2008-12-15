From: Patrick McHardy <kaber@trash.net>
Subject: Re: [netfilter-core] [PATCH] netfilter: remove padding from struct
 xt_match on 64bit	builds
Date: Mon, 15 Dec 2008 14:10:39 +0100
Message-ID: <4946574F.5080107@trash.net>
References: <1229089190.2921.7.camel@castor.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <1229089190.2921.7.camel@castor.localdomain>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Richard Kennedy <richard@rsk.demon.co.uk>
Cc: coreteam@netfilter.org, netfilter@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Netfilter Development Mailinglist <netfilter-devel@vger.kernel.org>

Richard Kennedy wrote:
> reorder struct xt_match to remove 8 bytes of padding and make its size
> 128 bytes.
> 
> This saves a small amount of data space in each of the xt netfilter
> modules and fits xt_match in one 128 byte cache line.

Applied, thanks.

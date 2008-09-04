From: Patrick McHardy <kaber@trash.net>
Subject: Re: 802.11: Managed- and AdHoc-mode at the same time
Date: Thu, 04 Sep 2008 13:15:13 +0200
Message-ID: <48BFC341.7060803@trash.net>
References: <200809041235.38752.volker@openbios.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200809041235.38752.volker@openbios.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Volker Poplawski <volker@openbios.org>
Cc: netfilter@vger.kernel.org

Volker Poplawski wrote:
> Hi all,
> this is probably the wrong list to ask, but anyway
> 
> Is it possible to run a wireless interface in both managed and adhoc mode at 
> the same time?
> 
> I.e. be connected to a access-point and at same time to one or more hosts in 
> adhoc mode.
> 
> (is it technical possible at all?? Does linux support it?)

I think its possible to add virtual interfaces and have them
configured to different modes using iw [1], but I'm not sure.
Someone on linux-wireless@vger.kernel.org can probably tell
you more.

[1] http://git.sipsolutions.net/iw.git

From: Vladislav Kurz <vladislav.kurz@webstep.net>
Subject: Re: 802.11: Managed- and AdHoc-mode at the same time
Date: Thu, 4 Sep 2008 13:21:03 +0200
Message-ID: <200809041321.03307.vladislav.kurz@webstep.net>
References: <200809041235.38752.volker@openbios.org> <48BFC341.7060803@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48BFC341.7060803@trash.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thursday 04 of September 2008, Patrick McHardy wrote:
> Volker Poplawski wrote:
> > Hi all,
> > this is probably the wrong list to ask, but anyway
> >
> > Is it possible to run a wireless interface in both managed and adhoc mode
> > at the same time?
> >
> > I.e. be connected to a access-point and at same time to one or more hosts
> > in adhoc mode.
> >
> > (is it technical possible at all?? Does linux support it?)
>
> I think its possible to add virtual interfaces and have them
> configured to different modes using iw [1], but I'm not sure.
> Someone on linux-wireless@vger.kernel.org can probably tell
> you more.
>
> [1] http://git.sipsolutions.net/iw.git

It depends on wireless driver. IIRC madwifi (atheros chipset) can do that, but 
I'm not so sure about others. Ask your wifi driver developers and users.

-- 
Regards
        Vladislav Kurz

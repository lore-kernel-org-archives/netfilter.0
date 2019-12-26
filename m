From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: Weird/High CPU usage caused by LOG target
Date: Fri, 27 Dec 2019 09:29:23 +1100
Message-ID: <20191226222923.GA32765@dimstar.local.net>
References: <CAGnHSEkvf0zieVJtPyneZ6PfnzeANmfFxTb=0JpgVb1FXVk0-w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGnHSEkvf0zieVJtPyneZ6PfnzeANmfFxTb=0JpgVb1FXVk0-w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Yan <tom.ty89@gmail.com>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

On Thu, Dec 26, 2019 at 11:05:33AM +0800, Tom Yan wrote:
> Hi all,
>
> So I was trying to log all traffics in the FORWARD chain with the LOG
> target in iptables (while I say all, it's just some VPN server/client
> that is used by only me, and the tests were just opening some
> website).
>
> I notice that the logging causes high CPU usage (so it goes up only
> when there are traffics). In (h)top, the usage shows up as openvpn's
> if the forwarding involves their tuns. Say I am forwarding from one
> tun to another, each of the openvpn instance will max out one core on
> my raspberry pi 3 b+. (And that actually slows the whole system down,
> like ssh/bash responsiveness, and stalls the traffic flow.) If I do
> not log, or log with the NFLOG target instead, their CPU usage will be
> less than 1%.
>
> Interestingly, the problem seems to be way less obvious if I am using
> it on higher end devices (like my Haswell PC, or even a raspberry pi
> 4). There are still "spikes" as well, but it won't make me "notice"
> the problem, at least not when I am just doing some trivial web
> browsing.
>
> Let me know how I can further help debugging, if any of you are
> interested in fixing this.
>
> Regards,
> Tom
>
Hi Tom,

Just in case you missed it, be sure that your logger is configured not to sync
the file system after every logging. That is the default action btw.

I have used large-volume logging in the past and never encountered a CPU problem
(but had to run logrotate every minute to avoid filling the disk).

Cheers ... Duncan.

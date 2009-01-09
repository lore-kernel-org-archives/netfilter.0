From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: (Ab)using iptables to record byte count per IP?
Date: Fri, 09 Jan 2009 13:35:37 +0100
Message-ID: <49674499.30705@netfilter.org>
References: <2d460de70901090327y625afd60g792467e843d3f1d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2d460de70901090327y625afd60g792467e843d3f1d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Richard Hartmann <richih.mailinglist@gmail.com>
Cc: netfilter@vger.kernel.org

Richard Hartmann wrote:
> Hi all,
> 
> I need to log the traffic each local IP in a NAT'ed network generates
> per day.
> 
> Unfortunately, the environment is rather restricted and compiling new
> software is not an option. Thus, I am wondering if I can abuse iptables,
> which is in use anyway, to log for me, as well.
> 
> The end result should be a log which contains IP, date and traffic
> generated. I don't really care about the output format as I will perl it
> into the format I need, anyway.

Polling iptables does not look to me a good option. The way to go should 
be ulogd2 or or the conntrackd in its simple statistics mode.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers

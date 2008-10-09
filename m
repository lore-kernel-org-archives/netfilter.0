From: Brent Clark <brentgclarklist@gmail.com>
Subject: Re: Different kind transparent proxy
Date: Thu, 09 Oct 2008 13:04:46 +0200
Message-ID: <48EDE54E.9030404@gmail.com>
References: <48EDE496.8000900@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48EDE496.8000900@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 'Mail List - Netfilter' <netfilter@vger.kernel.org>

Brent Clark wrote:
> Hi
>
> I have a basic home setup, the router / gate and the proxy server sit 
> on different machines (Dont want squid on the FW).
>
> I have a client that I want to access the web, but via squid.
>
Sorry I forgot to mention, if I set my proxy on the web broswer to that 
of the proxy, I can view sites.

So from the proxy's point of view, alls good.

Seems to be the traffic going eth1 and then back out eth1 to squid (and 
or vice versa).

Brent

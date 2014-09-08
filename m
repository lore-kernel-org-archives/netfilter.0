From: Brad Campbell <lists2009@fnarfbargle.com>
Subject: Re: How to stop kernel TCP responses on a port
Date: Mon, 08 Sep 2014 11:11:11 +0800
Message-ID: <540D1E4F.4000704@fnarfbargle.com>
References: <1409843867.3026.9.camel@l3> <54089069.8010603@solutti.com.br>	 <1409891253.15027.24.camel@l3> <CBD8736BE6044AE0B06076D69855AF85@gmail.com> <1409895712.16431.7.camel@l3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1409895712.16431.7.camel@l3>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dale Mellor <dale@rdmp.org>, Payam Chychi <pchychi@gmail.com>
Cc: Leonardo Rodrigues <leolistas@solutti.com.br>, netfilter@vger.kernel.org

On 05/09/14 13:41, Dale Mellor wrote:
>

> Anyway, the point is I don't want the syn-ack to come from the ground,
> but the Linux kernel insists on sending it.  That's what I want to
> filter out, or otherwise stop.


The kernel only does that if there is a piece of application code that 
is bound to that socket.

> In case I haven't been clear, the PC is the gateway to the spacecraft;
> effectively, it _is_ the proxy.  When a telnet client (on the ground)
> connects to the gateway (on the ground), the gateway is responding to
> the SYN when I don't want it to.

Ok, so the ground station PC is acting as a proxy and you don't want 
that. You want it to *route* the IP packets rather than be an 
application level proxy.

So at the moment you are connecting to a socket that is bound in the 
ground station PC. There is a piece of code there than binds and then 
accepts the connection. Stop doing that and have iptables forward/nat 
the packets instead.

If all that is incorrect, then you have not provided anywhere enough 
information on the how's and why's.



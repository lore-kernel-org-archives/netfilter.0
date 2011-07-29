From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Re: ebtables to copy traffic
Date: Fri, 29 Jul 2011 10:00:48 -0700
Message-ID: <20110729100048.7b72be47@nehalam.ftrdhcpuser.net>
References: <CACsKbv0r4PcDp0zKV53n=oAOYkvkPbOCtN8LE=L2zQPcUyasew@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CACsKbv0r4PcDp0zKV53n=oAOYkvkPbOCtN8LE=L2zQPcUyasew@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg Oliver <oliver.greg2@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, 29 Jul 2011 09:08:31 -0500
Greg Oliver <oliver.greg2@gmail.com> wrote:

> So, I am pretty new to all of this, but we use port mirroring from
> ethernet switches to record voip calls in our business.  We usually have
> no issues due to using a physical port on the servers, but we are
> migrating to a virtual model.
> 
> I am planning on using ebtables to copy all traffic on the mirror port
> from the switch to a list of receiving MACs on the network, but I cannto
> for the life of me get it right I guess.
> 
> I am trying to use dnat.

It is easier to do this with TC filters and TC action mirred


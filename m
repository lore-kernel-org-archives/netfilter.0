From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Disabling conntrack on an interface
Date: Thu, 02 Jul 2009 17:26:34 +0200
Message-ID: <1246548394.17132.19.camel@enterprise.ims-firmen.de>
References: <2d1f9a6b0907020810x49f483a9j855d373b776571c6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2d1f9a6b0907020810x49f483a9j855d373b776571c6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Terry Burton <tez@terryburton.co.uk>
Cc: netfilter@vger.kernel.org

On Thu, 2009-07-02 at 16:10 +0100, Terry Burton wrote:
> Hi,
> 
> Is it possible to disable connection tracking for a specific interface/bridge?

Check out:

   NOTRACK
       This target disables connection tracking for all packets matching
that rule.

       It can only be used in the
              raw table.

> The particular scenario is that I have a secondary interface that
> collecting the traffic from a SPAN/mirror port on a busy router. This
> interface is enslaved into a bridge along with the virtual interfaces
> of a some analyser virtual machines, using setageing=0 so that the
> frames are forwarded to all VMs.
> 
> I would rather not have the traffic that originates from the capture
> interface hitting the connection tracking code, if possible.

Understandable, but does that actually happen for you? 

I do not get any conntrack entries from mirrored ports when
I am port mirroring packets onto a Linux interface that is up
but has no configured addresses.

As long as these packets are not addressed to your machine the netfilter
code never gets to see them, AFAIK.

   Thomas


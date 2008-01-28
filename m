From: Sean Loaring <sloaring@tec-man.com>
Subject: Routing by port
Date: Mon, 28 Jan 2008 06:34:40 -0700
Message-ID: <20080128133439.GA29891@tec-man.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I have a network with two gateways.  I also have a web client program
running on a server that slows down the default gateway quite a bit.  I
would like to be able to have all outgoing connections to port 80 from
the machine go out via the second gateway.

I found that if I had a linux machine running as a router then I can
mark packets using iptables and then route based on the marks.  I can't
seem to find how to do this for a single host.  Marking seems to be only
possible after outgoing routing has already taken place.

I did find the ROUTE target in several iptables man pages.  But after
looking around it seems that it has gone the way of the dodo (except in
man pages).

Is ROUTE dead or am I just unable to find it?  Or is there a better
alternative?

Thanks,

Sean

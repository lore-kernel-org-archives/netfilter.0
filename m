From: Thomas Jacob <jacob@internet24.de>
Subject: Re: still can't route using fwmark
Date: Mon, 20 Apr 2009 21:26:01 +0200
Message-ID: <20090420192600.GB1158@internet24.de>
References: <20090418082314.GA12566@internet24.de> <op.usld3aqfx1lyi3@localhost> <20090418184809.GA15649@internet24.de> <op.uslkl80px1lyi3@localhost> <20090418205802.GA16790@internet24.de> <op.uslqwresx1lyi3@localhost> <20090419090016.GA19987@internet24.de> <op.usn740lix1lyi3@localhost> <1240225752.27336.25.camel@enterprise.ims-firmen.de> <op.usoy1zlxx1lyi3@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <op.usoy1zlxx1lyi3@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

On Mon, Apr 20, 2009 at 09:38:13AM -0600, Lloyd Standish wrote:
> Thomas, somehow I had the erroneous idea that ALL packets, even those originating at the local machine, go through PREROUTING.  I finally understand now why I need the OUTPUT statements.  As soon as I added those, the load balancing started to work!

Great

> # restore the fwmark on packets that belong to an existing connection
> # this prerouting stuff would only be for connections initiated on the LAN
> 
> iptables -A PREROUTING -i eth0  -t mangle -m state --state ESTABLISHED,RELATED -j RESTOREMARK

This is too restrictive, drop the -i eth0, your forwarded packets from the internet
will not arrive thru eth0 but still need a CONNMARK -> MARK restore.

> iptables -A PREROUTING -i eth0 -t mangle -m mark ! --mark 0 -j RETURN
> iptables -A PREROUTING -t mangle -j CONNMARK1
> iptables -A PREROUTING -t mangle -m statistic --mode nth --every 2 --packet 0 -j CONNMARK2

Otherwise you might assign a different mark again here, and that doesn't work
with NATed connections. Possibly you should also use -m state --state NEW to prevent
the marking stuff taking place on any other packets than the initial ones.

> Once this is working for LAN I want to try load balancing according the byte count of each interface, if that is possible.

Hmm, I don't see how to do this with out using some kind of script
that constantly checks the load of your links and then modifies iptables
rules accordingly. Don't forget that you are loadbalancing connections, not
individual packets. But maybe you can cook something up the recent match or
something, if you do, please keep the list posted ;)

   Thomas

From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: still can't route using fwmark
Date: Sat, 18 Apr 2009 17:14:59 -0600
Message-ID: <op.usluusgxx1lyi3@localhost>
References: <op.uskfabufx1lyi3@localhost>
 <20090418082314.GA12566@internet24.de> <op.usld3aqfx1lyi3@localhost>
 <20090418184809.GA15649@internet24.de> <op.uslkl80px1lyi3@localhost>
 <20090418205802.GA16790@internet24.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090418205802.GA16790@internet24.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sat, 18 Apr 2009 14:58:02 -0600, Thomas Jacob <jacob@internet24.de> wrote:

> Are you forwarding packets via this box, or do you want to loadbalance
> packets from the local machine? In the latter case the PREROUTING
> stuff needs to go into INPUT/OUTPUT.

Thomas, I would like this to load balance all traffic going out of the local machine (which is gateway for the home LAN), including locally-generated packets.  I was under the impression that PREROUTING happens before everything else and affects all packets, both locally-generated ones and forwarded ones.  My conntrack tables show that locally-generated packets are getting the fwmark.   Could you explain why PREROUTING isn't the right place for the marking rules?


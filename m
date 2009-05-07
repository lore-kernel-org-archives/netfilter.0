From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Select chain from set?
Date: Thu, 07 May 2009 16:57:20 +0200
Message-ID: <1241708240.12279.28.camel@enterprise.ims-firmen.de>
References: <33be4bb30904280221x9156f26t43ddfff0f083925f@mail.gmail.com>
	 <1240921645.14474.141.camel@hsa.vpn.anti>
	 <1240925694.4256.32.camel@casper.meteor.dp.ua>
	 <1240933140.12894.366.camel@chichi>
	 <1240992704.4235.1.camel@casper.meteor.dp.ua>
	 <1241106752.2778.91.camel@chichi>
	 <1241690844.5166.3.camel@casper.meteor.dp.ua>
	 <1241703893.2778.297.camel@chichi>
	 <1241704875.12279.13.camel@enterprise.ims-firmen.de>
	 <1241706663.2778.302.camel@chichi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1241706663.2778.302.camel@chichi>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: shinrich@ieee.org
Cc: casper@meteor.dp.ua, Martin Millnert <millnert@csbnet.se>, Oskar Berggren <oskar.berggren@gmail.com>, netfilter@vger.kernel.org

On Thu, 2009-05-07 at 09:31 -0500, Susan Hinrichs wrote:
> > Nftables will let you do that in the future
> > 
> > http://lwn.net/Articles/324251/
> > 
> 
> Great! Looking forward to it.  The dictionaries look great.  I'll have
> to start playing with the first version on a test machine.  Do you know
> what kind of MAC address support there is?  Similar to the source mac
> support in iptables?

Sorry, can't help you there. It's probably best to ask concrete question
about the planned features of nftables on netfilter-devel list, AFAIK
it's still under heavy development. But as far as I understand the
dictionary concept, mac address matching should become available at
one point. 

" Sets (as everything else) operate on generic
data and thus can be used for any kind of match."

Until nftables becomes stable enough for production I myself am sticking
with the chain tree approach (and ipset for simple IP match sets)


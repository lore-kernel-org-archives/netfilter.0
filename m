From: Whit Blauvelt <whit@transpect.com>
Subject: Could Cogent be doing packet mangling that would confuse Netfilter
 about interfaces?
Date: Mon, 15 Aug 2011 13:13:53 -0400
Message-ID: <20110815171353.GA15638@black.transpect.com>
References: <20110723003617.GA17279@black.transpect.com>
 <20110725000139.GA10041@black.transpect.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110725000139.GA10041@black.transpect.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

This is related to a couple of messages I sent to the list 3 weeks ago, with
some additional information. The basic problem is that Netfilter is seeing
some traffic lately as coming in on the wrong interface, which we notice
when that traffic gets blocked or gets by when it shouldn't, since some of
our rules specify interfaces.

We're now seeing the same behavior from both iptables 1.4.8 on Debian
Squeeze and 1.3.8 on Ubuntu 8.04 (on totally different hardware). The common
factor is that this is all traffic coming in via our Cogent pipe. When
traffic comes in via either of our two other Speakeasy/Megapath pipes
Netfilter sees all the interface specifications correctly.

This makes me wonder if Cogent has started doing some sort of packet
mangling that's not compatible with how Netfilter looks at packet headers to
determine which interface the packets have shown up from. Could something
like that be the case? Or what else could account for this? 

It does look like Cogent is on the list of providers who have been mucking
with stuff they shouldn't -
http://www.newscientist.com/article/dn20768-us-internet-providers-hijacking-users-search-queries.html

We can work around whatever the problem here is by specifying rules by IP
block rather than interface. Still, it's troubling that there can apparently
be some characteristic of incoming traffic that can get Netfilter confused
about the interface it's arrived on. There have to be evil uses for that.

Best,
Whit

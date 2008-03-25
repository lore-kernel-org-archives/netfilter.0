From: Casper Gripenberg <casper.gripenberg@kotiportti.fi>
Subject: Re: REJECT wih tcp-reset not working (very weird problem)
Date: Tue, 25 Mar 2008 23:38:08 +0200
Message-ID: <47E970C0.2020307@kotiportti.fi>
References: <47E7FAEE.8090002@kotiportti.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47E7FAEE.8090002@kotiportti.fi>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Casper Gripenberg wrote:
 >
 > Hi..I have a very simple bridging firewall setup:
 >
 >                                BRIDGE
 > computer1 <-internet-> [eth1 <-> br0 <-> eth0] <-> computer2
 >
 > [..snip..]

I think there's a bug in either the bridging or netfilter
code. I just found a workaround which seem to indicate
that the way the firewall is currently working is incorrect.

The workaround is to use ebtables to rewrite the MAC source
of the RST packet to the correct source.

I.e. I rewrite it from the bridge address to the address
of computer2 -> the test case suddenly starts working.

Here's the workaround:

ebtables -t nat -A POSTROUTING -o eth1 -p ipv4 --ip-proto tcp \
          --ip-sport 5555 -j snat --to-src 00:0d:56:af:17:47

That of course will break a lot of other stuff, but
it just proves that repairing the MAC is what makes
the RST reply work properly.

This bug seems to have been around for quite a while,
as there was someone else back in 2004 who stumbled on
the same problem:

http://www.archivum.info/netfilter/2004-08/msg00614.html

Casper



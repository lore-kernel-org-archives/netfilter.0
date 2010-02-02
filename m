From: Amos Jeffries <squid3@treenet.co.nz>
Subject: RE: IPV6 and Pre/post routing
Date: Wed, 03 Feb 2010 11:52:17 +1300
Message-ID: <daef896248117c3ad21a515f595273af@mail.treenet.co.nz>
References: <034DEBCAE934A74991E6E76B8DA72D141884A1929E@HSSBS.holdstead.local> <4B687862.7010204@plouf.fr.eu.org> <034DEBCAE934A74991E6E76B8DA72D141884A192A0@HSSBS.holdstead.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <034DEBCAE934A74991E6E76B8DA72D141884A192A0@HSSBS.holdstead.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gary Smith <gary.smith@holdstead.com>
Cc: netfilter@vger.kernel.org

On Tue, 2 Feb 2010 12:35:43 -0800, Gary Smith <gary.smith@holdstead.com>
wrote:
>> > What I'm wondering, after reading some old documentation on iptables,
>> > if this is possible with IPV6.
>> 
>> Netfilter has no support for IPv6 NAT, and hopefully never will.
>> Can't the DNS records for mail just point directly to the addresses of
>> the mail servers ?
> 
> If there is no support for NAT in IPV6, then we will need to do
something
> like that.  The problem is getting clients to update their settings with
as
> little intrusion (from us) as possible.  We inherited some of the
> configuration which has many of the client using a single hostname name
for
> most services.  So when we needed to migrated to a split platform (where
> hosted www, imap, and smtp) are all on different servers NAT was the
easy
> part.
> 
> But it's good to know what the limitations are (since this is just the
> information gathering stage) so we can start implementing a plan to get
> parts of the network onto IPV6.
> 

Ouch. It's a bit late in the game to be starting the info gathering. I
hope the network is not large.

There is a side benefit to the absence of service names. You can combine
the two migrations so the new names can start with IPv6-enabled and old
legacy systems that can't be converted yet use the old NAT names. This way
you can avoid the whole annoyance of migrating to intermediary ipv6.foo
names during initial production testing then migrating a second time back
to the normal names.

AYJ


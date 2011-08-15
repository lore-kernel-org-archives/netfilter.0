From: Tom Eastep <teastep@shorewall.net>
Subject: Re: Could Cogent be doing packet mangling that would confuse Netfilter about interfaces?
Date: Mon, 15 Aug 2011 10:52:35 -0700
Message-ID: <097A5326-A354-436E-9932-91D3A912494A@shorewall.net>
References: <20110723003617.GA17279@black.transpect.com> <20110725000139.GA10041@black.transpect.com> <20110815171353.GA15638@black.transpect.com>
Mime-Version: 1.0 (Apple Message framework v1244.3)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110815171353.GA15638@black.transpect.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Whit Blauvelt <whit@transpect.com>
Cc: netfilter@vger.kernel.org


On Aug 15, 2011, at 10:13 AM, Whit Blauvelt wrote:

> This is related to a couple of messages I sent to the list 3 weeks ago, with
> some additional information. The basic problem is that Netfilter is seeing
> some traffic lately as coming in on the wrong interface, which we notice
> when that traffic gets blocked or gets by when it shouldn't, since some of
> our rules specify interfaces.
> 
> We're now seeing the same behavior from both iptables 1.4.8 on Debian
> Squeeze and 1.3.8 on Ubuntu 8.04 (on totally different hardware). The common
> factor is that this is all traffic coming in via our Cogent pipe. When
> traffic comes in via either of our two other Speakeasy/Megapath pipes
> Netfilter sees all the interface specifications correctly.


This behavior is usually a sign that your Cogent external firewall interface and and your internal firewall interface have accidentally become part of the same broadcast domain. I would look for mis-cabling and for erroneous VLAN configuration.

-Tom

Tom Eastep        \ When I die, I want to go like my Grandfather who
Shoreline,         \ died peacefully in his sleep. Not screaming like
Washington, USA     \ all of the passengers in his car
http://shorewall.net \________________________________________________



From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Why does ipv6 enabled interfere with ipv4 SNAT?
Date: Tue, 25 Mar 2008 03:57:49 +0100 (CET)
Message-ID: <alpine.LNX.1.10.0803250354390.9368@fbirervta.pbzchgretzou.qr>
References: <20080325012807.GA15637@transpect.com> <alpine.LNX.1.10.0803250254100.9368@fbirervta.pbzchgretzou.qr> <20080325024424.GA16089@transpect.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080325024424.GA16089@transpect.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Whit Blauvelt <whit@transpect.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2008-03-25 03:44, Whit Blauvelt wrote:
>
> Not sure what you're thinking there. My problem wasn't with there being too
> many devices, but with two of the devices I actually have not being
> represented - and with Netfilter not doing _ipv4_ SNAT on account of
> something with _ipv6_.

How does it break? Do the counters increase in the nat table at all?
Do the chain and/or rule counters increase if you add the same rule
without action? (I.e.:

 	-t nat -A POSTROUTING -o eth4 -m whatever
 	-t nat -A POSTROUTING -o eth4 -m whatever -j SNAT --to xyz

>> It still works with opensuse plus 2.6.23. Well, I suggest you
>> try a stock kernel.
>
> It is a stock kernel, if by that you mean a stock distro kernel -
> Ubuntu's latest, 2.6.22-14-server.

Stock vanilla kernel.org kernel.



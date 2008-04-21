From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: C code rule modifying
Date: Tue, 22 Apr 2008 00:42:18 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804220041330.13697@fbirervta.pbzchgretzou.qr>
References: <5078d3df0804211505u2ab2c584o9e27fdae1a3fdb82@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5078d3df0804211505u2ab2c584o9e27fdae1a3fdb82@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Charles Romestant <cromestant@gmail.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2008-04-22 00:05, Charles Romestant wrote:

>Hello, anyone happen to have some C sample code to modify existing
>ruleset, can t seem to get it to work with
>popen ( get segfault) even running as root.

Uh, if you get a segfault with a simple popen, there's likely
a bug in your code. (Suggestion to post the offending lines.)

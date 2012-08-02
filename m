From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: tproxy between 2 local processes ?
Date: Thu, 2 Aug 2012 22:32:08 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1208022231250.31335@frira.zrqbmnf.qr>
References: <1343744245.78982.YahooMailNeo@web124904.mail.ne1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1343744245.78982.YahooMailNeo@web124904.mail.ne1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ming-Ching Tiew <mctiew@yahoo.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tuesday 2012-07-31 16:17, Ming-Ching Tiew wrote:

>Is there any hope that tproxy between 2 local processes will become possible ?

The recipe should be the same as for incoming traffic, since in both 
incoming and locally-outgoing cases, traffic will pass through the 
routing table, where you specify that a target is in fact local.

From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: invoking nat POSTROUTING *after* bridging decision
Date: Wed, 26 Jan 2011 21:00:37 +0100
Message-ID: <4D407D65.9090902@freemail.hu>
References: <4D4071E8.2010908@cs.ucsb.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D4071E8.2010908@cs.ucsb.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ludovico Cavedon <cavedon@cs.ucsb.edu>, netfilter list <netfilter@vger.kernel.org>

Hi,

> Is there any way to postpone the call to POSTROUTING after the bridging
> decision has been been, or have the POSTROUTING chain called twice?
I don't think it is possible...
But could you please explain us why do you want such NATing?
Maybe we can help you out with an other setup...

Swifty

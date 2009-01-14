From: =?UTF-8?B?QXJ0xatyYXMgxaBsYWp1cw==?= <x11@arturaz.net>
Subject: Re: Counting Connections
Date: Wed, 14 Jan 2009 10:49:08 +0200
Message-ID: <496DA704.80302@arturaz.net>
References: <5E1140B1-A4E2-4D7B-937F-7CD1DA0966D0@dancing.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5E1140B1-A4E2-4D7B-937F-7CD1DA0966D0@dancing.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter Renzland <peter@dancing.org>
Cc: netfilter@vger.kernel.org

Peter Renzland wrote:
> I would also like to count connections (those that have been tracked), 
> just like the packets and bytes that have been moved.
> Can someone please show me how that can be done?
New connections? -m state --state NEW should work.

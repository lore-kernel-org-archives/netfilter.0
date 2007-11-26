From: Martijn Lievaart <m@rtij.nl>
Subject: Re: CONNMARK udp comprehension question
Date: Mon, 26 Nov 2007 22:02:40 +0100
Message-ID: <474B3470.5030809@rtij.nl>
References: <474B2C65.1060706@endian.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <474B2C65.1060706@endian.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Peter Warasin <peter@endian.com>
Cc: netfilter@vger.kernel.org

Peter Warasin wrote:
>
> Now, the question:
> I mark all connections entering a specific uplink with a number using
> CONNMARK, in order to be able to distinguish them and make them leave
> the correct interface using fwmark based ip rules.
>   

You have to restore the mark in your ruleset. Also, UDP has quite a 
short timeout, so the new packet may not belong to the connection anymore,

HTH,
M4


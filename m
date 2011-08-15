From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Could Cogent be doing packet mangling that would confuse Netfilter
 about interfaces?
Date: Mon, 15 Aug 2011 16:54:05 -0500
Message-ID: <4E49957D.9070607@riverviewtech.net>
References: <20110723003617.GA17279@black.transpect.com> <20110725000139.GA10041@black.transpect.com> <20110815171353.GA15638@black.transpect.com> <097A5326-A354-436E-9932-91D3A912494A@shorewall.net> <20110815203335.GB27440@black.transpect.com> <1313442633.20254.7.camel@sami.shorewall.net> <20110815212553.GA32552@black.transpect.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110815212553.GA32552@black.transpect.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/15/11 16:25, Whit Blauvelt wrote:
> Meanwhile, if anyone else here has a suggestion, the working assumption is
> that we don't have an example of the "Fool's Firewall" (as it is very
> clearly explained on Tom's page) so other suggestions will also be
> appreciated.

For giggles have you tried looking for the mac addresses on eth1 and 
eth2 (from your first message)?

Does the traffic coming in to eth5 have the proper MAC address of your 
Cogent router?

Have you considered sniffing the traffic with another device before the 
traffic enters eth5 to make sure that the traffic really is on the wire 
like you think it is verses some odd bug that is causing the traffic to 
be mis-represented by the kernel?

Start gathering duplicate data from other locations in the network to 
see what adds up and checksums each other and what does not.  Follow the 
evidence.

It sounds like it's time to gather more data before you start filtering 
it down.



Grant. . . .

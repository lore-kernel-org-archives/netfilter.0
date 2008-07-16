From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NAT rule
Date: Wed, 16 Jul 2008 12:26:21 -0500
Message-ID: <487E2F3D.7000808@riverviewtech.net>
References: <487E1DF3.1090203@hoecoop.org> <487E2D4C.5000506@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <487E2D4C.5000506@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/16/08 12:18, Taylor, Grant wrote:
> In short, add a new IP to two pieces of equipment, set up the VPN, and 
> add a single route statement to the target server and you are done.

This is what you have now.

+---------+   +--------+           +--------+       +--------+
| Support +---+ Router +===(VPN)===+ Router +---+---+ Server |
+---------+   +--------+           +--------+   L   +--------+
                                                 A
                                                 N   +-------+
                                                 +---+ Other |
                                                     +-------+


This is what I'm proposing.

                                    +--------+       +--------+
+---------+   +--------+           | Router +-<>-<>-+ Server |
| Support +---+ Router +===(VPN)===+        +---+---+        |
+---------+   +--------+           +--------+   L   +--------+
                                                 A
                                                 N   +-------+
                                                 +---+ Other |
                                                     +-------+

In this case the VPN comes in and goes directly to the small network 
that is the router and server, leaving the rest of your LAN alone.



Grant. . . .

From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: IPv6 Connection Tracking Excess CPU usage
Date: Fri, 29 Jul 2011 14:08:57 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107291407490.8013@frira.zrqbmnf.qr>
References: <9A0A4A86-B4FE-4BF1-BCA0-204D7975320D@aol.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9A0A4A86-B4FE-4BF1-BCA0-204D7975320D@aol.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jobhunts02@aol.com
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Friday 2011-07-29 02:07, jobhunts02@aol.com wrote:

>I am running Linux 2.6.26 on my board.  When I enable IPv6 connection 
>tracking support, i.e., CONFIG_NF_CONNTRACK_IPV6=y, and send 3 megabits 
>of data to the board, the CPU usage according to top for events/0 goes 
>up to 99-100%.  Without CONFIG_NF_CONNTRACK_IPV6 enabled, the CPU usage 
>for events/0 is 17-18%.

Sounds like a very weak board.

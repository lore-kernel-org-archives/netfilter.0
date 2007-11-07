From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables NAT logging
Date: Tue, 06 Nov 2007 20:29:19 -0600
Message-ID: <473122FF.9000800@riverviewtech.net>
References: <472AE429.1060906@bristol.ac.uk> <472B3B63.7000203@riverviewtech.net> <4730989C.4020301@bristol.ac.uk> <4730AD7C.6090302@riverviewtech.net> <47310CA5.5080901@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47310CA5.5080901@snapgear.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/6/2007 6:53 PM, Philip Craig wrote:
> No kernel coding needed, it already generates netlink events.  You 
> just need to listen for this event in userspace and log it from 
> there.

Ok, it must have been a very long day.  How and where would you listen 
to said netlink events?  Or are you referring to some sort of daemon 
that would behave like a user space filtering application via netlink?



Grant. . . .

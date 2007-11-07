From: Philip Craig <philipc@snapgear.com>
Subject: Re: iptables NAT logging
Date: Wed, 07 Nov 2007 13:01:45 +1000
Message-ID: <47312A99.3070208@snapgear.com>
References: <472AE429.1060906@bristol.ac.uk> <472B3B63.7000203@riverviewtech.net> <4730989C.4020301@bristol.ac.uk> <4730AD7C.6090302@riverviewtech.net> <47310CA5.5080901@snapgear.com> <473122FF.9000800@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <473122FF.9000800@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Grant Taylor wrote:
> Ok, it must have been a very long day.  How and where would you listen 
> to said netlink events?  Or are you referring to some sort of daemon 
> that would behave like a user space filtering application via netlink?

ulogd2 has support for listening to the events, although I haven't tested it
recently.  Look for the flow logging options.

You could also use the 'conntrack' tool to monitor them, and pipe that
to a log file.

This is purely about connection tracking, not filtering, so you can't match
up these events with the filter rule that accepted it, unless you encode that
in the mark or something.  It will only get events for connections that are
accepted by filtering though.


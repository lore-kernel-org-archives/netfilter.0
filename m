From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables NAT logging
Date: Tue, 06 Nov 2007 21:06:32 -0600
Message-ID: <47312BB8.5040200@riverviewtech.net>
References: <472AE429.1060906@bristol.ac.uk> <472B3B63.7000203@riverviewtech.net> <4730989C.4020301@bristol.ac.uk> <4730AD7C.6090302@riverviewtech.net> <47310CA5.5080901@snapgear.com> <473122FF.9000800@riverviewtech.net> <47312A99.3070208@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47312A99.3070208@snapgear.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/6/2007 9:01 PM, Philip Craig wrote:
> ulogd2 has support for listening to the events, although I haven't 
> tested it recently.  Look for the flow logging options.
> 
> You could also use the 'conntrack' tool to monitor them, and pipe 
> that to a log file.

Interesting.

> This is purely about connection tracking, not filtering, so you can't 
> match up these events with the filter rule that accepted it, unless 
> you encode that in the mark or something.  It will only get events 
> for connections that are accepted by filtering though.

Unless I mis-understand the OP's desires, I don't think the shortcoming 
(if it qualifies as that) of not being able to associate a NetLink event 
with a given IPTables rule is all that big of a deal.  I think the OP 
just needed to log internal and external source and destination IP 
addresses and ports and when the connection started and stopped, thus 
knowing which IPTables rule is (IMHO) a non issue.  I guess depending on 
what someone was trying to do this could be an issue.



Grant. . . .

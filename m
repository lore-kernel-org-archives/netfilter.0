From: Philip Craig <philipc@snapgear.com>
Subject: Re: iptables NAT logging
Date: Wed, 07 Nov 2007 10:53:57 +1000
Message-ID: <47310CA5.5080901@snapgear.com>
References: <472AE429.1060906@bristol.ac.uk> <472B3B63.7000203@riverviewtech.net> <4730989C.4020301@bristol.ac.uk> <4730AD7C.6090302@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4730AD7C.6090302@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Grant Taylor wrote:
> I suppose you could augment the connection tracking code to log when it 
> expired a tracked connection.  You could at least get the end of a 
> connection this way.  However this is probably kernel coding.

No kernel coding needed, it already generates netlink events.
You just need to listen for this event in userspace and log it
from there.


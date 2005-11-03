From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: libipq: How to get PIDs for packets
Date: Thu, 3 Nov 2005 22:43:45 +0100 (CET)
Message-ID: <Pine.LNX.4.61.0511032238070.14703@filer.marasystems.com>
References: <19264.1130948238@www61.gmx.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <19264.1130948238@www61.gmx.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Peter.Muller@gmx.at
Cc: Netfilter Users <netfilter@lists.netfilter.org>

On Wed, 2 Nov 2005 Peter.Muller@gmx.at wrote:

> I'm using libipq to filter packets in userspace. Is there a way provided by
> the API of libipq to get the PID of the process the packet is going to or
> coming from?

No.

Isn't even an API within the kernel to tell this.. There is no mapping 
between packet and process within the kernel, the two concepts are too far 
apart. On locally generated packets you can get down to which socket the 
packet was sent on, but that is about it.

Once upon a time there was the "owners" match in iptables capable of 
matching on pid or even application name, but this capability has been 
removed from there as it was not really working. Only worked on 
Uni-processor boxes (no SMP) and only in very restricted conditions even 
then..

Regards
Henrik


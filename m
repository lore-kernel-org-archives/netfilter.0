From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Aditional information in ICMP reject packages ?
Date: Thu, 3 Nov 2005 22:49:01 +0100 (CET)
Message-ID: <Pine.LNX.4.61.0511032244190.14703@filer.marasystems.com>
References: <20051102215837.4365.qmail@web50503.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051102215837.4365.qmail@web50503.mail.yahoo.com>
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
To: Tudor Alexandru Dragos <soogard@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Wed, 2 Nov 2005, Tudor Alexandru Dragos wrote:

> There is any way to specify the aditional
> informations in the ICMP reject package.(patch or
> somthing ?) For example i whant to reject a package
> with ICMP type 5 , Redirect message and i whant to set
> the Router flag (the new gateway).

Not that I know of. Should not be very hard to add however..

On another note ICMP type 5 is not an error, merely a notification. The 
packet is not supposed to be dropped in these conditions.

Why do you want to generate this ICMP Redirect using iptables? What is 
wrong with simply letting the routing code generate the notification as 
usual?

> BTW: Anybody know is windows is working according with
> the RFC and is realy " revise its routing table " ?

Probably, but it may require a registry setting...  (same for most Linux 
boxes.. support is there but most often disabled by default for security 
reasons).

Regards
Henrik


From: Kev askme <linuxtoybox@yahoo.com>
Subject: Re: networking newbie needs help
Date: Sat, 22 Jan 2005 20:50:34 -0800 (PST)
Message-ID: <20050123045034.74270.qmail@web90109.mail.scd.yahoo.com>
References: <1106453553.5171.3.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106453553.5171.3.camel@jasiiitosh.nexusmgmt.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>


--- "John A. Sullivan III"
<jsullivan@opensourcedevelopmentcorp.com> wrote:

> <snip>
> Welcome to netfilter, Kevin.  It's a great tool. 

Thank you very much John. :) Yes it appears to be very
useful and robust!

> Another great tool is
> iproute2 and that will be your key to what you want
> to do.  It will
> allow you to bind multiple IP addresses to the same
> NIC.  The rest is
> handled by DNAT.  No need to add a physical
> interface for each NAT
> address.

So how do I tell my ISP that the extra IP's they are
going to allocate to me all need to point to the same
NIC? Will they be able to do that? I mean, isn't there
only one unique MAC address for every NIC card? Do
they just route all frames destined for any one of the
IP addresses they assign me to the same MAC or
something?
Thanks for your help and for the great welcome!

> In the ISCS network security management interface,
> we do this
> automatically for you when you specify that a device
> is to be exposed
> publicly.  You can find some training slides
> regarding iproute2 in the
> training section of the ISCS web site
> (http://iscs.sourceforge.net).
> You can find the full explanation in a file named
> ip-cref.ps somewhere
> in your distribution.

I'll have to check out ISCS and see what it's all
about. Thanks for your help, John.

Sincerely,
Kevin



		
__________________________________ 
Do you Yahoo!? 
Read only the mail you want - Yahoo! Mail SpamGuard. 
http://promotions.yahoo.com/new_mail 


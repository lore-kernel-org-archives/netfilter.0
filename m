From: Kev askme <linuxtoybox@yahoo.com>
Subject: Re: networking newbie needs help
Date: Sat, 22 Jan 2005 22:05:56 -0800 (PST)
Message-ID: <20050123060556.35467.qmail@web90102.mail.scd.yahoo.com>
References: <1106458277.5171.12.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106458277.5171.12.camel@jasiiitosh.nexusmgmt.com>
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

> It's all about ARP.  You may want to find a good web
> site on network
> basics so that you can better understand the context
> within which
> iptables works.  If you can afford them, I have
> always found Pine
> Mountains classes to be absolutely outstanding
> (http://www.pmg.com).

Perhaps I will look into that for the future. I'll
pick up a good O'Reilley book on networking for the
time being.

> Let's say that your public network is 1.1.1.0/24,
> your ISP router is
> 1.1.1.1 and your firewall is 1.1.1.2 and it is doing
> NAT for 1.1.1.3 and
> 1.1.1.4.  When the ISP's router wants to send a
> packet to 1.1.1.3, it
> sends an ARP broadcast on the local segment to ask
> who has 1.1.1.3.
> Your firewall will respond with an ARP reply that
> says its MAC address
> handles packets for 1.1.1.3.  The router will make
> that entry in its ARP
> cache and will now address all packets for 1.1.1.3
> to your firewall
> NIC's MAC address.

Thanks for the "dummified" explanation. That is very
clear and concise. :) So I just need my ISP to
statically assign the public IP addresses to me and
then add the addresses to my external interface using
the ip command and then the external interface will
answer for all ip addresses on the external interface?
Or do I need to add aliases for each address, or is
that essentially what the ip command is actually
doing?



		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - now with 250MB free storage. Learn more.
http://info.mail.yahoo.com/mail_250


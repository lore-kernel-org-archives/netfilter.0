From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: networking newbie needs help
Date: Sun, 23 Jan 2005 00:31:16 -0500
Message-ID: <1106458277.5171.12.camel@jasiiitosh.nexusmgmt.com>
References: <20050123045034.74270.qmail@web90109.mail.scd.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050123045034.74270.qmail@web90109.mail.scd.yahoo.com>
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
To: Kev askme <linuxtoybox@yahoo.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Sat, 2005-01-22 at 20:50 -0800, Kev askme wrote:
> --- "John A. Sullivan III"
> <jsullivan@opensourcedevelopmentcorp.com> wrote:
> 
<snip>
> So how do I tell my ISP that the extra IP's they are
> going to allocate to me all need to point to the same
> NIC? Will they be able to do that? I mean, isn't there
> only one unique MAC address for every NIC card? Do
> they just route all frames destined for any one of the
> IP addresses they assign me to the same MAC or
> something?
It's all about ARP.  You may want to find a good web site on network
basics so that you can better understand the context within which
iptables works.  If you can afford them, I have always found Pine
Mountains classes to be absolutely outstanding (http://www.pmg.com).

Let's say that your public network is 1.1.1.0/24, your ISP router is
1.1.1.1 and your firewall is 1.1.1.2 and it is doing NAT for 1.1.1.3 and
1.1.1.4.  When the ISP's router wants to send a packet to 1.1.1.3, it
sends an ARP broadcast on the local segment to ask who has 1.1.1.3.
Your firewall will respond with an ARP reply that says its MAC address
handles packets for 1.1.1.3.  The router will make that entry in its ARP
cache and will now address all packets for 1.1.1.3 to your firewall
NIC's MAC address.
> Thanks for your help and for the great welcome!
> 
> > In the ISCS network security management interface,
> > we do this
> > automatically for you when you specify that a device
> > is to be exposed
> > publicly.  You can find some training slides
> > regarding iproute2 in the
> > training section of the ISCS web site
> > (http://iscs.sourceforge.net).
> > You can find the full explanation in a file named
> > ip-cref.ps somewhere
> > in your distribution.
> 
> I'll have to check out ISCS and see what it's all
> about. Thanks for your help, John.
> 
> Sincerely,
> Kevin
> 
> 
> 
> 		
> __________________________________ 
> Do you Yahoo!? 
> Read only the mail you want - Yahoo! Mail SpamGuard. 
> http://promotions.yahoo.com/new_mail 
> 
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com



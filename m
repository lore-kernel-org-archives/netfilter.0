From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: networking newbie needs help
Date: Sat, 22 Jan 2005 23:12:33 -0500
Message-ID: <1106453553.5171.3.camel@jasiiitosh.nexusmgmt.com>
References: <20050123035846.4807.qmail@web90105.mail.scd.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050123035846.4807.qmail@web90105.mail.scd.yahoo.com>
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

On Sat, 2005-01-22 at 19:58 -0800, Kev askme wrote:
> Hi everyone! :)
> 
> I have a couple of questions regarding netfilter on
> linux and general networking that I'm unsure about.
> Let me describe my current setup and where I'm trying
> to go with it.
>         First and foremost, I have a current netfilter
> firewall set up using the firewall script from
> frozentux.org with a DMZ. Everything works fine. I can
> DNAT public IP's to private addresses inside my DMZ,
> and hosts on my internal LAN can all browse the net
> just fine and do all that other fun stuff. This setup
> currently has one NIC card for each zone off of my
> firewall with eth0 connected directly to the cable
> modem, eth1 is to my internal LAN on one switch and
> eth2 is connected to a different switch in which I put
> hosts on the DMZ. My question is this: currently I
> just have the one public IP address and that seems
> simple enough, but I have a need for expansion and I
> require more addresses from my ISP. Do I need to
> install more NIC cards on my firewall box, one for
> each new IP address and plug the cable modem into the
> switch, along with all the newly installed NIC cards
> instead of directly into my firewall box? Is there a
> way around doing that if possible? What is the best
> way to set it up properly so that I can have multiple
> IP addresses on my DMZ and account traffic for each IP
> and service? Also what is the best way to do this with
> minimal overhead (getting new hardware is not a big
> deal for me as long as it's not too expensive). Any
> help or suggestions please?
> 
<snip>
Welcome to netfilter, Kevin.  It's a great tool.  Another great tool is
iproute2 and that will be your key to what you want to do.  It will
allow you to bind multiple IP addresses to the same NIC.  The rest is
handled by DNAT.  No need to add a physical interface for each NAT
address.

In the ISCS network security management interface, we do this
automatically for you when you specify that a device is to be exposed
publicly.  You can find some training slides regarding iproute2 in the
training section of the ISCS web site (http://iscs.sourceforge.net).
You can find the full explanation in a file named ip-cref.ps somewhere
in your distribution.

Good luck - John
> 
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com



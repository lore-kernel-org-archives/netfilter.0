From: Marc Cluet <lynxman@lynxman.net>
Subject: Re: Using heartbeat for fall over on IPTables Firewall
Date: Mon, 17 Mar 2003 18:35:29 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0303171828130.1830-100000@omoikane>
References: <3019863CF306D211BA4500A0CC30812DC67927@exchange.cyberwolf.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3019863CF306D211BA4500A0CC30812DC67927@exchange.cyberwolf.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chip Upsal <cupsal@cyberwolf.com>
Cc: netfilter@lists.netfilter.org, "'linux-ha@muc.de'" <linux-ha@muc.de>

On Mon, 17 Mar 2003, Chip Upsal wrote:

> I am looking to use heartbeat to provide fall over for my iptables firewall.
> I am looking for those with experience using these tools together. 
> 
> I plan to use RH7.2 on the firewalls.
> 
> I made some attempts at implementing such a solution but i ran into a few
> problems. 
> 
> I would like suggestions on setup of the heartbeat configuration files.
> Pointers on the iptables startup script. and advice on what kernel version
> to use and if any patches need to be applied.
> 
> Thanks in advance,
> 
> Chip
> 

Right now I have this solution in production stage, using iptables + heartbeat + ldirectord using NAT.
If you don't need backend balancing and only need high availability on the firewalls then you can skip out NAT and ldirectord :)

What I have is a custom made iptables script that is based on input/output ethernets and also on concrete destination IPs, once you have those rules loaded you can shift your firewall from one firewall box to another without even restarting iptables.

What you really need to be aware of is ARP tables on your network since that can make your transition fail, read arping man page for fast arp transition or the solutions suggested at the Linux-ha FAQ.

If you need more details about my installation just let me know.

Good luck


---

Marc Cluet                      | lynxman@lynxman.net
http://www.lynxman.net          | lynxman@cistelecom.net
--------------------------------------------------------




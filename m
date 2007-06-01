From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Enabling internal connections to transparently connect via
 external IP address
Date: Fri, 01 Jun 2007 11:00:59 +0200
Message-ID: <465FE04B.9060000@rtij.nl>
References: <BBC99700C9F0FA49A9C6E005863D603107A19C1920@MULTAN.castellan.net>
	<465F63BA.3060101@rlworkman.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <465F63BA.3060101@rlworkman.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robby Workman <netfilter@rlworkman.net>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>, Chris Willis <chris@castellan.net>

Robby Workman wrote:
> Chris Willis wrote:
>   
>> Environment:
>> Windows XP laptop machine, part of domain acme.int, IP 192.168.1.150
>> Windows 2003 Server running Exchange 2003 (exchange.acme.int, 192.168.1.10)
>> External Domain: acme.com (T1 line, firewall external IP & MX record mail.acme.com 60.60.60.60)
>> Firewall: PC running Fedora Core 6, IPTables, using FWBuilder to create a ruleset, 2 NICs (eth0 192.168.1.1, eth1 60.60.60.60)
>>
>> Problem: when a laptop user (works in office and remotely) goes to https://mail.acme.com, it works fine from the outside, but not from the inside.
>>
>> Goal: when an internal (192.168.1.X) client goes to https://mail.acme.com, the firewall should accept the packets, route them to the exchange box, and then route return packets back to the client.
>>
>> This works just fine on a netscreen firewall I tested with at the client site (same IP addresses as  linux box above).
>>     
>
>
> There's the "dirty" way (IMHO):
> http://iptables-tutorial.frozentux.net/chunkyhtml/x4033.html
>
> There's the cleaner way (IMHO):
> Have your DNS server setup to serve internal clients the internal
> address of mail.acme.com.
>   

Or even cleaner, set up the Exchange server in a DMZ (you still have to 
do the split-dns unless you get multiple IPAs).

M4



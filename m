From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: ICMP Connections ...
Date: Tue, 24 Aug 2004 16:24:41 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <412BB219.7050201@pbl.ca>
References: <20040824133610.80037.qmail@web14926.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040824133610.80037.qmail@web14926.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Chetan Nagaraja wrote:
> To ping a host in a different network, I have configured a dual homed[ 
> two network interfaces] linux system to act as NAT router.

[snip]

> But I'am unable to understand the fact that the ICMP replies are 
> reaching the host in NETWORK A which had generated the requests, without 
> adding a DNAT rule for the same.
> How is this possible, does iptables automatically redirect ICMP replies ?
> And How to avoid the same.

Yes, you specify that you want to do SNAT or DNAT in one direction, and 
Netfilter will handle returning packets (and only returning packets!) 
correctly.

BTW, what would be the purpuse of preventing this???  If the returned 
packet wasn't handled automatically, neither the firewall nor the host 
in network A would be able to handle it.  Firewall wouldn't be able to 
handle it since original ping request hasn't originated from it.  Host 
in network A (if packet managed to miraculasly reach it despite of 
incorrect destination IP address) wouldn't be able to handle it (other 
than forwarding it back to the firewall, if kernel configuration 
permits) since reply would have destination IP address of the firewall 
in the headers.  So really no point in avoiding this behaviour.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7


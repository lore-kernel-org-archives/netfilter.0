From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Passed chains from local process to local ip
Date: Mon, 26 Jul 2004 07:20:21 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090840821.23643.13.camel@localhost>
References: <23413.1090823248@www51.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <23413.1090823248@www51.gmx.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: andilist@gmx.de
Cc: netfilter@lists.netfilter.org

On Mon, 2004-07-26 at 02:27, andilist@gmx.de wrote:
> Hello,
> which chains are passed from packets, generated from a local process with a
> local ip as destination(not 127.0.0.1, but ip-address of a local network
> interface).
> 
> Is it OUTPUT -> POSTROUTING -> PREROUTING -> INPUT, or is it directly?
> 
> my network interface has 5 ip-adresses. If have 2 daemons (say A and B)
> running on 2 different local ip-Addresses (ip-A and IP-B) on the same port.
> It's not possible to run a deamon on 2 or more addresses. so i need to
> forward ip-c, ip-d and ip-e to ip-a.
> 
> ip-a -> A
> ip-b -> B
> ip-c -> ip->a -> A
> ip-d -> ip->a -> A
> ip-e -> ip->a -> A
> 
> it works allready from packets from remote hosts (with dnat and prerouting),
> but not from local packets. to use dnat for local packets in the output
> chain i read that i must update the kernel and install a new version of
> iptables. but i am not sure, if this will work, because the packets are for
> a local ip-address and not for a remote destination.
> 
> Thanks for your help,
> Andreas
I am not absolutely certain but one could find out by adding log rules
at the entrance to each chain and seeing which are traversed by your
packets - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 



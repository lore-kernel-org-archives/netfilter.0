From: Amit Pasari <info@amitpasari.com>
Subject: Re: public ip on LAN
Date: Fri, 02 Jan 2004 23:10:31 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6.0.0.22.0.20040102230219.0308d300@amitpasari.com>
References: <6.0.0.22.0.20040102214805.030494d0@orangeinfoways.com>
 <200401021623.08821.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401021623.08821.Antony@Soft-Solutions.co.uk>
References: <6.0.0.22.0.20040102214805.030494d0@orangeinfoways.com>
 <200401021623.08821.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Dear Antony,

1. Do your clients *really* need public IPs on the machines themselves, or is
it sufficient if you use NAT and ensure that packets to some public IP reach
a specific client, and packets from that client have the public IP when they
return to the Internet?   What protocols / services are you using which
require public IPs on the client machines?
 >>
Well my clients wants to use Voip / Webserver and other VPN applications .
So they need public ip .

2. We can't answer your question in any detail without more information about
the topology of your network, in particular whether your ISP provides a small
subnet to you, terminated at your netfilter machine, or whether that subnet
block can be routed across the netfilter machine so that thLet me explain
on My LAN i have ip address - 172.16.1.1
subnet - 255.255.0.0
on My WAN i have ipaddress - 203.122.51.178
subnet - 255.255.255.240

Yes i have read many  things , but didn't find the solution.

Regards
Amit




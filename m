From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: public ip on LAN
Date: Fri, 02 Jan 2004 12:31:24 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073064684.2995.37.camel@jasiiitosh.nexusmgmt.com>
References: <6.0.0.22.0.20040102214805.030494d0@orangeinfoways.com>
	 <200401021623.08821.Antony@Soft-Solutions.co.uk>
	 <6.0.0.22.0.20040102230219.0308d300@amitpasari.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6.0.0.22.0.20040102230219.0308d300@amitpasari.com>
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
To: Amit Pasari <info@amitpasari.com>
Cc: netfilter@lists.netfilter.org

Are these users running VoIP and others through a VPN tunnel and the
problem is using NAT on an IPSec tunnel or are they using VoIP AND an
IPSec VPN tunnel and each presents a problem.  If it is just using NAT
and an IPSec VPN, investigate using NAT Traversal.  Otherwise, if you
cannot find an application proxy or an iptables helper for every
application they want to use, you may be stuck with DNAT and SNAT for
those users - John

On Fri, 2004-01-02 at 12:40, Amit Pasari wrote:
> Dear Antony,
> 
> 1. Do your clients *really* need public IPs on the machines themselves, or is
> it sufficient if you use NAT and ensure that packets to some public IP reach
> a specific client, and packets from that client have the public IP when they
> return to the Internet?   What protocols / services are you using which
> require public IPs on the client machines?
>  >>
> Well my clients wants to use Voip / Webserver and other VPN applications .
> So they need public ip .
> 
> 2. We can't answer your question in any detail without more information about
> the topology of your network, in particular whether your ISP provides a small
> subnet to you, terminated at your netfilter machine, or whether that subnet
> block can be routed across the netfilter machine so that thLet me explain
> on My LAN i have ip address - 172.16.1.1
> subnet - 255.255.0.0
> on My WAN i have ipaddress - 203.122.51.178
> subnet - 255.255.255.240
> 
> Yes i have read many  things , but didn't find the solution.
> 
> Regards
> Amit
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com



From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: NAT -  HELP
Date: Thu, 06 May 2004 08:34:38 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083846878.2101.17.camel@localhost>
References: <1177332812.20040505164432@hotbox.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1177332812.20040505164432@hotbox.ru>
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
To: "Slava (hotbox)" <chvv@hotbox.ru>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-05-05 at 08:44, Slava (hotbox) wrote:
> 
> NETFILTER --> NAT --> HOWTO
> 
> 
> I very badly speak English!
> 
> 
> We use VPN-connections (PPTP) through firewall. It uses two connections: 1723/tcp and 47/ip(GRE). 
> 
> When I  give a range of IP addresses to SNAT, two PPTP connections (1723/tcp & GRE) leave
> from Firewall (SNAT) with different IP-addresses.
> And VPN-connection does not work!
> 
> 
> Help, if can, please.
> 
> Viacheslav.
> 
>  
I do not use PPTP so I am having trouble understanding your problem.  Is
the problem that you do not want 1723.tcp and 47/ip to SNAT at all or
that they are doing SNAT to the wrong address?

If you do not want the PPTP connection to SNAT at all, place an ACCEPT
rule in front of the SNAT rule, e.g., 

iptables -t nat -I POSTROUTING 1 -o eth0 -s x.x.x.x -p 6 --sport 1723 -j
ACCEPT
iptables -t nat -I POSTROUTING 1 -o eth0 -s x.x.x.x -p 47 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source y.y.y.y

If it is NATting the wrong public address, make sure the PPTP rules are processed first.
Hope this helps - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com



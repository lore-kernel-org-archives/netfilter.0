From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Iptables rule for multiple Ip addresses.
Date: Tue, 15 Jun 2004 07:00:10 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087297209.3491.4.camel@localhost>
References: <20040615053549.29391.qmail@web60408.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040615053549.29391.qmail@web60408.mail.yahoo.com>
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
To: ads nat <adsnat@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2004-06-15 at 01:35, ads nat wrote:
> Hi,
> I am using Redhat Linux 9.0 with Iptables iptables
> v1.2.7a.
> I am trying to apply this rule for diverting trafic. 
> "eth1" is LAN interface for subnet 192.168.0.0/24
> ##########
> [root@xxx root]# iptables -t nat -A PREROUTING -s
> 192.168.0.2-192.168.0.10 -i eth0 -p tcp -j DNAT --to
> 10.0.0.2:80
> iptables v1.2.7a: host/network
> `192.168.0.2-192.168.0.10' not found
> Try `iptables -h' or 'iptables --help' for more
> information.
> ##########
> 
> It seems it does not accept multipal source addresses.
> I sther any other wat do achieve this.
> Thanks for support.
<snip>
You can either apply the iprange patch from patch-o-matic or, if you do
not want to or cannot patch, break it into several rules using subnets. 
I've used SubnetCreator (http://subnetcreator.sourceforge.net) to help
calculate subnets from ranges, e.g., 
192.168.0.2/31
192.168.0.4/30
192.168.0.8/31
192.168.0.10/32
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



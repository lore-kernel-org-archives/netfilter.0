From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: question about -t nat
Date: Sat, 19 Jun 2004 13:18:48 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087665527.7106.15.camel@localhost>
References: <000501c4561d$0495e830$6900a8c0@W2K>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000501c4561d$0495e830$6900a8c0@W2K>
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
To: Postmaster <iptables-pmd0052@promind.de>
Cc: netfilter@lists.netfilter.org

On Sat, 2004-06-19 at 12:46, Postmaster wrote:
> hello list-users,
> 
> i want clean up my pre- and postrouting chains with rules like this:
> 
> iptables -t nat -A PREROUTING -i eth0 -j first_group
> iptables -t nat -A PREROUTING -i eth1 -j second_group
> 
> iptables -t nat first_group -s a.b.c.d -d x/y -p tcp --sport
> 1024:65535 --dport 10001 -j DNAT --to-destination 1.2.3.4:25
> iptables -t nat second_group -s a.b.c.d -d x/y -p tcp --sport
> 1024:65535 --dport 10002 -j DNAT --to-destination 4.5.6.7:25
> 
> is there any modul which makes this possible?
<snip>
I'm not sure I see the problem other than adding an action to the user
defined chain rules such as -A or -I - John
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



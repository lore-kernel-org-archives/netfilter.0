From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: RE: Destination Nat
Date: Fri, 04 Jun 2004 12:14:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086365674.15366.49.camel@localhost>
References: <40c09902.2c9.1bbe.570207397@arbbs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40c09902.2c9.1bbe.570207397@arbbs.net>
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
To: black@arbbs.net
Cc: netfilter@lists.netfilter.org

On Fri, 2004-06-04 at 11:45, black@arbbs.net wrote:
> the rule set:
> iptables -t nat -A PREROUTING -d 5.6.7.8 -p 6 --dport 80 -j
> DNAT --to 192.168.x.x:80 worked perfectly
> 
> thank you
> 
> but i have a new question.  i'm trying to setup so the users
> can access the machines through ssh.  
> 
> here is the rule set:
> iptables -t nat -A PREROUTING -d 5.6.7.8 -p tcp --dport 22
> -j DNAT --to 192.168.1.88:22
> 
> the problem is when i ssh in to machine8 which is on static
> ipaddress 192.168.1.88 i actully log into machine1 which is
> 192.168.1.81, which is the first machine in the rule set. 
> where did i go wrong?
> 
> thanks
> john 
What are the other rules?
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



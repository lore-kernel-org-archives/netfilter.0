From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: allow range syntax - perplexed
Date: Tue, 15 Jun 2004 13:58:56 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087322336.2054.12.camel@localhost>
References: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108>
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
To: Jonathan Villa <jvilla@e37.net>
Cc: netfilter@lists.netfilter.org

On Tue, 2004-06-15 at 13:00, Jonathan Villa wrote:
> To my understanding the following will allow any address in the x.x.x.0
> block access
> 
> $IPTABLES -A INPUT -p tcp --dport 22 -s xxx.xxx.xx.0/24  -j ACCEPT
> $IPTABLES -A INPUT -p tcp --dport 3306 -s xxx.xxx.xx.0/24  -j ACCEPT
> $IPTABLES -A INPUT -p tcp --dport 80 -s xxx.xxx.xx.0/24 -j ACCEPT
> 
> It of course is not working...
> 
> my temporary solution : looping through 1-254
> 
> not very nice when I need to show someone the current rules.
> 
> -confused
I'm not doing exactly what you are doing but I do use full subnets for
both source and destination and it works fine for me.  What do you see
that makes you believe it is not working? - John
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



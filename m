From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Destination Nat
Date: Fri, 28 May 2004 10:18:39 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1085753919.14362.12.camel@localhost>
References: <40b742bf.c1.3d5a.1536727437@arbbs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40b742bf.c1.3d5a.1536727437@arbbs.net>
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

On Fri, 2004-05-28 at 09:46, black@arbbs.net wrote:
> Im running at red hat 9 and iptables 1.2.7
> 
> im trying to direct web traffic to the web server on the
> inside.  
> is [ iptables -t nat -A PREROUTING -p tcp --dport 80 -i eth0
>  -j DNAT --to 5.6.7.8:8080 ] right?
> 
> thanks
> john
That will direct all 80 /tcp packets for all addresses the station
listens on to 5.6.7.8:8080? Is that what you want or do you want to
redirect packets with a specific destination address?
If the public Internet address is not an IP address bound to the NAT
gateway, then you will need to add it, typically:
ip address add 1.1.1.2/24 dev eth0 brd +
Finally, NAT is not access control.  Once the packeted hits the filter
chain, you will need something, default policy or, preferable a rule,
which allows access to 5.6.7.8 on TCP port 8080.  Hope that helps - John
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



From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: iptables -- routing
Date: Mon, 15 Dec 2003 12:19:39 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071508779.1885.3.camel@jasiiitosh.nexusmgmt.com>
References: <000e01c3bfc5$c0f8cfe0$b84526c0@thor>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000e01c3bfc5$c0f8cfe0$b84526c0@thor>
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
To: Hlynur Thor Olason <thorolason@web.de>
Cc: netfilter@lists.netfilter.org

On Thu, 2003-12-11 at 04:04, Hlynur Thor Olason wrote:
> I have 2 Ethernet cards in a box.
> 
>  
> 
> Call them eth0 with IP address 192.168.0.1    and
> 
> eth1 with IP = 192.168..0.2
> 
>  
> 
> eth1= 192.168.0.2 is connected to another computer a gateway which has
> the IP address 192.168.0.3. This computer is then connected to an
> external network which is again connected to eth0=192.168.0.1 in the
> first box. 
> 
>  
> 
> Now the problem is I want to get locally generated packages in the box
> destined for 192.168.0.2 (eth1 in the box) to leave the box and be
> routed trough the network to the box again. 
> 
>  
> 
> I have been trying to use iptables but not found a solution. 
> 
>  
> 
> Any suggestion would be welcome?  / Thor 

I'm not entirely sure of what you are asking but I think you will find
the solution using iproute2.  In my distribution (RedHat 9.0), the
documentation is in /usr/share/doc/iproute-2.4.7/ip-cref.ps.  There is
also a slide show tutorial in the training section on
http://iscs.sourceforge.net
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



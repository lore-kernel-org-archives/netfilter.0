From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: MRTG and IPTABLES
Date: Wed, 07 Jan 2004 03:03:42 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073462622.18988.20.camel@jasiiitosh.nexusmgmt.com>
References: <83055D4B014C9E478D2F04624B9E82CFD4D5@noveldc.novelgmt.mu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <83055D4B014C9E478D2F04624B9E82CFD4D5@noveldc.novelgmt.mu>
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
To: Gilles Yue <gyue@novelgmt.intnet.mu>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-01-07 at 01:54, Gilles Yue wrote:
> MRTG cannot work properly due to iptables running.
> 
>  
> 
> Anybody knows which port number to open to enable MRTG to work
> properly.
> 
>  
<snip>

No, not off hand but you can use a tool like Ethereal
(http://www.ethereal.com) or just tcpdump or even just log the ropped
packets in iptables to determine what MRTG is trying to do.  Good luck -
John
> 
>  
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



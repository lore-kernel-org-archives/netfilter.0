From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: NetBios iptables trouble with small TCP packets
Date: Fri, 02 Jan 2004 23:02:42 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073102562.8996.11.camel@jasiiitosh.nexusmgmt.com>
References: <BAY1-F21Thriq1KIvQi00024cab@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY1-F21Thriq1KIvQi00024cab@hotmail.com>
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
To: sp3 sp3 <sp3@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Fri, 2004-01-02 at 21:53, sp3 sp3 wrote:
> I,
> 
> I have two networks connected with a linux firewall/router that is running 
> RH8 and a firewall script.
> I'm having a problem with the transfer of small files (<256kb) using NetBios 
> over TCP/IP between a NT4 machine and a win2k machine.
> The fw is doing source nat.
> The problem is that when i transfer a small file, the win2k machine seams to 
> hang for a moment ( 10 seconds ) and displays an error.
> I have searched the MS site for the error and i have found that it's related 
> to a time out.
> 
> I have searched the logs, and nothing unusual is reported.
> I have checked the firewall logs also, and no drop packet is found ( i log 
> all "can't happened" rules ).
> 
> I have tried many things, like:
> - checking the MTU of the interfaces
> - cheching the mss value using ifconfig
> - each NIC uses a separate IRQ
> 
> The problem is on the fw/router machine 'im shure. I know it, because a have 
> tried to put the same machines on the same LAN and there is no problem.
> 
> Does any one have any sugestion for this stange problem?
> 
> Best regards,
> Sp3
> 
> _________________________________________________________________
> The new MSN 8: advanced junk mail protection and 2 months FREE* 
> http://join.msn.com/?page=features/junkmail

Are you sure the packets are making it to the firewall? A product like
Ethereal (www.ethereal.com) can be of great help.  If you turn off the
firewall and just route, do you still have the same problem? It is
possible that the two Windows stations can't find each other if they are
not on the same network.  For example, if there is no service location
running such as WINS or DNS, they may try to find each other via
broadcast which will then be blocked by the router (not the firewall).

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



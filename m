From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: DNAT not working
Date: Thu, 18 Mar 2004 15:49:49 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079642989.2006.35.camel@localhost>
References: <000101c40d27$5ce6ed20$0464a8c0@stu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000101c40d27$5ce6ed20$0464a8c0@stu>
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
To: stu@gateway10.homeip.net
Cc: netfilter@lists.netfilter.org

On Thu, 2004-03-18 at 15:26, Stuart Lamble wrote:
> Hello netfilter lists
>  
> Can any one help me here. I have the following rule...
>  
> iptables -t nat -A PREROUTING -i ppp0 -p tcp -d $FW-EXT-IP --dport 22
> -j DNAT --to 192.168.100.6:22
>  
> Simply put I want to allow ssh from the internet to a server on my
> LAN, 192.168.100.6
> My FORWARD rule is default accept.
>  
> I understand that a packet comes into the firewall on an interface and
> then gets PREROUTED as above the gets passed to FORWARD = accept then
> to the destination???
>  
> Why is it not working? Do i need to do any special kernel, modprobe
> things?
<snip>
Perhaps you were just saving typing but isn't the correct syntax -j DNAT
--to-destination 192.168.100.6:22
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



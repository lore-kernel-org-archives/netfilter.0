From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: web server in DMZ
Date: Tue, 28 Sep 2004 06:40:32 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096368031.2050.13.camel@localhost>
References: <web-6416739@infinito.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-6416739@infinito.it>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: hamals@infinito.it
Cc: netfilter@lists.netfilter.org

On Tue, 2004-09-28 at 06:21, hamals@infinito.it wrote:
> I have a big problem
> 
> I have a web server in my DMZ, I reach it with his 
> internal IP 192.168.1.10 from my internal LAN, but I can't 
> reach them with his public IP.
> 
> I did a DNAT and from internet everythings is ok, my web 
> server is working in right by DNAT.
> 
> Where is the problem?
<snip>
There could be several causes.  Did you remember to bind the public
address to the public firewall NIC so that it responds to ARP requests?

For example, if the firewall is at 1.1.1.2 and you want the web server
to be at 1.1.1.3 then do

ip add address 1.1.1.3/24(or whatever the mask bit count is) dev eth0(or
whatever the device name is) brd +

You can find a short slide show on using the ip command at
http://iscs.sourceforge.net 

Good luck - John
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



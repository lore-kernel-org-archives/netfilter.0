From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: NAT question
Date: Fri, 11 Mar 2005 08:06:26 -0500
Message-ID: <1110546386.5659.24.camel@jasiiitosh.nexusmgmt.com>
References: <200503111243.j2BCheOj003886@mail1.firstbhph.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200503111243.j2BCheOj003886@mail1.firstbhph.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Dimitri Yioulos <dyioulos@firstbhph.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Fri, 2005-03-11 at 07:43 -0500, Dimitri Yioulos wrote:
> Hello, all.
> 
>  
> 
> I've recently set up iptables-1.2.8-12.3 on a CentOS 3.4 (RHEL AS 3) box.
> Among other things, I've created a DMZ where my Web and mail servers live.
> My problem is that my Web and mail servers identify themselves with the NAT
> ip address that I've assigned   Here's my NAT rule:
> 
>  
> 
>  IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP
> 
>  
> 
> How can I get these two servers to identify themselves by their own ip
> addresses and still provide NAT for my users?
> 
>  
> 
> Hope I've provided enough info., and my question isn't too lame.
> 
>  
> 
> Many thanks.
<snip>
Certainly we want to welcome and help beginners.  It was a very good
choice to place these public devices behind a firewall rather than
directly on the Internet.  For your own sake, you may want to learn a
little more about NAT so that, armed with the information we give you,
you don't accidentally hurt yourself by some other lack of information.
I do not know a good resource for NAT off the top of my head but for how
iptables NAT works, I started with Oskar Andreasson's great tutorial at
 http://iptables-tutorial.frozentux.net/iptables-tutorial.html
There are also some slightly dated slide shows in the training section
of the ISCS network security management project at
http://iscs.sourceforge.net

On to the specific problem.  To allow inbound NAT (DNAT), you need to do
several things.  First, ensure that you indeed have available public
addresses that you can assign to the DMZ devices.

Next, you will want to bind these two separate addresses (and separate
from your firewall's address) to the firewall's public interface using
iproute2 (see the slideshow about iproute2 on
http://iscs.sourceforge.net).

ip address add x.x.x.?/<masklength> dev eth $INET_INTERFACE
for example ip address add 1.1.1.2/24 dev eth0

Next, you will need to create DNAT rules for each so that the public
address of the public servers is changed to the private address, e.g., 

iptables -t nat -A PREROUTING -d 1.1.1.2 -i $INET_IF -j DNAT --to-
destination 192.168.1.2

If you also want to have those devices use their assigned addresses for
traffic they initiate, you will want a corresponding SNAT rule, e.g., 

iptables -t nat -I POSTROUTING 1 -s 192.168.1.2 -o $INET_IF -j SNAT --
to-source 1.1.1.2

Note that we want this rule to be processed before the general user SNAT
rule.

Finally, you will need rules in the FORWARD chain of the filter table to
allow the DNAT traffic to the DMZ devices using the private address,
e.g., 

iptables -A FORWARD -d 192.168.1.2 -p 6 --dport 80 -j ACCEPT

Finally, there are some DNS issues for your internal users and several
different possible ways to address them.  I believe the issues are
clearly articulated in Oskar's tutorial and he proposes a single DNS
solution.  I have typically used split DNS.

You may also want some general protection rules to stop general attacks
and spoofing.  There are lots of good sources for this.  I think
Shorewall publishes lots of good scripts for such protection.  Some
rules have been posted in the archives.  If you take a look in the CVS
for the ISCS project, you will find the iptables.boot and
iptables.boot.local files.  These contain the general protection rules I
use as well as anti-spoofing rules to prevent both inbound and outbound
(i.e., being a good Internet citizen) spoofing rules.

For an early morning answer after cleaning up a full mug of spilled
coffee and the dog's epileptic seizure, that's all I think you need off
the top of my head.  Good luck - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com



From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: network range
Date: Sat, 03 Apr 2004 17:02:17 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081029635.24411.0.camel@localhost>
References: <web-275929490@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-275929490@mail01.infosat.net>
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
To: IT Clown <iptables@mailbox.co.za>
Cc: netfilter@lists.netfilter.org

On Sat, 2004-04-03 at 15:53, IT Clown wrote:
> How can i create a chaine and a rule that will block all
> the non routed network ranges from entering the network
> from the external interface incase someones trying to spoof
> you?
> 
> when one 
> 
> On Sat, 03 Apr 2004 21:35:21 +0200
>  "IT Clown" <iptables@mailbox.co.za> wrote:
> > Hi
> > 
> > How do you specifiy more than one netwrk range in a rule,
> > is it possible? 
> > 
> > i want to do the following:
> > iptables -A INPUT -s 10.0.0.0/8 169.254.0.0/16 -j DROP
Assume eth0 is public with IP address 1.1.1./241 and eth1 is private
with address 10.0.0.1/24.
I usually implement anti-spoofing in two steps.  For both public and
private interfaces I set up a rule to drop any packets from the address
bound to the interface if it appears on a different interface.  Thus:
iptables -t mangle -A PREROUTING -s 10.0.0.0/24 -i ! eth1 -j DROP
iptables -t mangle -A PREROUTING -s 1.1.1.0/24 -i ! eth0 -j DROP
This is to prevent someone from using my own addresses against me.

Then, for private interfaces only, I set up a separate set of rules to
restrict traffic through an interface to only addresses that live behind
those interfaces.  To the above example, let's add an indirect network
192.168.0.0/24 accessible through eth1 via the router at 10.0.0.5. 
Because I cannot use multiple source addresses in my rule, I set up a
separate user created chain with a drop rule at the end.  Any valid
traffic is returned so that it never hits the drop rule.  Thus:

iptables -t mangle -N MangleSpoof
iptables -t mangle -A PREROUTING -i eth1 -j MangleSpoof
iptables -t mangle -A MangleSpoof -s 10.0.0.0/24 -i eth1 -j RETURN
iptables -t mangle -A MangleSpoof -s 192.168.0.0/24 -i eth1 -j RETURN
iptables -t mangle -A MangleSpoof -j DROP

If I want to do antispoofing on 10.0.0.0/24 but not 192.168.0.0/24, then
I change the 192.168.0.0 rule to:
iptables -t mangle -A MangleSpoof -s 192.168.0.0/24 -j RETURN

Someone else may have a better way but that's how I do it. I use the
mangle table rather than filter so that I can drop bad packets ASAP. 
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



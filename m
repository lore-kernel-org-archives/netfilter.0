From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: AW: bandwidth problems [Linux 2.4.20] [iptables 1.2.7a]
Date: Tue, 10 Feb 2004 14:49:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1076442585.2018.46.camel@ca.gts.nexusmgmt.com>
References: <200402101943.i1AJhR9M012184@nmibwkms1.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200402101943.i1AJhR9M012184@nmibwkms1.nexusmgmt.com>
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
To: XXmas@gmx.at
Cc: netfilter@lists.netfilter.org

On Tue, 2004-02-10 at 14:43, root@scheuchenstuel.com wrote:
> > > Hi!
> > >  
> > > My configuration:
> > > =================
> > > 
> > > O-------------o    O-----------------------o
> > > |    WinXP    |    |    eth0     |   eth1  |
> > > | 10.10.1.100 |----| 10.10.1.254 | D H C P |----INTERNET
> > > |             |    |             |         |
> > > O-------------o    O-----------------------o
> > >   My Computer           My NAT-Computer
> > > 
> > > NAT-Computer:
> > >   Linux 2.4.20-4GB
> > >   load average: 0.08, 0.05, 0.06
> > >   iptables v1.2.7a
> > > All the NICs I use are 3com 3C905-TX
> > > 
> > > When I do some bandwidth tests on the NAT-Computer 
> > (provider's service 
> > > page) my bandwidth is about 1MBit/second When I do the same on my 
> > > computer I only get about 100kbit/second
> > > 
> > > Now I wonder if there are any problems with my configuration...?
> > > Would be nice if you could help me...
> > > 
> > > Thanks in advance
> > > Florian St.
> > > 
> > > Root(AT)scheuchenstuel(DOT)com
> > > 
> > > 
> > > My iptables-configuration:
> > > ==========================
> > > 
> > > 
> > ######################################################################
> > > ######
> > > ######
> > > 
> > > #!/bin/bash
> > > #
> > > 
> > > modprobe iptable_nat
> > > echo 1 > /proc/sys/net/ipv4/ip_forward
> > > 
> > > ########## CLEARING TABLES
> > > iptables -F
> > > iptables -t nat -F
> > > iptables -t mangle -F
> > > iptables -X
> > > 
> > > ########## SETTING POLICIES
> > > iptables -P INPUT DROP
> > > iptables -P OUTPUT ACCEPT
> > > iptables -P FORWARD DROP
> > > 
> > > ########## NAT
> > > iptables -A INPUT -i eth1 -m state --state ESTABLISHED,RELATED -j 
> > > ACCEPT iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
> > > 
> > > ########## LOOPBACK SETTINGS
> > > iptables -A INPUT -i lo -j ACCEPT
> > > iptables -A INPUT -s 127.0.0.1/32 -j ACCEPT
> > > 
> > > ########## EXTERNAL OPEN PORTS
> > > iptables -A INPUT -i eth1 -p tcp --dport 80 -j ACCEPT
> > > 
> > > ########## INTERNAL OPEN PORTS
> > > iptables -A INPUT -s 10.10.1.100/32 -j ACCEPT
> > > 
> > > ######### NAT FORWARDING
> > > iptables -A FORWARD -s 10.10.1.100/32 -j ACCEPT iptables -A 
> > FORWARD -d 
> > > 10.10.1.100/32 -j ACCEPT
> > > 
> > > 
> > ######################################################################
> > > ######
> > > ######
> > 
> > The rules look a little unusual; in fact, they look downright 
> > dangerous.  You may want to read a good iptables tutorial 
> > such as the one by Oskar Andreasson.  You can find a link to 
> > it on the netfilter.org web site.  You can also find some 
> > slide shows in the training section at http://iscs.sourceforge.net
> > 
> > However, I do not think your rules would create a throughput problem. 
> > How are you measuring your throughput?
> > --
> > John A. Sullivan III
> > Chief Technology Officer
> > Nexus Management
> > +1 207-985-7880
> > john.sullivan@nexusmgmt.com
> > ---
> > If you are interested in helping to develop a GPL enterprise 
> > class VPN/Firewall/Security device management console, please 
> > visit http://iscs.sourceforge.net
> > 
> 
> Now i tried to use a script sufggested by Oskar Andreasson
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html#RCFIREWALLTXT
> 
> But the problem is still the same...
> I think there is another problem...
> 
> When i configure&start squid on the NAT-Computer i have full bandwidth...
> 
> I don't know what to do anymore...
> 
> Thanks in advance
> Florian St.
How are you measuring your throughput? What happens if you don't use
squid but allow direct (iptables protected) web access from the client?
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



From: <root@scheuchenstuel.com>
Subject: AW: AW: AW: AW: bandwidth problems [Linux 2.4.20] [iptables 1.2.7a]
Date: Thu, 12 Feb 2004 23:46:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040212224605.KBTO2453.viefep20-int.chello.at@ctxroot>
References: <1076587440.2072.6.camel@ca.gts.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1076587440.2072.6.camel@ca.gts.nexusmgmt.com>
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
To: "'John A. Sullivan III'" <john.sullivan@nexusmgmt.com>
Cc: netfilter@lists.netfilter.org

> > > > > > > > Hi!
> > > > > > > >  
> > > > > > > > My configuration:
> > > > > > > > =================
> > > > > > > > 
> > > > > > > > O-------------o    O-----------------------o
> > > > > > > > |    WinXP    |    |    eth0     |   eth1  |
> > > > > > > > | 10.10.1.100 |----| 10.10.1.254 | D H C P |----INTERNET
> > > > > > > > |             |    |             |         |
> > > > > > > > O-------------o    O-----------------------o
> > > > > > > >   My Computer           My NAT-Computer
> > > > > > > > 
> > > > > > > > NAT-Computer:
> > > > > > > >   Linux 2.4.20-4GB
> > > > > > > >   load average: 0.08, 0.05, 0.06
> > > > > > > >   iptables v1.2.7a
> > > > > > > > All the NICs I use are 3com 3C905-TX
> > > > > > > > 
> > > > > > > > When I do some bandwidth tests on the NAT-Computer
> > > > > > > (provider's service
> > > > > > > > page) my bandwidth is about 1MBit/second When I do the
> > > > > same on my
> > > > > > > > computer I only get about 100kbit/second
> > > > > > > > 
> > > > > > > > Now I wonder if there are any problems with my
> > > configuration...?
> > > > > > > > Would be nice if you could help me...
> > > > > > > > 
> > > > > > > > Thanks in advance
> > > > > > > > Florian St.
> > > > > > > > 
> > > > > > > > Root(AT)scheuchenstuel(DOT)com
> > > > > > > > 
> > > > > > > > 
> > > > > > > > My iptables-configuration:
> > > > > > > > ==========================
> > > > > > > > 
> > > > > > > > 
> > > > > > > 
> > > > > 
> > > 
> ####################################################################
> > > > > > > ##
> > > > > > > > ######
> > > > > > > > ######
> > > > > > > > 
> > > > > > > > #!/bin/bash
> > > > > > > > #
> > > > > > > > 
> > > > > > > > modprobe iptable_nat
> > > > > > > > echo 1 > /proc/sys/net/ipv4/ip_forward
> > > > > > > > 
> > > > > > > > ########## CLEARING TABLES iptables -F iptables 
> -t nat -F 
> > > > > > > > iptables -t mangle -F iptables -X
> > > > > > > > 
> > > > > > > > ########## SETTING POLICIES iptables -P INPUT DROP 
> > > > > > > > iptables -P OUTPUT ACCEPT iptables -P FORWARD DROP
> > > > > > > > 
> > > > > > > > ########## NAT
> > > > > > > > iptables -A INPUT -i eth1 -m state --state
> > > > > ESTABLISHED,RELATED -j
> > > > > > > > ACCEPT iptables -t nat -A POSTROUTING -o eth1 -j 
> > > > > > > > MASQUERADE
> > > > > > > > 
> > > > > > > > ########## LOOPBACK SETTINGS iptables -A INPUT -i lo -j 
> > > > > > > > ACCEPT iptables -A INPUT -s
> > > > > > > > 127.0.0.1/32 -j ACCEPT
> > > > > > > > 
> > > > > > > > ########## EXTERNAL OPEN PORTS iptables -A 
> INPUT -i eth1 
> > > > > > > > -p tcp --dport 80 -j ACCEPT
> > > > > > > > 
> > > > > > > > ########## INTERNAL OPEN PORTS iptables -A INPUT -s
> > > > > > > > 10.10.1.100/32 -j ACCEPT
> > > > > > > > 
> > > > > > > > ######### NAT FORWARDING
> > > > > > > > iptables -A FORWARD -s 10.10.1.100/32 -j ACCEPT 
> iptables 
> > > > > > > > -A
> > > > > > > FORWARD -d
> > > > > > > > 10.10.1.100/32 -j ACCEPT
> > > > > > > > 
> > > > > > > > 
> > > > > > > 
> > > > > 
> > > 
> ####################################################################
> > > > > > > ##
> > > > > > > > ######
> > > > > > > > ######
> > > > > > > 
> > > > > > > The rules look a little unusual; in fact, they look 
> > > > > > > downright dangerous.  You may want to read a good iptables
> > > tutorial such
> > > > > > > as the one by Oskar Andreasson.  You can find a 
> link to it 
> > > > > > > on the netfilter.org web site.  You can also find 
> some slide
> > > > > shows in the
> > > > > > > training section at http://iscs.sourceforge.net
> > > > > > > 
> > > > > > > However, I do not think your rules would create a
> > > > > throughput problem. 
> > > > > > > How are you measuring your throughput?
> > > > > > > --
> > > > > > > John A. Sullivan III
> > > > > > > Chief Technology Officer
> > > > > > > Nexus Management
> > > > > > > +1 207-985-7880
> > > > > > > john.sullivan@nexusmgmt.com
> > > > > > > ---
> > > > > > 
> > > > > > Now i tried to use a script suggested by Oskar Andreasson
> > > > > > 
> > > > > 
> > > 
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html#RCFIRE
> > > > > WA
> > > > > > LLTXT
> > > > > > 
> > > > > > But the problem is still the same...
> > > > > > I think there is another problem...
> > > > > > 
> > > > > > When i configure&start squid on the NAT-Computer i have
> > > > > full bandwidth...
> > > > > > 
> > > > > > I don't know what to do anymore...
> > > > > > 
> > > > > > Thanks in advance
> > > > > > Florian St.
> > > > > How are you measuring your throughput? What happens if
> > > you don't use
> > > > > squid but allow direct (iptables protected) web 
> access from the 
> > > > > client?
> > > > > --
> > > > > John A. Sullivan III
> > > > > Chief Technology Officer
> > > > > Nexus Management
> > > > > +1 207-985-7880
> > > > > john.sullivan@nexusmgmt.com
> > > > > ---
> > > > 
> > > > I use the bandwidth test-page of my provider...
> > > > http://performance.chello.at:81
> > > > 
> > > > What do you mean with "direct" web access ?
> > > > Web access via NAT ?
> > > > I have entered the NAT-computer's IP as default gateway and the 
> > > > provider's DNS-servers as DNS-servers on my PC.
> > > > I think this is what you mean with direct access...
> > > > 
> > > > With this direct access i only get about 100kbit, when i
> > > use squid or
> > > > when i do the tests on the NAT-computer i have full
> > > Bandwidth (around
> > > > 1MBit/sec)
> > > > 
> > > > I think there is a general problem with my configuration,
> > > because the
> > > > bandwidth is no better with iptables-scripts which are
> > > known to work
> > > > fine...
> > > > 
> > > > I really don't know what to do anymore...
> > > > 
> > > > Thanks in advance
> > > > Florian St.
> > > 
> > > As I look at it, unless you have significantly altered 
> your scripts, 
> > > you are probably not using Squid. I see no rule to 
> redirect your web 
> > > traffic to Squid.  What happens if you disable Squid?
> > > 
> > > --
> > > John A. Sullivan III
> > > Chief Technology Officer
> > > Nexus Management
> > > +1 207-985-7880
> > > john.sullivan@nexusmgmt.com
> > > 
> > 
> > Oh no - i never wanted a transparent proxy.
> > I only activated squid to check is there is a general 
> problem with the 
> > configuration of my NICs To test this I entered the NAT-Computer's 
> > IP-address as proxy-address in my browser
> > 
> > When I'm surfing with using the proxy - everything is fine - i have 
> > around 1MBit/sec When I access the internet directly (no proxy --> 
> > NAT) the speed is only about 100kBit/sec
> > 
> > Thanks in advance
> > Florian St.
> 
> Ah, interesting.  What is the maximum bandwidth of your 
> connection? I know it's a silly question for a test site that 
> I'd imagine is not using cached data but could it be that the 
> 1 Mbps results are somehow related to the cache? What happens 
> if you connect a station directly to the Internet on your 
> ISP's link? Do you see the same poor throughput? - John
> --
> John A. Sullivan III
> Chief Technology Officer
> Nexus Management
> +1 207-985-7880
> john.sullivan@nexusmgmt.com
> 

My provider gave me around 600kbit - a few days ago my provider sent
me mail that the downstream-bandwidth was increased to 1MBit/sec
There was also a link how to ensure to have 1MBit/sec

I tested the bandwidth with downloading from another server which is NOT
connected to my ISP directly - my connection HAS the speed of 1MBit, but
Somehow the bandwidth is limited in my little iptables-NAT-computer..

Maybe i should try to install newer kernel and/or iptables !?
But that's no solution of the problem...

Nice Greetings from Austria (the really small country in europe - not the
big one called "Australia" *lol*)
Florian St.



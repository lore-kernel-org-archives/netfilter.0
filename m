From: Ben Russo <ben@umialumni.com>
Subject: Re: To REDIRECT, DNAT or something else
Date: 26 Nov 2002 09:31:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038321105.13699.19.camel@ben.mis.tnsi.com>
References: <F168SlVviFluZw0VclX000110a1@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F168SlVviFluZw0VclX000110a1@hotmail.com>
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
To: Joel Linuxdude <linuxlists@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Mon, 2002-11-25 at 18:43, Joel Linuxdude wrote:
> I just had a small question (maybe dumb, I dont care).
> 
> My firewall PC is also my DNS server (caching), gateway to
> the internet via cable modem, web server, ftp server and
> later my proxy server.
> 
> Do I need to REDIRECT packets coming into eth0 (from the
> cable modem) to the firewall itself?? I know, the packets
> are suppose to go right to INPUT chain but people over
> the internet can no longer access my WWW, FTP or TELNET
> daemon. I fear A) The cable modem company are blocking
> the use of servers or B) I screwed up somewhere in my
> firewall script.
> 
> HOW CAN I MAKE SURE ALL TCP/UDP PORT 20,21,22,23,80,443
> GO FROM CABLE MODEM ON ETH0 TO MY FIREWALL AND NOT GET
> FORWARDED OVER ETH1 TO MY LAN?

Assuming you have only 2 interfaces on your firewall
and the internal interface has only one subnet.

In the POSTROUTING rules set your MASQUERADE rule
for source $INTERNAL_SUBNET where -o $EXTERNAL_INTERFACE

Set your FORWARD policy to DROP
Allow only ESTABLISHED,RELATED in your FORWARD rule set
for -d $INTERNAL_SUBNET
Allow NEW,RELATED,ESTABLISHED in your FORWARD rule set
where source is $INTERNAL_SUBNET and -i $INTERNAL_INTERFACE

Set your INPUT policy to DROP
Allow INPUT of RELATED,ESTABLISHED
In the INPUT rules allow NEW to come
into tcp ports 20,21,22,23,80,443 for -i eth0

Allow -i eth0 -udp --sport 67:68 --dport 67:68
in INPUT for the DHCP traffic from your cable


and you also might want *some* ICMP
-A INPUT -p icmp -m icmp --icmp-type 0 -j ACCEPT
-A INPUT -p icmp -m icmp --icmp-type 3 -j ACCEPT
-A INPUT -p icmp -m icmp --icmp-type 4 -j ACCEPT
-A INPUT -p icmp -m icmp --icmp-type 5 -j ACCEPT
-A INPUT -p icmp -m icmp --icmp-type 11 -j ACCEPT
-A INPUT -i eth0 -p icmp -j DROP




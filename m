From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Netfilter and Vonage.
Date: Thu, 20 May 2004 01:14:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1085030073.19632.8.camel@localhost>
References: <20040519233740.A27043@redfish.gatech.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040519233740.A27043@redfish.gatech.edu>
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
To: Jason Price <jprice@cyberbuzz.gatech.edu>
Cc: netfilter@lists.netfilter.org

I'll make a couple of comments in the text in brackets [].  Please be
aware that I am not an iptables guru.

On Wed, 2004-05-19 at 23:37, Jason Price wrote:
> Running Gentoo, kernel version 2.4.24 on a Sparc Ultra 10
> 
> I have recently purchased Vonage Voice over IP.  In their 'how to make this
> work with a linksys device', they say (basically):
> 
> Forward udp ports 53, 69, 5060, 5061, and 10000-20000 to the device.
> 
> I interpret this to mean:
> 
> iptables -t nat -A PREROUTING -i eth0 -p udp -d $EXTERNAL_IP \
> 		--dport 53 -j DNAT --to 192.168.0.5:53
> 
> etc for each port.
> 
> Unfortunatly, I don't seem to be able to specify a range of ports in the
> iptables syntax.  So, when I get to that large, 10,000 wide range of ports,
> it dies.  After much tinkering, I find that I can do:
> 
> for port in {10000..10597}; do
>    iptables -t nat -A PREROUTING -i eth0 -p udp -d $EXTERNAL_IP \
> 		--dport $port -j DNAT --to 192.168.0.5:${port}
> done
> 
> and it will work.  If I do just 1 port more, iptables fails, and all the
> tables get magically flushed (which isn't a good idea by the by, but we'll
> get there later).
[JAS - When adding lots and lots of rules, it is much better to use the
iptables-restore syntax and method.  Otherwise each iptables command
must examine each of the previous rules.  It grinds to a halt after a
few thousand.  Create one miserable, monster file with all the rules
according to the iptables-restore syntax and then load it all at once. 
However, depending on how you interpret my following comments, you may
not need to do even this.]
> 
> Idealy, I'd like to:
> 
> iptables -t nat -A PREROUTING -i eth0 -p udp -d $EXTERNAL_IP \
> 		--dport 10000-20000 -j DNAT --to 192.168.0.5:10000-20000
[JAS - I believe you can with a minor change in syntax:
iptables -t nat -A PREROUTING -i eth0 -p 17 -d $EXTERNAL_IP --dport
10000:20000 -j DNAT --to-destination 192.168.0.5:10000-20000
Notice how a port range is specified differently for --dport than it is
for --to-destination.  However, I do not believe that you are absolutely
assured that the ports will directly map, i.e., 13567 will always mapto
13567, etc.  I believe the literature states that iptables will alter
the port only as a last result but, if necessary, it will alter the
port.  If you absolutely must preserve the port mapping even in the most
extreme circumstances, you may have to go with 10001 individual rules. 
If I am wrong about this, would someone please correct me.]
> 
> and call it a day.
> 
> Their table that describes this (text version of the linksys web
> configuration tool.  '_' are unchecked boxes, 'X' are checked boxes):
> 
> Ext.Port		Protocol	Protocol	IP		Enable
> 			TCP		UDP
> 53 to 53		_		X		192.168.0.5	X
> 69 to 69		_		X		192.168.0.5	X
> 5060 to 5061		_		X		192.168.0.5	X
> 10000 to 20000		_		X		192.168.0.5	X
> 
> Any help would be greatly appreciated.
> 
> Thanks;
> --Jason
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



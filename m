From: mclinden@informed.net
Subject: RE: Simple Blackberry Enterprise configuration
Date: Wed, 17 Nov 2004 13:30:03 -0500
Message-ID: <OF7FC3DD38.EC276557-ON85256F4F.00658DF0-85256F4F.00689762@informed.net>
References: <29F6FAF7F2C0D41190980002A513591E0E93BA73@FSNSAB30>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <29F6FAF7F2C0D41190980002A513591E0E93BA73@FSNSAB30>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: 'Daniel Chemko' <dchemko@smgtec.com>

Sorry to not be so clear (and as for security, I don't really have a 
choice in this situation).

Blackberry's Enterprise Server for Microsoft Exchange apparently supplies 
access to wireless users by mapping between the external service 
(srp.na.blackberry.net) and a protected Exchange Server using a port 3101 
hole in the firewall.  Their documentation states that they require 
bidirectional connections initiated from the internal server. You can also 
use a transparent proxy but we only proxy HTTP/HTTPS via Squid 
(non-transparently) and don't, normally, use firewalls at all. Blackberry 
uses something they call the Server Relay Protocol but all I can find 
about it is that it uses port 3101 and is TCP based.

The external interfaces on the Linux box is managed by TCPWRAPPERS but I'd 
like to have the service restricted even more so that only the Blackberry 
Enterprise Server can FORWARD through the firewall and ONLY to the 
Blackberry site:

The internal server Blackbery  IP is:   172.16.8.39
The internal firewall (eth1) is:                172.16.11.242
The external firewall (eth0) is:                aaa.bbb.ccc.ddd

My configuration is:

-A FORWARD -i eth1 -p tcp -m tcp --sport 3101 --dport 3101 -j ACCEPT 
-A FORWARD -i eth0 -o eth1 -p tcp -m tcp --sport 3101 --dport 3101 -m 
state --state RELATED,ESTABLISHED -j ACCEPT 
-A FORWARD -j REJECT --reject-with icmp-port-unreachable 

(I started out with a relatively open configuration so as not to introduce 
too many problems). 

This doesn't seem to be doing it.

Thanks for all your help.

Sean








Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Sent by: netfilter-bounces@lists.netfilter.org
11/17/2004 01:12 PM
 
        To:     "'Daniel Chemko'" <dchemko@smgtec.com>, 
mclinden@informed.net, netfilter@lists.netfilter.org
        cc: 
        Subject:        RE: Simple Blackberry Enterprise configuration


i would be very wary as regards rim's netsec.
v/r,piranha


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Daniel Chemko
Sent: Wednesday, November 17, 2004 10:06 AM
To: mclinden@informed.net; netfilter@lists.netfilter.org
Subject: RE: Simple Blackberry Enterprise configuration


mclinden@informed.net wrote:
> I have two users who need to be able to ORIGINATE bidirectional
> communication from an internal site using port 3101 in order to read
> e-mail using their Blackberries and the Server Relay Protocol. This
> should be fairly simple but if anyone has done this and could point
> me to a reference it would be appreciated.
> 
> Sean McLinden
> Allegheny County Health Department

You want to force the source address of the transmission? I doubt that
Rim would care which source port the data's coming from. More
importantly, are you having a problem connecting them to your internal
network's BB server from outside the company?

I'm not sure of the security of the BB server, so this may make your
systems very insecure, but if you wanted your internet server visible to
the internet, you'd add the following to a typical restrictive netfilter
firewall configration.

iptables -A PREROUTING --destination ${IN_ADDR} -p tcp --dport 3101 -j
DNAT --to ${BB_SERVER}
iptables -A FORWARD --destination ${BB_SERVERR} -p tcp --dport 3101 -j
ACCEPT





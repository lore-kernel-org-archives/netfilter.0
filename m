From: Philip Pemberton <usenet06@philpem.me.uk>
Subject: NATing on a single interface?
Date: Thu, 26 Oct 2006 10:08:38 +0100
Message-ID: <ehptuc$bo6$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,
   I've got an ADSL router with a built-in firewall. It's a nice little box,
the ADSL front-end is solid (and ADSL2+ compatible, which is nice). Only
problem is, it has a maximum of 16 firewall port-forward rules and no support
for time-based firewalling. What I'd like to do is make the router forward
packets onto my firewall box, then have iptables deal with NATing and stuff 
like that.

   At the moment, the network looks like this:
ADSL ---SpeedtouchUSB@ppp0---> FIREWALL ---eth0---> Other machines

   What I want is something more like:

         10.1.0.2  10.1.0.1   10.0.0.1      10.0.0.0/16
ADSL Router ----------> Firewall ------(nat)-----> LAN

ADSL Router: 10.1.0.2/16
Firewall: 10.0.0.1/16 and 10.1.0.1/16
LAN: 10.0.0.0/16

   Ordinarily I'd fit another NIC into the firewall, then use Arno's IPtables 
script to do the NATing from eth0 (external) to eth1 (internal). Problem is, 
the firewall server can't take another NIC - it's only got one onboard and no 
facility to add another (the server is a Linksys NSLU2 - an embedded server in 
other words) unless I add a USB adapter, which would be a bit less than ideal 
for LAN routing (I hear the USB adapters are quite slow and prone to packet loss).

   So what I'd like to do is have the DSL router forwarding to the firewall 
server, then have the firewall server do NATing and firewalling for the entire 
LAN subnet, all on a single interface. Is this doable, or do I really need to 
add another Ethernet interface?

   I've read a few IPtables HOWTOs and I just don't understand how it's all 
supposed to work (which is why I used the Arno script in the first place)...

Thanks.
-- 
Phil.                         |  (\_/)  This is Bunny. Copy and paste Bunny
usenet06@philpem.me.uk        | (='.'=) into your signature to help him gain
http://www.philpem.me.uk/     | (")_(") world domination.
If mail bounces, replace "06" with the last two digits of the current year.



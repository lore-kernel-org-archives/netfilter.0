From: Fisher Alex <Alex.Fisher@uk.thalesgroup.com>
Subject: Is this possible?
Date: Thu, 22 Apr 2004 12:30:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4087ACE0.1020006@uk.thalesgroup.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi.

I'll do my best to explain what I'm trying to acheive with a linux box 
and 3 NICS.

I have two sets of systems.  Each system has about 30 IP addresses 
spread across various bits of hardware.  The two systems are identical 
(ie have the same 30 IP addresses).  The addresses are all part of the 
class C subnet 192.168.0.*

The IP addresses for each system are now set in stone and can't be 
changed.  Furthermore, similar addresses are already in use on our network.

I've been given a set of IP addresses I CAN use (172.26.158.*)

A diagram might help here ...

   -----------        -----------------
   - System1 ---------|eth1            |
   -----------        |                |
                      |  Linux Router  |
                      |            eth0|------------Rest of the network
                      |                |
   -----------        |                |
   - System2 ---------|eth2            |
   -----------        ------------------

I also have an address I can use for eth0 which will make the router 
visible from machines on the rest of the network.  This can be set as 
the default gateway for connections to the 172.26.158.* subnet.

I would like PCs on the normal network to be able to connect with either 
system by addressing them with addresses off the 172.26.158 subnet. 
I'll assign 30 of these IPs to each system.

For example. 172.26.158.10 might be mapped onto 192.168.0.2 on eth1
whilst  172.26.158.50 might be mapped onto 192.168.0.2 on eth2

Is this at all possible?  I assume I'll need to use at least DNAT but 
also apply some other trickery to route to the correct interface.  As a 
newbie to IPTables, I'm not sure how I might even begin to set up rules 
for this.

Hopefully this is the sort of thing people want to do all the time and 
it will be easy :)

Any help would be very much appreciated.

Thanks,

Al




This email and any attachments are confidential to the intended recipient
and may also be privileged. If you are not the intended recipient please
delete it from your system and notify Thales Underwater Systems on +44 1963
370 551. You should not copy it or use it for any purpose nor disclose or
distribute its contents to any other person.


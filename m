From: Roman <maillists@gmx.ch>
Subject: Firewall with only one eth0 device: possible?
Date: Tue, 31 May 2005 18:41:22 +0200
Message-ID: <429C93B2.7040001@gmx.ch>
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

I have an embedded system running uclinux with just one ethernet device 
and wonder whether or not I can build a firewall in combination with a 
switch (VLAN support, not WLAN).

How I thought it could work is the following:

Configure the eth0 device with an ip and network mask.
Configure the eth0:0 alias device with an ip and network mask different 
from eth0.
Use a switch with VLAN support.
Connect the eth0 linux device to port B of the switch; switch port A 
will then be one side of the firewall and port C the other side.
Configure the switch (VLAN) in a manner so all the incoming traffic on 
switch port A will be routed to port B and all the incoming traffic on 
port B will be routed to port C and back to port A.
Finally everything that enters port C will be routed to port B.


The question about all this is: Will the traffic be filtered between 
eth0 and eth0:0 as if there were two physical devices eth0 and eth1?

Thanks for any remarks on that.

roman


PS.: I know, this is an unusual way to build a firewall, but I simply 
can not change the hardware. For everyone who thinks, it is insecure 
because of none existing  physical separation: please forgive me.





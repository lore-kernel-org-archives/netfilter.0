From: Klaus.Frank@selex-comms.com
Subject: PROXY Arp and VLAN
Date: Wed, 18 Jul 2007 08:13:34 +0200
Message-ID: <OF5250BB5F.BB210A5B-ONC125731C.00222C2A-C125731C.00223407@Selex-Comms.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

sorry if this is the wrong place to ask my questions. But maybe you've got 
a minute to read which problem I've got and direct me to a better place or 
even help me to solve my problem.

There is a subnet consisting of a PC, a box with an ethernet interface, 
some IP phones and a router to another subnet with some IP phones and the 
counterpart of the box..
The PC has two ethernet ports eth0 and eth1.
The PC is mainly used for VoIP using Asterisk on eth0.
The box is connected to eth1and PROXY ARPed to eth0 because the box does 
not have a subnet mask or default gateway address.
I'm using CentOS3 kernel version is 2.4.21-50EL
Things are working fine and stable.

Now I must virtually separate VoIP data and data from the box using 2 
VLANs. All IP phones support VLAN, the box does not support VLAN.

Surfing the internet gave me some idea that VLAN, iptables and bridging 
could do the job, but I can't figure out how to configurate it.

Thanks 



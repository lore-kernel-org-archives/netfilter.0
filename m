From: Dave Johnson <davejohnson_hifi@yahoo.com>
Subject: Help needed for a box with 4 Ethernet Interfaces
Date: Thu, 4 Aug 2005 09:11:42 -0700 (PDT)
Message-ID: <20050804161142.23403.qmail@web30115.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

Hi All:
I need help to setup my box with some complicated configuration.

I have a box with 4 Ethernet Interfaces:

Eth0: 172.16.6.10
Eth1: 192.168.0.1/24
Eth2: 10.1.1.0/24      ------> Connected to a box A with an IP address of 192.168.0.2
Eth2: 21.21.21.9/24    ------> Connected to a box C with an IP address of 192.168.0.1 (which is
same as IP address of Eth1)

Loopback Interface: 192.168.0.3
                                                                         ------------
                                            -----------------------------|  Box D   |
                              172.16.6.10   |                            |          |
         Mgmt Port<---------------------|   |                            ------------
                                        |   | 192.168.0.1                 192.168.0.2
                                   Eth0 |   | Eth1 (for internal network)
 ------------                        ------------                        ------------
 |  Box A   |________________________|  Box B   |________________________|  Box C   |
 |          |                    Eth2|          | Eth3                   |          |
 ------------     10.1.1.0/24        ------------       21.21.21.9/24    ------------             
  192.168.0.1                         192.168.0.3                         192.168.0.2

Here is what I want to do:
Packets from Eth2 should only go to Eth3 except the ones detined to Eth0's IP.
Packets from Eth3 should only go to Eth2 except the ones detined to Eth0's IP.
Local packets destined for Eth1's ip and its subnet should be forwarded via Eth1 only.
Packets from Eth1 can only be directed to Eth0. 

This will allow me to ping Box A (192.168.0.1) from Box C (192.168.0.2) without getting a response
from Box B who has local interface with address 192.168.0.1.

Basically I want to isolate interfaces in 2 groups:
One with Eth0, Eth2 and Eth3
Second with Eth0 and Eth1.

I tried IPtables and multiple routing tables but it did not work. I think I need some directions
as to how would this even be possible.

Thanks

Dave.



__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 


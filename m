From: ramsurrunv@mx.uom.ac.mu
Subject: Problem with arptables!!
Date: Wed, 24 May 2006 11:44:54 +0400 (MUT)
Message-ID: <1106.172.22.62.53.1148456694.squirrel@mx.uom.ac.mu>
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

Hi to all,

I have been trying to use arptables to forward arp requests from PC_A to
PC_B via PC_C. All three PCs are connected to a switch and have ip
addresses 192.168.10.2, 192.168.10.3 and 192.168.10.4 respectively. I use
ebtables on PC_A to change the destination mac address of the Ethernet
frame containing the arp packet to that of PC_C, using the following
command:

ebtables -t nat -A OUTPUT -p arp -o eth0 -j dnat --to-dst
00:04:e2:51:c6:4e --dnat-target ACCEPT

I use the following command on PC_C:

arptables -A FORWARD -s 192.168.10.0/24 -d 192.168.10.0/24 -i eth0 -o eth0
-j ACCEPTable

When I do arptables -L -v, the pcnt and bcnt values remain zero.

On PC_C, i have compiled a new kernel (2.6.16) and have selected the
options regarding arptables, namely arp packet filtering and arp payload
mangling. I have not installed ebtables on PC_C but I have checked all the
ebtables options in the kernel.

What am I doing wrong?

Any help will be the very most welcome..

Warm regards,
Visham




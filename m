From: Phani Kumar <pkumar@students.iiit.net>
Subject: Stop ARP Broadcasting
Date: Wed, 2 Mar 2005 01:56:07 +0530 (IST)
Message-ID: <Pine.LNX.4.44.0503020149040.11517-100000@students.iiit.net>
References: <200412151812.iBFIC9t0023303@students.iiit.net>
Mime-Version: 1.0
In-Reply-To: <200412151812.iBFIC9t0023303@students.iiit.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,
      I have setup a Router with 3 interfaces as follows.
eth0 -- External Network
eth1 & eth2 -- Internal Network

I am getting unusual ARP traffic continuously  on both the interfaces.
i.e I am getting ARP packets for every IP address in that subnet.
How shall I restrict that packets from thos interfaces.

I used ebtables for restriciting ARP traffic.

For Eg
 ebtables -A FORWARD -p arp -i eth1 --arp-ip-dst 172.17.3.0/24 -j 
DROP

Even then I used above rule , the packets are not dropped.
Can anyone give me a way to stop that unusual ARP traffic from the network 
using some rules.

Thanks In Advance
Phani Kumar
IIIT-Hyd
India




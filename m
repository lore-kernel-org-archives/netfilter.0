From: Christophe SUIRE <christophe.suire@adelux.fr>
Subject: NAT performance
Date: Thu, 12 May 2005 23:24:16 +0200
Message-ID: <80E06785-6636-4481-ABD1-6C6C28D52629@adelux.fr>
Mime-Version: 1.0 (Apple Message framework v728)
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I have done some tests, and i'm surprise with the poor result with NAT.
I have a linux firewall, 2.6.8 kernel, one card for public network,  
and one card for the lan.
All cards are giga bit cards.
I have 10 PC which are each in a VLAN, and with a gateway which is  
the virtual VLAN interface under the firewall link with the lan card.
I have 5 switch with a 100Mbit/s uplink to the firewall (with a giga  
bit backbone switch). I have 2PC under each switch. So in theory each  
PC have 50Mbit/s of bandwidth.
Each PC have 10 alias ip, so i have 10 networks with 10 virtuals  
clients under each network.
So each virtual client (100) have 5Mbit/s of bandwidth.
On the firewall each vlan network is SNAT to go out to the internet.
My bandwidth test is done with TPTEST, and a TPTEST server under the  
public network of the firewall.
My procedure is : tcp-receive of 50Mo
     launch the test for 1 virtual client and get the time
     launch the test for 2 virtuals clients together and get the time  
for each
     ....
     launch the test for 100 virtuals ...

When i do my test without NAT, just routing, the total bandwidth used  
is near to 500Mbit/s, which is great !
But when i do my test with NAT, the total bandwidth used is near to  
170Mbit/s !!! So i have an import drop of the performance !
And this bandwidth is the same from 20 virtuals clients to 100  
virtuals clients.
So i understand that NAT need to rewrite all packets .. but here the  
performance is very poor.
If someone can explain me why ??

Thanks a lot
Christophe SUIRE


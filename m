From: Marcin Giedz <marcin.giedz@eulerhermes.pl>
Subject: Forward port 80 (www) to other router..
Date: Fri, 18 Feb 2005 18:38:40 +0100
Message-ID: <200502181838.40615.marcin.giedz@eulerhermes.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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

Hello..

Here is the problem: I have two routers connected to two different providers. 
Both routers have internal interfaces in my LAN.

router1
provider1<----------->eth0---------linux---------eth1<------------>LAN 
(192.168.49.101)
router2
provider2<----------->eth0---------linux---------eth1<------------>LAN 
(192.168.49.10)

Nowadays all clients in LAN have set up router1 as the default gateway so all 
traffic is forwarded to this router1 (www e.g.). Now I'd like to forward all 
www traffic to router2 from all my clients. I know this should be done on 
router1 with some iptables rules but I'm rather fresh in netfilter so if it 
possible please help me ;)

Thanks,
Marcin


From: Claudio Lavecchia <Claudio.Lavecchia@eurecom.fr>
Subject: Blocking forwarding of packets in WLAN
Date: Thu, 14 Oct 2004 15:38:03 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <416E813B.8090704@eurecom.fr>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello you ppl,
 
I am a real newbie to iptables/ipchains/netfilter issues, so please if 
any of you can help me, please consider my illetteracy.
I have a really simple question for which I did not find an answer 
browsing the website.
 
If I understood correctly there are no C APIs to iptables and this leads 
me to troubles: I am writing a linux daemon that monitors network 
traffic and does something when some conditions occur. I work with 
mobile ad-hoc networks where each node acts as a relay for other nodes 
traffic, so the background are WLANs.
I need to write a C function that blocks forwarding of packets that come 
from a given node of the network, identified by its MAC address.
 
Prototype for my function is then:
 
void block_forwarding(char * MAC_address);
 
Is this feasible someway using iptables? Can anyone give me a precise 
hint on how to do that? I would be truly grateful if someone could help me.
 
Thanks
 
Claudio
 



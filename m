From: Kevin de Kok <kevin@oom-killer.org>
Subject: More gateways in the same subnet
Date: Sun, 27 Mar 2005 01:14:57 +0100
Message-ID: <4245FB01.6080204@oom-killer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

I have a linux router in my lan with two nic's to two isp's and i also 
have two nic's for the lan. I have on eth0 the ip from ISP1 on eth2 the 
ip from ISP2 on eth1 i have 192.168.1.1 and on eth3 i have 192.168.1.2. 
What i'am trying to is when i give 192.168.1.1 as gateway on a client in 
my  lan then the traffic go's over ISP1 and when i give  as gateway 
192.168.1.2 that the traffic go's over ISP2. How can i manage this?


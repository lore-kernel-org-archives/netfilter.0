From: Chris Edwards <chris@wfcs.co.uk>
Subject: Rule syntax
Date: Tue, 1 Mar 2005 11:39:22 +0000
Message-ID: <OF2F83684D.39A32C6C-ON80256FB7.003F7754-80256FB7.0040285E@wyrecompute.com>
Mime-Version: 1.0
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

Need a bit of help with a rule. I've got a redhat box running a 
squid/websense installation. It's dualled interfaced on different network, 
and due to an update websense has done, is only contactable on the 
interface which can't see the default gateway. TO cut a long story short 
it aint working unless i can convince the reply packets to leave out the 
same interface. Putting a route in works for some but not all users, what 
i really need is to be able to redirect all the request as they try to go 
out eth1 to the gateway on eth0.

I've been trying this command:-

/sbin/iptables -t nat -A PREROUTING -o eth1 -p tcp --sport 15871 -j 
REDIRECT -d xxx.xxx.xxx.193
or
/sbin/iptables -t nat -A OUTPUT -o eth1 -p tcp -s xxx.xxx.xxx.xxx -j 
REDIRECT -d xxx.xxx.xxx.193

I'm really new to iptables, only having done what the squid installation 
required, can anyone help with how to write a rule that does what i need?

Chris
===============================================
If the only tool you have is a hammer, every problem looks like a nail.


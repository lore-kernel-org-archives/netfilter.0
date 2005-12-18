From: wlagmay@yanbulink.net
Subject: help on script
Date: Sun, 18 Dec 2005 09:07:32 +0300
Message-ID: <1134886052.43a4fca4a964c@webmail.yanbulink.net>
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



Hi all,

I have a problem and and idea to solve it but I dont know how can I implement
it. This is the scenario:

I have a main proxy server (main proxy) configured with round-robin options and
connected to 2 parents proxy (proxy 1 and proxy 2. Everything is working fine
but if proxy 1 or proxy 2 connection to the internet fails and the connection
between the main proxy and the parents proxy still alive the main proxy still
do round-robin request to both proxy which causes the page to sometimes not
opening and sometimes opens.

now my solution is this from proxy 1 and proxy 2 since both machines have 2 NIC
eth0 connected to lan and eth1 connected to the internet I will create a script
pinging the internet, if the system determined that the internet is dead it
will issue a command ifconfig eth0 down then when the system determined that
the internet is alive it will issue a command ifconfig eth0 up.

Can anybody help me on this kind of script, a script that is based on ttl reply


thank you very much,

Wennie




From: Marcin Giedz <marcin.giedz@eulerhermes.pl>
Subject: IP:Port REDIRECT problem
Date: Sun, 24 Jul 2005 10:45:53 +0200
Message-ID: <42E35541.9050205@eulerhermes.pl>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

I'd like to redirect one of my services from one public IP:port to other 
one:

Internet -----------> Public_IP 1.2.3.4:4000 GATEWAY1 Internal_IP 
192.168.49.1 <--------------> SERVICE SERVER (192.168.49.10), default 
GATEWAY1 <------------------> Internel_IP 192.168.49.2 GATEWAY2 
Public_IP 4.3.2.1:4000 ----------> Internet

As you can see default gateway for SERVICE SERVER is GATEWAY1. In 
GATEWAY1's iptables rules there is redirection rule for port 4000 to 
SERVICE SERVER:4000. In such configuration everything is OK, I can run 
service from Internet via GATEWAY1:4000. But I also want to run this 
services via GATEWAY2:4000. I tried redirection from GATEWAY2 to 
GATEWAY1 via public IPs but it doesn't work.

Is it possible to do it?

Thanks,
Marcin


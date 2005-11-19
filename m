From: "P theodorou" <props666999@hotmail.com>
Subject: outbound policy for tcp 80
Date: Sat, 19 Nov 2005 22:39:47 +0000
Message-ID: <BAY102-F20600188C76B3E66662EBAE510@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have restricted all the connections apart from port 53, 443 and 80 on the 
forward chain. My computer uses eth1 with eth0 beeing the firewall computer.

Unfortunately when testing the outbound performance of the firewall with 
leak testers etc.. (little applications on the web) i discover that they use 
port 80 to transmit info to remote hosts. Fine and logical . How can i avoid 
this using iptables rules. I do need though Internet access.


Regards




From: Bobo <boboaq@163.com>
Subject: How to use more IP address for one netcard in Iptables?
Date: Tue, 1 Apr 2003 11:30:43 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030401033056.725471C9C1C78@sm204.163.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org, netfilter@lists.netfilter.org

Hi

    While  use Iptables as the gateway of my LAN,I would like to use NAT.
 
   I have six   C class address,and I want to use it on one netcard eth0 for NAT.

   Must I bind the six IP address with eth0 step by step under linux ?

  Could I use the six IP address in the Shell scripts while only bind one Ip address 
   with netcard eth0 ?

  Thanks a lot.

   



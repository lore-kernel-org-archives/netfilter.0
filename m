From: "Wennie V. Lagmay" <wlagmay@yanbulink.net>
Subject: routing within same nic card
Date: Tue, 31 May 2005 08:20:57 +0300
Message-ID: <000a01c565a0$867deee0$d40aa8c0@winxp>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hello,

I have 1 NIC card with 2 ip address:
IP1 = 192.168.3.1/255.255.255.192
Network 1 = 192.168.3.0/255.255.255.192

IP2 = 192.168.4.1/255.255.255.248
Network 2 = 192.168.4.0/255.255.255.248

My question, how can workstations from network 1 reaches the workstations in 
network 2 and vice versa  using IPtables?

Thanks,

Wennie 



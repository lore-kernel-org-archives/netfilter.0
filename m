From: Paul <kerpux@unix-like.net>
Subject: Redirecting packets between two interfaces with iptables
Date: Fri, 21 Mar 2003 20:35:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030321183552.GA3757@kibirinis>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

maybe you can help me and suggest something.
I have linux router with two interfaces: 
eth0: 192.168.4.1 and eth1: 10.1.1.1. I want redirect all packets coming from
10.1.1.2 box with destination address 227.0.0.2 and port 8169 to 192.168.4.0 
network and vice versa. I have read many netfilter manuals, but I think I something
missed. 

Thanks a lot,
Paul


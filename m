From: Michael Gale <michael.gale@utilitran.com>
Subject: Overruns ?
Date: Thu, 19 Feb 2004 08:32:22 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040219083222.7e4dc5a3@mgalepc.utilitran.com>
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
To: netfilter@lists.netfilter.org

Hello,

	Not sure if this is the place to ask but when I do a ifconfig I see some
overruns. I have tried google and man ifconfig but can not find what a "overrun"
is.

eth0      Link encap:Ethernet  HWaddr 00:E0:81:25:A6:92  
          inet addr:10.10.10.173  Bcast:10.10.10.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:9639161 errors:0 dropped:0 overruns:0 frame:0
          TX packets:9598780 errors:0 dropped:0 overruns:21 carrier:0
          collisions:0 txqueuelen:100 
          RX bytes:2726609687 (2600.2 Mb)  TX bytes:1986194437 (1894.1 Mb)
          Interrupt:10 Base address:0xb000 



-- 
Michael Gale
Network Administrator
Utilitran Corporation


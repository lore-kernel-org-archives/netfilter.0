From: Andreas Meyer <anmeyer@gmx.net>
Subject: strange connetions to exodus.net
Date: Sat, 21 Feb 2004 12:25:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040221122547.1cb9a3eb.anmeyer@gmx.net>
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

Hello!

Just wrote a little iptables-script not allowing connections
to port 80.
Now in the log I see this:

Feb 21 11:53:41 delta kernel: DROP-TCP :IN= OUT=eth1 SRC=192.168.20.60 \
 DST=209.225.0.6 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=22160 PROTO=TCP \
 SPT=41197 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0

It seems that with every request to a website there is also a request to
IP 209.225.0.6 wich leads to exodus.net.

I am completely worried about this. Who can tell me what is going on?


Regards
-- 
   Andreas Meyer


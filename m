From: "hare ram" <hareram@sol.net.in>
Subject: traffic counting
Date: Fri, 2 May 2003 13:40:24 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <06fd01c31082$49a13380$13fcc5cb@Housecall>
Reply-To: "hare ram" <hareram@sol.net.in>
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
To: netfilter@lists.samba.org

Hi all

i have market the packet for shaping just test setup

any ip source from myip should mark, and iam doing shaping( thats next
matter)
but when i give below command, iam not able to see in and out bytes , its
shows *

how can i get this results( both in and out bytes,), iam able to see total


[root@bridge root]# iptables -xnvL -t mangle
Chain PREROUTING (policy ACCEPT 382274 packets, 41589233 bytes)
    pkts      bytes target     prot opt in     out     source
destination
    1024   197338 MARK       all  --  *      *       myip       0.0.0.0/0
MARK set 0x1


hare



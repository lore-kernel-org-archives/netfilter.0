From: "Peter Marshall" <peter.marshall@caris.com>
Subject: why am I getting this syn packet
Date: Wed, 19 Jan 2005 10:59:18 -0400
Message-ID: <JKENKBGIPCFNFMNFENJPCEMICJAA.peter.marshall@caris.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>


I have a stand alone proxy server in my dmz.  It has an internal IP (that
internal users connect to), and an external IP.
I am seeing the following on my internal firewall logs.  I am not sure why
the proxy would be trying to send a syn packet to the internal.


Jan 19 10:56:40 radium kernel: DROP: prxy-int IN=eth1 OUT=eth0
SRC=192.168.1.254 DST=192.168.201.109 LEN=60 TOS=0x00 PREC=0x00 TTL=63
ID=57253 DF PROTO=TCP SPT=60145 DPT=113 WINDOW=5840 RES=0x00 SYN URGP=0

Thanks,
P


